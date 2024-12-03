from django.shortcuts import render
from user.models import User

# Create your views here.

def admin(request):
    return render(request,'temp/admincss.html')


def user(request):
    ss=request.session["uid"]
    obj=User.objects.get(user_id=ss)
    context={
        'a':obj
    }
    return  render(request,'temp/usercss.html',context)

def complaint(request):
    ss=request.session["uid"]
    obj=User.objects.get(user_id=ss)
    context={
        'a':obj
    }
    return  render(request,'temp/complaint.html',context)