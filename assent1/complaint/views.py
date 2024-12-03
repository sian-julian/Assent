from django.shortcuts import render
from complaint.models import Complaints
import datetime
# Create your views here.
def complaint(request):
    if request.method=="POST":
        obj=Complaints()
        obj.complaint=request.POST.get('complaint')
        obj.user_id=1
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.reply="pending"
        obj.save()
    return render(request,'complaint/complaint.html')

def complaintandreply(request):
    obj=Complaints.objects.all()
    context={
        'x':obj
    }
    return render(request,'complaint/complaintandreply.html',context)

def reply(request,idd):
    if request.method=='POST':
        obj=Complaints.objects.get(complaint_id=idd)
        obj.reply=request.POST.get('reply')
        obj.save()
        return complaintandreply(request)
    return render(request,'complaint/reply.html')

def view_reply(request):
    obj = Complaints.objects.all()
    context = {
        'x': obj
    }
    return render(request,'complaint/view_reply.html',context)

def user_complaint(request):
    if request.method == "POST":
        obj = Complaints()
        obj.complaint = request.POST.get('complaint')
        obj.user_id = 1
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.reply = "pending"
        obj.save()
    return render(request,'complaint/complaint_user_new.html')

def new_view_complaint_reply(request):
    obj=Complaints.objects.all()
    context={
        'x':obj
    }
    return render(request,'complaint/new_view_complaint_reply.html',context)

def replyver2(request,idd):
    if request.method=='POST':
        obj=Complaints.objects.get(complaint_id=idd)
        obj.reply=request.POST.get('reply')
        obj.save()
        return new_view_complaint_reply(request)
    return render(request, 'complaint/replyver2.html')