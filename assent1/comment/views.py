from django.http import HttpResponseRedirect
from django.shortcuts import render
from comment.models import Comment
import nltk
from nltk.corpus import stopwords
from comment.models import Cyber
import datetime
stop_words = list(stopwords.words('english'))
# Create your views here.
def comment(request,idd):
    pp=idd
    obj = Comment.objects.filter(photo_id=idd)
    context = {
        'x': obj
    }
    if request.method=="POST":
        # obj=Comment()
        # obj.user_id=1
        # obj.photo_id=1

        # obj.comment=request.POST.get('comment')
        # obj.save()

        list = ['exacerbate', 'badger', 'derogatory', 'frustrate', 'censor', 'prohibit', 'expand', 'libel',
                'legislation', 'harsh', 'victim', 'bloodyfool', 'bugger', 'idiot', 'donkey']
        ss = request.session["uid"]
        obk = Comment.objects.filter(photo_id=idd)
        context = {
            'kk': obk
        }
        if request.method == 'POST':
            a = request.POST.get('comment')
            count = 0
            print(stop_words)

            msg = a.split(' ')
            l = 0
            print(msg)

            for m in msg:
                if m not in stop_words:
                    l = l + 1
                    if m in list:
                        count = count + 1
            per = (count / l) * 100
            print(per)
            print(count)
            print(l)
            if per>=50:
                obv = Cyber()
                obv.comments = request.POST.get('comment')
                obv.date = datetime.datetime.today()
                obv.time = datetime.datetime.now()
                obv.save()
            else:
                ob = Comment()
                ob.comment = request.POST.get('comment')
                ob.photo_id = idd
                ob.user_id = ss
                # ob.status = int(per)
                # ob.date = datetime.datetime.today()
                # ob.time = datetime.datetime.now()
                ob.save()
                return HttpResponseRedirect('/photo_upload/photoupload/')
    return render(request,'comment/comment.html',context)

def view_comm(request):
    obj=Comment.objects.all()
    context={
        'x':obj
    }
    return render(request,'comment/viewcomment.html',context)