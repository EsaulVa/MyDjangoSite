from django.shortcuts import render
from django.http import HttpResponse
from myapp.models import *
from django.views import *
from django.template.loader import render_to_string
from django.shortcuts import render
from myapp.Funcs import *
from sklearn.neighbors import KNeighborsClassifier
import json
import pickle
import os
import copy
#Служебный класс записи и ее лога
class ViewObject:
    data=[]
    log_data=[]
    neigh_data=[]
#Объект функциональности
obj_=DataFunction()
indexes_common=[]
#Последняя запись в логе по id
def GetLastLog(id_):
    vals_=DataLog.objects.all().filter(id=id_)
    val=[]
    if len(vals_)!=0:
        val=vals_[len(vals_)-1]
    return val
#Последняя запись в таблице соседей
def GetLastNeight(id_):
    vals_=obj_.db.GetNeightsIds(id_)
    res_=[]
    if len(vals_)!=0:
        vals_=vals_[len(vals_)-1]
        val=vals_[0]
        res_=DataMain.objects.all().get(id=val)
    return res_


#Сборка списка объектов-заглушек из записи
def BuildList(list_):
    list_res=list()
    for item in list_:
        obj_=ViewObject()
        log_=GetLastLog(item.id)
        obj_.data=item
        obj_.log_data=log_
        obj_.neigh_data=GetLastNeight(item.id)
        list_res.append(obj_)
    return list_res

def Init():
    obj_.classifier=KNeighborsClassifier(n_neighbors=1)
    obj_.indices=list(np.array(obj_.db.indices)-obj_.db.num_pos)

def reset_status(request):
    #Меняем статус
    reset_=-1
    #Список индексов id строк
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    results=list()
    indexes_common=indexes.copy()
    for item in indexes_common:
        #Получение записей
        res=obj_.db.GetDataById(item)
        obj_.db.DeleteNeightsIds(item)
        results.append(res)
        indexes.remove(item)
    request.session["list_index"]=indexes.copy()
    for i in range(len(results)):
        temp_master=results[i].copy()
        #Изменение статуса на эталонный
        temp_master[16]=reset_
        id_=temp_master[17]
        query=f"update data_main set status={str(reset_)} where id={id_}"
        obj_.db.cursor.execute(query)
        obj_.db.conn.commit()
        #obj_.db.Update(results[i],temp_master,is_num=False)
    list_data=DataMain.objects.order_by("status").all()
    headers=DataMain.names_
    html = render_to_string('index.html',
                            {'headers': headers,'list_data':list_data}, request=request)
    return HttpResponse(html)

def set_ethalone(request):
    #Меняем статус
    ethalone_status=-3
    #Список индексов id строк
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    request.session["list_index"]=indexes.copy()
    results=list()
    for item in indexes:
        #Получение записей
        res=obj_.db.GetDataById(item)
        obj_.db.DeleteNeightsIds(item)
        results.append(res)

    for i in range(len(results)):
        temp_master=results[i].copy()
        #Изменение статуса на эталонный
        temp_master[16]=ethalone_status
        obj_.db.Update(results[i],temp_master,is_num=False)
    list_data=DataMain.objects.order_by("status").all()
    headers=DataMain.names_
    html = render_to_string('index.html',
                            {'headers': headers,'list_data':list_data}, request=request)
    return HttpResponse(html)

def clusterize_data(request):
    # with open(fname_classifier, 'rb') as f:
    #     obj_ = pickle.loads(f)
    obj_.Load(fname_classifier)
    classes=int(request.GET["count_clusters"])
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    print(classes)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    request.session["list_index"]=indexes.copy()
    results=list()
    for item in indexes:
