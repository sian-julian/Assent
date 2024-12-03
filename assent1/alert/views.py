from django.shortcuts import render
from alert.models import Alert
import datetime
# Create your views here.
def alert(request):
    if request.method=="POST":
        obj=Alert()
        obj.alert=request.POST.get('alert')
        obj.user_id=1
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request,'alert/alert.html')

