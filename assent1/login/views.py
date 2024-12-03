from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login

# Create your views here.
def login(request):
    if request.method == "POST":
        eml = request.POST.get("un")
        passw = request.POST.get("ps")
        obj = Login.objects.filter(username=eml,password=passw)
        print(len(obj))
        tp = ""
        for ob in obj:
            tp = ob.type
            uid = ob.uid
            if tp == "admin":
                request.session["uid"]=uid
                return HttpResponseRedirect('/temp/admin/')
            elif tp == "user":
                request.session["uid"]=uid
                return HttpResponseRedirect('/temp/user/')
        objlist ="email or password incorrect.....please try again.....!"
        context = {
            'msg':objlist,
        }
        return render(request,'login/login.html',context)
    return render(request,'login/login.html')