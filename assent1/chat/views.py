from django.shortcuts import render
# from .models import UserRegistration
from chat.models import Chat
import datetime
from django.db.models import Q
from user.models import User
# Create your views here.
from login.models import Login


def st(request):
    ss=request.session["uid"]
    ob=User.objects.exclude(user_id=ss)
    context={
        'kk':ob,
        # 'jj':obk
    }
    return render(request,'chat/view user.html',context)

def adchat(request,idd):
    ss=request.session["uid"]
    obj = User.objects.get(user_id=idd)
    ob = Chat.objects.filter((Q(sender_id=idd) & Q(rec_id=ss)) | (Q(sender_id=ss) & Q(rec_id=idd)))
    context = {
        'kk': ob,
        'uu': obj,
        'aa':idd,
        'mm':ss,
    }
    print(ss),
    print(idd)
    if request.method == 'POST':
        obk = Chat()
        obk.message = request.POST.get('mssg')
        obk.rec_id=idd
        obk.sender_id=ss
        obk.save()
    return render(request, 'chat/chatuser1.html',context)
