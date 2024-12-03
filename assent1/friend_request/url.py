from django.conf.urls import url
from friend_request import views

urlpatterns=[
    url('acceptedfriend/',views.acceptedrequest),
    url('addfriend/',views.addfriend),
    url('rr/(?P<idd>\w+)',views.req),
    url('accept/(?P<idd>\w+)',views.accept),
    url('reject/(?P<idd>\w+)', views.reject),
    url('unf/(?P<idd>\w+)', views.unfriend)

]
