import pandas as pd
import numpy as np
#Модели кластеризации
from sklearn.cluster import KMeans
#Модели предобработчиков
from sklearn.preprocessing import *
#Модели классификаторов
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import RandomForestRegressor
from sklearn.neighbors import NearestNeighbors
#Вспомогательный функционал
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
import csv
from psycopg2.extras import execute_values
import psycopg2
import pickle
from myapp.models import *


class DBObject:
    fields_=['street', 'house', 'cluster', 'series','year_construct','year_commiss','total_area','total_area_resident','total_area_none_resident','total_area_part','total_count','count_resident','count_none_resident','max_floors','min_floors','label','status','id']
    conn=[]
    cursor=[]
    indices=[7,14]
    columns=[]
    log_columns=12
    num_pos=4
    def Clear(self):
        query=f"delete from data_main"
        self.cursor.execute(query)
        self.conn.commit()
        query=f"delete from data_log"
        self.cursor.execute(query)
        self.conn.commit()
    def __init__(self):
        self.columns=len(self.fields_)
        self.conn = psycopg2.connect(dbname='mydb_new', user='postgres',
                                     password='12345', host='localhost')
        self.cursor = self.conn.cursor()
    def GetDataByStatus(self,status):
        params=''
        #Полный список всех параметров по порядку
        indices=list(range(self.columns))
        for ind in indices:
            params=params+self.fields_[ind]+','
        params=params.strip(',')
        query=f"select {params} from data_main where status={str(status)}"
        print(query)
        self.cursor.execute(query)
        records=self.cursor.fetchall()
        recs_=[]
        for item in records:
            list_temp=list(item)
            for i in range(self.num_pos):
                list_temp[i]=list_temp[i].strip()
            recs_.append(list_temp)
        return  recs_
    def DeleteNeightsIds(self,id_):
        query=f"delete from neights where id_data={str(id_)}"
        print(query)
        self.cursor.execute(query)
        self.conn.commit()

    def GetNeightsIds(self,id_):
        query=f"select * from neights where id_data={str(id_)}"
        print(query)
        self.cursor.execute(query)
        records=self.cursor.fetchall()
        recs_=[]
        if len(records)!=0:
            for item in records:
                list_temp=list(item)
                recs_.append(list_temp)
        return  recs_

    def GetDataById(self,id_):
        params=''
        #Полный список всех параметров по порядку
        indices=list(range(self.columns))
        for ind in indices:
            params=params+self.fields_[ind]+','
        params=params.strip(',')
        query=f"select {params} from data_main where id={str(id_)}"
        print(query)
        self.cursor.execute(query)
        records=self.cursor.fetchall()
        recs_=[]
        for item in records:
            list_temp=list(item)
            for i in range(self.num_pos):
                list_temp[i]=list_temp[i].strip()
            recs_.append(list_temp)
        return  recs_[0]
    def ToDataMatrix(self,data):
        res_=[]
        try:
            for item in data:
                #Выборка числовой части по индексу
                item_=item[self.num_pos:]
                res_.append(item_)
        except:
            res_=data
        return  res_

    def GetFields(self):
        self.cursor.execute("select table_name, column_name from information_schema.columns  where table_name = 'data_main'")
        records = self.cursor.fetchall()
        for row in records:
            (db_,field)=row
            print(field)
    def Close(self):
        self.cursor.close()
        self.conn.close()
    def AddDataLog(self,data):
        data_=data.copy()
        data_=tuple(data_)
        execute_values(self.cursor,
                       "INSERT INTO data_log (year_construct,year_commiss,total_area,total_area_resident,total_area_none_resident,total_area_part,total_count,count_resident,count_none_resident,max_floors,min_floors,id) VALUES %s",
                       [data_])
        self.conn.commit()

    def AddDataIds(self,data):
        data_=data.copy()
        data_=tuple(data_)
        execute_values(self.cursor,
                       "INSERT INTO neights (id_data,id_neigh ) VALUES %s",
                       [data_])
        self.conn.commit()
    def AddData(self,data,label=-1,status=-1):
        data_=data.copy()
        if len(data_)<17:
            data_.append(label)
            data_.append(status)
        data_=tuple(data_)
        execute_values(self.cursor,
                       "INSERT INTO data_main (street, house, cluster, series,year_construct,year_commiss,total_area,total_area_resident,total_area_none_resident,total_area_part,total_count,count_resident,count_none_resident,max_floors,min_floors,label,status ) VALUES %s",
                       [data_])
        self.conn.commit()
    def Delete(self,data):
        data_=tuple(data)
        if len(data)==17:
            query=f" delete  from data_main where street='{data[0]}' and house='{data[1]}' and cluster='{data[2]}' and series='{data[3]}' and year_construct={data[4]} and year_commiss={data[5]} and total_area={data[6]} and total_area_resident={data[7]} and total_area_none_resident={data[8]} and total_area_part={data[9]} and total_count={data[10]} and count_resident={data[11]} and  count_none_resident={data[12]} and max_floors={data[13]} and min_floors={data[14]} and label={data[15]} and status={data[16]}"
        else:
            if len(data)==15:
                query=f" delete  from data_main where street='{data[0]}' and house='{data[1]}' and cluster='{data[2]}' and series='{data[3]}' and year_construct={data[4]} and year_commiss={data[5]} and total_area={data[6]} and total_area_resident={data[7]} and total_area_none_resident={data[8]} and total_area_part={data[9]} and total_count={data[10]} and count_resident={data[11]} and  count_none_resident={data[12]} and max_floors={data[13]} and min_floors={data[14]}"
        print(query)
        self.cursor.execute(query)
        self.conn.commit()
    def UpdateById(self,new_data,id,is_num):
        query_set=''
        if not is_num:
            query_set=f" street='{new_data[0]}',house='{new_data[1]}' ,cluster='{new_data[2]}' , series='{new_data[3]}' ,year_construct={new_data[4]} ,year_commiss={new_data[5]} ,total_area={new_data[6]} ,total_area_resident={new_data[7]} ,total_area_none_resident={new_data[8]} ,total_area_part={new_data[9]} , total_count={new_data[10]} , count_resident={new_data[11]} ,count_none_resident={new_data[12]} , max_floors={new_data[13]} ,min_floors={new_data[14]} ,label={new_data[15]} ,status={new_data[16]}"
        else:
            query_set=f" year_construct={new_data[0]} ,year_commiss={new_data[1]} ,total_area={new_data[2]} ,total_area_resident={new_data[3]} ,total_area_none_resident={new_data[4]} ,total_area_part={new_data[5]} , total_count={new_data[6]} , count_resident={new_data[7]} ,count_none_resident={new_data[8]} , max_floors={new_data[9]} ,min_floors={new_data[10]} ,label={new_data[11]} ,status={new_data[12]}"
        query=""
        query=f"update data_main set {query_set} where id={id}"
        print("Update: ",query)
        self.cursor.execute(query)
        self.conn.commit()

    def Update(self,data,new_data,is_num):
        query_set=''
        if len(data)==18:
            cond_set=f"street='{data[0]}' and house='{data[1]}' and cluster='{data[2]}' and series='{data[3]}' and year_construct={data[4]} and year_commiss={data[5]} and total_area={data[6]} and total_area_resident={data[7]} and total_area_none_resident={data[8]} and total_area_part={data[9]} and total_count={data[10]} and count_resident={data[11]} and  count_none_resident={data[12]} and max_floors={data[13]} and min_floors={data[14]} and label={data[15]} and status={data[16]}"
        else:
            cond_set=f"year_construct={data[0]} and year_commiss={data[1]} and total_area={data[2]} and total_area_resident={data[3]} and total_area_none_resident={data[4]} and total_area_part={data[5]} and total_count={data[6]} and count_resident={data[7]} and  count_none_resident={data[8]} and max_floors={data[9]} and min_floors={data[10]} and label={data[11]} and status={data[12]}"

        if not is_num:
            query_set=f" street='{new_data[0]}',house='{new_data[1]}' ,cluster='{new_data[2]}' , series='{new_data[3]}' ,year_construct={new_data[4]} ,year_commiss={new_data[5]} ,total_area={new_data[6]} ,total_area_resident={new_data[7]} ,total_area_none_resident={new_data[8]} ,total_area_part={new_data[9]} , total_count={new_data[10]} , count_resident={new_data[11]} ,count_none_resident={new_data[12]} , max_floors={new_data[13]} ,min_floors={new_data[14]} ,label={new_data[15]} ,status={new_data[16]}"
        else:
            query_set=f" year_construct={new_data[0]} ,year_commiss={new_data[1]} ,total_area={new_data[2]} ,total_area_resident={new_data[3]} ,total_area_none_resident={new_data[4]} ,total_area_part={new_data[5]} , total_count={new_data[6]} , count_resident={new_data[7]} ,count_none_resident={new_data[8]} , max_floors={new_data[9]} ,min_floors={new_data[10]} ,label={new_data[11]} ,status={new_data[12]}"
        query=f"update data_main set {query_set} where {cond_set}"
        print("Update: ",query)
        self.cursor.execute(query)
        self.conn.commit()
    def GetIdByData(self,data):
        records=[]
        try:
            if len(data)==18:
                cond_set=f"street='{data[0]}' and house='{data[1]}' and cluster='{data[2]}' and series='{data[3]}' and year_construct={data[4]} and year_commiss={data[5]} and total_area={data[6]} and total_area_resident={data[7]} and total_area_none_resident={data[8]} and total_area_part={data[9]} and total_count={data[10]} and count_resident={data[11]} and  count_none_resident={data[12]} and max_floors={data[13]} and min_floors={data[14]} and label={data[15]} and status={data[16]}"
            else:
                cond_set=f"year_construct={data[0]} and year_commiss={data[1]} and total_area={data[2]} and total_area_resident={data[3]} and total_area_none_resident={data[4]} and total_area_part={data[5]} and total_count={data[6]} and count_resident={data[7]} and  count_none_resident={data[8]} and max_floors={data[9]} and min_floors={data[10]} and label={data[11]} and status={data[12]}"
            print(f"select id from data_main  where {cond_set}")
            self.cursor.execute(f"select id from data_main  where {cond_set}")
            records = self.cursor.fetchall()
            for row in records:
                print(row[0])
            index_=row[0]
        except:
            index_=-1
            return index_



