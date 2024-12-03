from django.conf.urls import url
from like import views

urlpatterns=[
    url('like/',views.like)
]