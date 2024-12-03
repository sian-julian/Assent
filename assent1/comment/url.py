from django.conf.urls import url
from comment import views

urlpatterns=[
    url('comment/(?P<idd>\w+)',views.comment),
    url('view/',views.view_comm)
]