#Получение записей
        res=obj_.db.GetDataById(item)
        results.append(res)
    recs_=obj_.db.ToDataMatrix(results)
    for item in recs_:
        print(item)
    labels=obj_.Clusterize(np.array(recs_),classes)
    print(labels)
    cluster_status=-2
    #Обработанные объекты
    objects_=DataMain.objects.all().filter(status =-2)
    #Эталонные объекты
    objects_ethalone=DataMain.objects.all().filter(status =-3)
    list_labels=list()
    for item in objects_:
        list_labels.append(item.label)
    for item in objects_ethalone:
        list_labels.append(item.label)
    #Кластеризация с учетом существования ранее созданных
    cluster_pos=0
    if len(list_labels)!=0:
        cluster_pos=np.max(np.array(list_labels))+1
    #Обновление индексов меток
    for i in range(len(labels)):
        labels[i]=labels[i]+cluster_pos
    #Обновление записей в БД
    for i in range(len(results)):
        temp_master=results[i].copy()
        id_=temp_master[17]
        temp_master[15]=labels[i]
        temp_master[16]=cluster_status
        #obj_.db.UpdateById(temp_master,id_,is_num=False)
        query=f"update data_main set status={str(cluster_status)}, label={str(labels[i])} where id={id_}"
        obj_.db.cursor.execute(query)
        obj_.db.conn.commit()
    list_data=DataMain.objects.order_by("status").all()
    headers=DataMain.names_
    html = render_to_string('index.html',
                            {'headers': headers,'list_data':list_data}, request=request)
    return HttpResponse(html)

def get_range(request):
    #id  выделенной записи
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    id_select=indexes[0]
    #Запись по ее id
    res=DataMain.objects.all().get(id=id_select)
    class_=res.label
    query=f"select min_,max_ from range_table where label={class_}"
    obj_.db.cursor.execute(query)
    records=obj_.db.cursor.fetchall()
    item_=list(records[0])
    min_=item_[0]
    max_=item_[1]
    data_context={'min_': min_,'max_':max_}
    return HttpResponse( json.dumps({
            "result": data_context,
        }),
        content_type="application/json"
    )



def set_range(request):
    #Считывание параметров диапазона
    min_=request.GET["min_"]
    min_=float(min_)
    max_=request.GET["max_"]
    max_=float(max_)
    #id  выделенной записи
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    id_select=indexes[0]
    #Запись по ее id
    res=DataMain.objects.all().get(id=id_select)
    class_=res.label
    try:
        if not res.status == -3:
            raise Exception("Выделенная строка должна быть эталонной")
        #Удаление записей, содержащих метку class_
        command_=f"delete from range_table where label={str(class_)}"
        obj_.db.cursor.execute(command_)
        obj_.db.conn.commit()
        #Задание диапазона, отвечающего метке class_
        data_=[min_,max_,class_]
        data_=tuple(data_)
        execute_values(obj_.db.cursor,
                       "INSERT INTO range_table (min_,max_,label) VALUES %s",
                       [data_])
        obj_.db.conn.commit()
        message=f'Диапазон значений по классу label={str(class_)} выставлен'
    except Exception as ex:
        message='Ошибка выставления диапазона:'+str(ex)
    html = render_to_string('index.html',
                            {'message': message}, request=request)
    return HttpResponse(html)


def classify_data(request):
    # with open(fname_classifier, 'rb') as f:
    #     obj_ = pickle.load(f)
    #     f.close()
    obj_.Load(fname_classifier)
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    request.session["list_index"]=indexes.copy()
    results=list()
    for item in indexes:
        #Получение записей
        res=obj_.db.GetDataById(item)
        results.append(res)
    test_data=obj_.db.ToDataMatrix(results)
    recs_=test_data
    for item in recs_:
        print(item)
    pred,labels,fail_list,neights_=obj_.PredictClassifier(np.array(recs_))
    change_status=-2 #Эталонный статус
    for i in range(len(pred)):
        temp_master=pred[i].copy()
        #ПАрсим данные на диапазон
        if obj_.ParseData(temp_master):
            temp_master[11]=labels[i]
            temp_master[12]=change_status
            id_=temp_master[13]
            query=f"update data_main set label={str(labels[i])},status={str(change_status)} where id={id_}"
            obj_.db.cursor.execute(query)
            obj_.db.conn.commit()
        else:
            id_=temp_master[13]
            indexes.remove(id_)

    request.session["list_index"]=indexes.copy()
    list_data=DataMain.objects.order_by("status").all()
    headers=DataMain.names_
    html = render_to_string('index.html',
                            {'headers': headers,'list_data':list_data}, request=request)
    return HttpResponse(html)

