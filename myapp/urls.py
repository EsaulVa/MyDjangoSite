from django.urls import path
from . import views
from myapp.views import *
urlpatterns = [
    path('load_data/', load_data),
    #Кластеризация данных
    path('clusterize_data/', clusterize_data),
    #Задание эталонных данных
    path('set_ethalone/', set_ethalone),
    #Сброс статуса
    path('reset_status/', reset_status),
    #Обучение классификатора
    path('learn/', learn),
    #Классификация и заполнение
    path('work_data/', work_data),
    #Классификация с учетом диапазона
    path('classify_data/', classify_data),
    #Задание диапазона по классу
    path('set_range/', set_range),
    #Получение диапазона по классу
    path('get_range/', get_range)
]