def Create(data):
    list_=data.dtypes
    list_types=list()
    for item in list_:
        list_types.append(str(item))
    idxs=[]
    for i in range(len(list_types)):
        if(list_types[i]=='object'):
            idxs.append(i)
    print(idxs)
    array = data.values
    m_=len(array[:,0])
    for ind in idxs:
        for i in range(m_):
            val=array[:,ind][i]
            val=str(val).strip()
            strs_=val.split()
            item_=''
            for it in strs_:
                item_=item_+it
            array[:,ind][i]=float(item_)
    return array
names_=['Год постройки','Год ввода в эксплуатацию','Общая площадь','Общая площадь жилых помещений','Общая площадь нежилых помещений','Общая площадь помещений, входящих в состав общего имущества','Общее количество помещений','Количество жилых помещений','Количество нежилых помещений','Наибольшее количество этажей',	'Наименьшее количество этажей' ]
def CreateCSVFile(path):
    data=pd.read_csv(path, delimiter=';',names=names_)
    array_=Create(data)
    return array_
from psycopg2 import *

def Preprocess(data,helper):
    data_=np.array(data)
    (rows,cols)=data_.shape
    for i in range(cols):
        col_=data_[:,i]
        data_[:,i]=helper.Exec(col_)
    return data_
#Хелперы для заполнения
#Хелпер для среднего арифметического
class FillMeanHelper:
    def Exec(self,data):
        try:
            inds_=np.where(~np.isnan(data))
        except:
            inds_=np.where(~np.isnan(list(data)))
        try:
            inds_nan=np.where(np.isnan(data))
        except:
            inds_nan=np.where(np.isnan(list(data)))
        mean_=np.mean(data[inds_])
        data[inds_nan]=mean_
        return data
