from django.conf.urls import url
from user import views

urlpatterns=[
    url('user/',views.user),
    url('vw/',views.viewuser),
    url('profile/',views.profile),
    url('about/',views.about),
    url('edit/', views.profile_edit),
    # url('password/(?P<idd>\w+)', views.password),
    # url('change/',views.change),
    url('webcam/',views.webcam_view),
    url('capimage/',views.save_image),
    url('change/', views.password)
]