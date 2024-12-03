from django.conf.urls import url
from photo_upload import  views

urlpatterns=[
    url('photoupload/',views.photoupload),
    url('viewimage/', views.viewimage),
    url('caption/', views.caption),
    url('nt/',views.vi),
    url('app/(?P<idd>\w+)',views.app),
    url('l/(?P<idd>\w+)',views.lik)

]