def work_data(request):
    # with open(fname_classifier, 'rb') as f:
    #     obj_ = pickle.loads(f)
    obj_.Load(fname_classifier)
    idx=request.GET["indexes"]
    print(idx)
    data_=json.loads(idx)
    print(data_)
    indexes=list()
    for item in data_:
        indexes.append(int(item))
    request.session["list_index"]=indexes.copy()
    results=list()
    for item in indexes:
        #Получение записей
        res=obj_.db.GetDataById(item)
        results.append(res)
    test_data=obj_.db.ToDataMatrix(results)
    recs_=test_data
    for item in recs_:
         print(item)
    pred,labels,fail_list,neights_=obj_.PredictClassifier(np.array(recs_),True)
    data_=obj_.FillInfo(np.array(pred))
    change_status=-2 #Эталонный статус
    for i in range(len(data_)):
        temp_master=data_[i].copy()
        temp_master[11]=labels[i]
        temp_master[12]=change_status
        id_=temp_master[13]
        obj_.db.UpdateById(temp_master,id_,is_num=True)

    list_data=DataMain.objects.order_by("status").all()
    headers=DataMain.names_
    html = render_to_string('index.html',
                            {'headers': headers,'list_data':list_data}, request=request)
    return HttpResponse(html)

def learn(request):
    message=''
    try:
        obj_.Update()
        obj_.indices=list(np.array(obj_.db.indices)-obj_.db.num_pos)
        obj_.Save(fname_classifier)
        # with open(fname_classifier, 'wb') as f:
        #     pickle.dump(obj_, f)
        #     f.close()
        message='Обучение завершено'
    except:
        message='Ошибка обучения. Проверьте данные'
    html = render_to_string('index.html',
                                {'message': message}, request=request)
    return HttpResponse(html)

fname_classifier='classifier.bin'
def load_data(request):
    if os.path.exists(fname_classifier):
        obj_=DataFunction()
        obj_.Load(fname_classifier)
    else:
        obj_=None
    if obj_ == None:
        Init()
        #with open(fname_classifier, 'wb') as f:
         #   pickle.dump(obj_, f)
    val=GetLastLog(5702)
    template="index.html"
    #DataMain.objects.order_by("status").all()
    list_data=DataMain.objects.order_by("status").all()
    #Преобразование данных
    list_data_=list()
    for item in list_data:
        list_data_.append(item)
    index_status=list()
    begin_=-1
    #Список выбранных объектов
    list_objs=list()
    indexes_common=request.session.get("list_index")
    if indexes_common!=None:
        for item in indexes_common:
            obj_1=DataMain.objects.order_by("status").all().get(id=item)
            #Добавляем в список
            list_objs.append(obj_1)
        #Убираем из списка
            list_data_.remove(obj_1)
    #Цикл по списку
        for i in range(len(list_data_)):
            #Берем элементы с статусом -2
            if list_data_[i].status == -2:
                begin_=i #Начало части элементов с статусом -2
                break
        #Цикл по списку выделенных объектов
        for item in list_objs:
            #Добавляем в начало списка с статусом -2
            list_data_.insert(begin_,item)
        if begin_ == -1:
            list_data_=list_data

    else:
        list_data_=list_data
    list_recs=BuildList(list_data_)
    headers=DataMain.names_
    #obj_.ParseData()
    html = render_to_string('index.html',
                            {'headers': headers,'list_data':list_recs}, request=request)
    return HttpResponse(html)

# Create your views here.
