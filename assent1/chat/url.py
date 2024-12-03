from django.conf.urls import url
from chat import views

urlpatterns=[
    url('ve/',views.st),
    url('chat/(?P<idd>\w+)',views.adchat),


]