from django.shortcuts import render
from feedback.models import Feedback
import datetime
# Create your views here.
def feedback(request):
    if request.method=="POST":
        obj=Feedback()
        obj.feedback=request.POST.get('feedback')
        obj.user_id=1
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request,'feedback/feedback.html')

def viewfeedback(request):
    obj=Feedback.objects.all()
    context={
        'x':obj
    }
    return render(request,'feedback/viewfeedback.html',context)

def user_feedback(request):
    if request.method=="POST":
        obj=Feedback()
        obj.feedback=request.POST.get('feedback')
        obj.user_id=1
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request,'feedback/user_feedback.html')

def feedview(request):
    obj=Feedback.objects.all()
    context={
        'x':obj
    }
    return render(request,'feedback/feedview.html',context)
