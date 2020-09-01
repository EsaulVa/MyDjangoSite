from django.http import HttpResponse
from myapp.models import *
from django.views import *
from django.shortcuts import render
class Load():
    def __get__(self, instance, owner):
        data_=DataMain.objects.all()
        print(data_)
        html=''
        return HttpResponse(html)