from django.conf.urls import url
from complaint import views

urlpatterns=[
    url('complaint/',views.complaint),
    url('complaintandreply/',views.complaintandreply),
    url('reply/(?P<idd>\w+)',views.reply),
    url('view/',views.view_reply),
    url('user_post_c/',views.user_complaint),
    url('careply/',views.new_view_complaint_reply),
    url('rplyver2/(?P<idd>\w+)',views.replyver2)
]