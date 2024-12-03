from django.conf.urls import url
from alert import views

urlpatterns=[
    url('alert/',views.alert)

]