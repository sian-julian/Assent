from django.db.models import Q
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from friend_request.models import FriendRequest
from friend_request.models import FriendRequest1
import datetime

def acceptedrequest(request):
    ss=request.session["uid"]
    obj=FriendRequest.objects.filter(request="Friends").exclude(user_id=ss)
    context={
        'x':obj
    }
    return render(request,'friend_request/acceptedfriend.html',context)

def unfriend(request,idd):
    obj=FriendRequest.objects.get(request_id=idd)
    obj.request="Rejected"
    obj.save()
    return acceptedrequest(request)

def addfriend(request):
    ss=request.session["uid"]
    obj=FriendRequest.objects.exclude(user_id=ss)
    context={
        'x':obj
    }
    return render(request,'friend_request/sample.html',context)



def accept(request,idd):
    obj=FriendRequest.objects.get(request_id=idd)
    obj.request="Friends"
    obj.save()
    return addfriend(request)

def reject(request,idd):
    obj=FriendRequest.objects.get(request_id=idd)
    obj.delete()
    return addfriend(request)



def req(request,idd):
    ss=request.session["uid"]
    obk=FriendRequest.objects.filter(Q(receiver_id=idd) & Q(user_id=ss))
    if len(obk)>0:
        print("requested")
    else:
        obj=FriendRequest()
        obj.user_id = ss
        obj.receiver_id=idd
        obj.request = "requested"
        obj.date = datetime.datetime.now()
        obj.time = datetime.datetime.now()
        obj.save()

        obb=FriendRequest1()
        obb.user_id = idd
        obb.sender_id = ss
        obb.request = "requested"
        obb.date = datetime.datetime.now()
        obb.time = datetime.datetime.now()
        obb.save()
    return HttpResponseRedirect('/user/vw/')