#Хелпер для заполнения случайными числами
class FillRandomHelper:
    def Exec(self,data):
        try:
            inds_=np.where(~np.isnan(data))
        except:
            inds_=np.where(~np.isnan(list(data)))
        try:
            inds_nan=np.where(np.isnan(data))
        except:
            inds_nan=np.where(np.isnan(list(data)))

        for i in range(len(inds_nan)):
            data[inds_nan[i]]=np.random.rand()
        return data

#Функционал обработки данных
class DataFunction:
    index_common=list()
    indices=[]
    #Порог оценивания
    threshold=0.5
    db=DBObject()
    Data=[]
    #Данные для классификатора
    #Сами данные
    ListData=[]
    #Метки
    ListLabels=[]
    #Хелпер для заполнения данных
    helper=[]
    #Модель классификатора по меткам
    classifier=RandomForestClassifier()
    regressor=RandomForestRegressor()
    #Преобразование масштабирования
    scaler_=StandardScaler()
    neigh_=NearestNeighbors(n_neighbors=1)
    #Заголовки
    names_=['Год постройки','Год ввода в эксплуатацию','Общая площадь','Общая площадь жилых помещений','Общая площадь нежилых помещений','Общая площадь помещений, входящих в состав общего имущества','Общее количество помещений','Количество жилых помещений','Количество нежилых помещений','Наибольшее количество этажей',	'Наименьшее количество этажей' ]
    def Save(self,fname):
        f=open(fname,'wb')
        #Экспорт коллекций
        pickle.dump(self.indices,f)
        pickle.dump(self.Data,f)
        pickle.dump(self.ListData,f)
        pickle.dump(self.ListLabels,f)
        #Экспорт объектов
        pickle.dump(self.scaler_,f)
        pickle.dump(self.classifier,f)
        pickle.dump(self.neigh_,f)
        f.close()
    def Load(self,fname):
        import copy
        f = open(fname, 'rb')
        #Загрузка коллекций
        self.indices=pickle.load(f)
        self.Data=pickle.load(f)
        self.ListData=pickle.load(f)
        self.ListLabels=pickle.load(f)
        #Загрузка объектов
        self.scaler_=pickle.load(f)
        self.classifier=pickle.load(f)
        self.neigh_=pickle.load(f)
        f.close()
    def FillData(self,data):
        data_=data
        id_=data_[13]
        #ind_=self.db.GetIdByData(data_)
        try:
            inds_=np.where(~np.isnan(data_))
        except:
            inds_=np.where(~np.isnan(list(data_)))
        try:
            inds_nan=np.where(np.isnan(data_))
        except:
            inds_nan=np.where(np.isnan(list(data_)))
        val_=self.Ind(data_)
        val_,inds_=self.neigh_.kneighbors([val_])
        ind_neigh=inds_[0,0]
        data_1=np.array(self.Data[ind_neigh])
        m=len(data_)
        inds_nan=inds_nan[0]
        if len(inds_nan)!=0:
            log_data=list(-1*np.ones(self.db.log_columns))
            log_data[11]=id_
            log_=log_data.copy()
            log_=np.array(log_)
            #Учитываем пропуски
            log_[inds_nan]=1
            self.db.AddDataLog(list(log_))
            data_[inds_nan]=data_1[inds_nan+self.db.num_pos]
            #Учитываем прогноз
            log_[inds_nan]=2
            self.db.AddDataLog(log_)
        return data_
    def ParseData(self,data_temp):
        query="select min_,max_ from range_table"
        self.db.cursor.execute(query)
        records=self.db.cursor.fetchall()
        recs_=[]
        for item in records:
            list_temp=list(item)
            recs_.append(list_temp)
        #Range=[[3562, 3737],[630,660],[4729,4972]]
        Range=recs_
        data_=self.Ind(data_temp)
        res_=False
        for item in Range:
            RangeMin=item[0]
            RangeMax=item[1]
            if data_[0]<=RangeMax and data_[0]>=RangeMin:
                res_=True
                break
        return  res_


    def FillInfo(self,data):
        data_=data
        try:
            (m,n)=data_.shape
            res_=[]
            for i in range(m):
                row=self.FillData(data_[i,:])
                res_.append(list(row))
        except:
            res_=self.FillData(data_)
        res_=np.array(res_)
        return  res_

    def LearnNeighBoors(self):
        kfold=3
        from sklearn.model_selection import cross_val_score
        X=self.ListData
        self.neigh_.fit(X)
        # X_scaled=self.scaler_.fit_transform(X)
        # X_train, X_test, y_train, y_test = train_test_split(X_scaled, X_scaled, test_size=0.3, random_state=0)
        # scores = cross_val_score(self.regressor, X_train, X_train, cv=kfold)
        # self.regressor.fit(X_train,X_train)
    #Предвыборка данных
    def PreData(self):
        #Эталонная выборка
        master_status=-3
        self.Data=list(self.db.GetDataByStatus(master_status))
        data_temp=self.db.ToDataMatrix(self.Data)
        for item in data_temp:
            id_=item[13]
            log_data=list(np.zeros(self.db.log_columns))
            log_data[11]=id_
            self.db.AddDataLog(log_data)
        #Срез выборки по значимым переменным
        self.ListData=self.Ind(np.array(data_temp))
        #Предпоследний БД столбец как метки
        labels_pos=self.db.columns-3
        #Заполнение меток
        self.ListLabels=[]
        for item in self.Data:
            self.ListLabels.append(item[labels_pos])
    #Обучение классификатора
    def LearnClassifier(self):
        X=self.ListData
        y=self.ListLabels
        X_scaled=self.scaler_.fit_transform(X)
        X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.3, random_state=0)
        #Балансировка выборки
        from imblearn.over_sampling import RandomOverSampler
        ros = RandomOverSampler(random_state=777)
        X_train_res, y_train_res = ros.fit_resample(X_train, y_train)
        #Обучение классификатора
        self.classifier.fit(X_train,y_train)
    #Предсказание на новом наборе
    def PredictClassifier(self,data,is_neigh=False):
        data_=self.Ind(data)
        data_=self.scaler_.transform(data_)
        #Метки класса
        labels_=self.classifier.predict(data_)
        #Вероятности прогноза
        probs=self.classifier.predict_proba(data_)
        data_garb=[]
        data_true=[]
        labels_true=[]
        print(probs)
        print(labels_)
        #Цикл по меткам
        for i in range(len(labels_)):
            val_=np.max(probs[i])
            #Если максимальная вероятность больше порога
            if val_>=self.threshold:
                #Добавляем значения в список истинных данных
                data_true.append(data[i])
                #Добавляем значения в список истинных меток
                labels_true.append(labels_[i])
            else:
                #Добавляем значения в список "грязных" данных. Они нуждаются в уточнении
                data_garb.append(data[i])
        neights_=list()
        if is_neigh:
            for item in data_true:
                id_data=item[13]
                val_=self.Ind(item)
                val_,inds_=self.neigh_.kneighbors([val_])
                ind_neigh=inds_[0,0]
                data_1=self.Data[ind_neigh]
                id_neigh_=data_1[17]
                print([id_data,id_neigh_])
                list_ids=[id_data,id_neigh_]
                self.db.AddDataIds(list_ids)
                neights_.append(data_1)
        return data_true,labels_true,data_garb,neights_
    #Добавление в выборку
    # def AppendToListClassifier(self,data,labels):
    #     if len(self.ListData)==0:
    #         self.Data=data
    #         self.ListData=self.Ind(data)
    #         self.ListLabels=labels
    #     else:
    #         #Добавляем набор в конец списка
    #         self.ListData=np.vstack((self.ListData,self.Ind(data)))
    #         data_=self.FillInfo(data,True)
    #         self.Data=np.vstack((self.Data,data_))
    #         #Берем максимальную метку,увеличенную на единицу
    #         class_=np.max(self.ListLabels)+1
    #         #Создаем новые метки на базе старых
    #         for i in range(len(labels)):
    #             labels[i]=labels[i]+class_
    #         self.ListLabels=np.append(self.ListLabels,labels)
    def Ind(self,data):
        data_=data
        len_=0
        try:
            (rows,cols)=data_.shape
            len_=cols
        except:
            len_=len(data)
        if len_>len(self.indices):
            if len(self.indices)!=0:
                try:
                    data_=data_[:,self.indices]
                except:
                    data_=data_[self.indices]
        return data_
    def Update(self):
        #Предзаполнение
        self.PreData()
        #Обучаем классификатор
        self.LearnClassifier()
        #Обучаем соседей
        self.LearnNeighBoors()
    #Кластеризация данных
    def Clusterize(self,data,classes):
        data=self.Ind(data)
        print('Ind')
        for item in data:
            print(item)
        #Кластеризация
        model_cluster=KMeans(n_clusters=classes)
        model_cluster.fit(data)
        labels=model_cluster.predict(data)
        return labels

class ParserOfRange:
    db=DBObject()
    Minims=[]
    Maxims=[]
    def Create(self):
        return 0













