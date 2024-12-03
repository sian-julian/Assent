from django.conf.urls import url
from feedback import views

urlpatterns=[
    url('feedback/',views.feedback),
    url('feebview/',views.viewfeedback),
    url('user_feadbk/', views.user_feedback),
    url('feed_view/', views.feedview)
]