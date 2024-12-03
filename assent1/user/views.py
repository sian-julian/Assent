from urllib.request import urlopen
from django.conf import settings
from django.core.files import File
from django.core.files.base import ContentFile
from django.core.files.temp import NamedTemporaryFile
from urllib.request import urlopen
from django.core.files.storage import default_storage
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.shortcuts import render
from user.models import User
from login.models import Login
# Create your views here.

import os
import io
# def user(request):
#     if request.method=="POST":
#         obj=User()
#         obj.name=request.POST.get('na')
#         obj.username=request.POST.get('un')
#         obj.mail=request.POST.get('ml')
#         obj.phone=request.POST.get('ph')
#         obj.age=request.POST.get('age')
#         obj.sex=request.POST.get('sex')
#         # obj.image=request.POST.get('img')
#         myfile=request.FILES['live_picture']
#         fs=FileSystemStorage()
#         filename=fs.save(myfile.name,myfile)
#         obj.image=myfile.name
#         obj.password=request.POST.get('ps')
#         obj.save()
#
#         var=Login()
#         var.username = obj.username
#         var.password = obj.password
#         var.uid = obj.user_id
#         var.type = "user"
#         var.save()
#
#     return render(request,'user/user.html')

from django.core.files.storage import FileSystemStorage
import os

def user(request):
    if request.method == "POST":
        a = request.POST.get('ph')
        b = request.POST.get('ml')
        obv = User.objects.filter(Q(phone=a) & (Q(mail=b) | Q(phone=a) | Q(mail=b)))
        if len(obv) > 0:
            obk = "User exist"
        else:
            obj = User()
            obj.name = request.POST.get('na')
            obj.username = request.POST.get('un')
            obj.mail = request.POST.get('ml')
            obj.phone = request.POST.get('ph')
            obj.age = request.POST.get('age')
            obj.sex = request.POST.get('sex')
            obj.password = request.POST.get('ps')
            # image_path = request.POST["src"]
            # image_path = request.POST["src"]
            # print(image_path)
            # image = NamedTemporaryFile()
            # urlopen(image_path).read()
            # image.write(urlopen(image_path).read())
            # image.flush()
            # image = File(image)
            # name = str(image.name).split('\\')[-1]
            # name += '.jpg'  # store image in jpeg format
            # image.name = name
            # with open('image.txt', 'w+') as file:
            #     file.write(str(name))
            # # if os._exists('D:/Algorithms/meter/static/cap.jpg'):
            # #     os.remove('D:/Algorithms/meter/static/cap.jpg')
            # fnamee = default_storage.save(
            #     r'C:\\Users\\babin\\Downloads\\assent_tag\\assent_tag\\assent1\\static\\cap.jpg',
            #     ContentFile(urlopen(image_path).read()))
            # print('file', fnamee)
            obj.image=""
            # print(image_path)
            print("helo")
            obj.save()
            srcname=str(settings.BASE_DIR)+str(settings.STATIC_URL)+"temp.jpg"
            destname = str(settings.BASE_DIR) + str(settings.STATIC_URL) +  str(obj.user_id)+".jpg"
            os.rename(srcname,destname)

            obj.image=str(obj.user_id)+".jpg"
            obj.save()
            obk = "Succefully Registered"

        # Assuming User and Login models are defined somewhere in your code
            var = Login()
            var.username = obj.username
            var.password = obj.password
            var.uid = obj.user_id
            var.type = "user"
            var.save()
        context = {
            'msg': obk
        }
        return render(request, 'user/user.html', context)
    return render(request, 'user/user.html')



def viewuser(request):
    ss=request.session["uid"]
    obj=User.objects.exclude(user_id=ss)
    context={
        'x':obj
    }
    return render(request,'user/viewuser.html',context)

from photo_upload.models import PhotoUpload
def profile(request):
    ss=request.session["uid"]
    obj=User.objects.filter(user_id=ss)
    ab = PhotoUpload.objects.filter(user_id=ss)
    context={
        'o':obj,
        'b':ab
    }


    return render(request,'user/profile.html',context)

def about(request):
    ss=request.session["uid"]
    obj=User.objects.filter(user_id=ss)
    context={
        'o':obj
    }
    return render(request,'user/about.html',context)

def profile_edit(request):
    ss=request.session["uid"]
    obj=User.objects.get(user_id=ss)
    context={
        'zz':obj
    }
    if request.method == "POST":
        obj = User.objects.get(user_id=ss)
        obj.name = request.POST.get('na')
        obj.username = request.POST.get('un')
        obj.mail = request.POST.get('ml')
        obj.phone = request.POST.get('ph')
        obj.age = request.POST.get('age')
        obj.sex = request.POST.get('sex')
        # obj.image=request.POST.get('img')
        myfile = request.FILES['img']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        obj.image = myfile.name
        obj.save()
        lob = Login.objects.get(uid=obj.user_id, type="user")
        lob.username = obj.username
        lob.save()
    return render(request,'user/profile_edit.html',context)

def edit_password(request):
    ss=request.session["uid"]
    obj=User.objects.filter(user_id=ss)
    context={
        'o':obj
    }
    return render(request,'user/edit_password.html',context)

def change(request):
    ss=request.session["uid"]
    obj=User.objects.filter(user_id=ss)
    context={
        'x':obj
    }
    return render(request,'user/edit_password.html',context)

def password(request):
    if request.method=='POST':
        uid=request.session["uid"]
        obj=User.objects.get(user_id=uid)
        cpwd=request.POST.get('cps')
        npwd=request.POST.get('nps')
        cnpwd=request.POST.get('cnps')
        if cpwd == obj.password and npwd == cnpwd:
            obj.password=request.POST.get('cps')
            obj.save()
            lob=Login.objects.get(uid=obj.user_id,type="user")
            lob.password=npwd
            lob.save()
            message = "Password changed"
            context = {
                'msg': message
            }
            return render(request, 'user/edit_password.html', context)
        else:
            message="Password incorrect"
            context={
                'msg':message
            }
            return render(request, 'user/edit_password.html', context)

    return render(request, 'user/edit_password.html')


def webcam_view(request):
    return render(request, 'user/webcam.html')

from django.http import JsonResponse
import base64
from assent1 import settings
API_TOKEN="36f0a9d16c554e87bd09d024842e1b50"
from luxand import luxand
import requests
import cv2
import json
from django.http import HttpResponse
def save_image(request):
    if request.method == 'POST' and 'image_data' in request.POST:
        image_data = request.POST['image_data']
        # Strip the data URL prefix
        image_data = image_data.replace('data:image/png;base64,', '')
        # Decode the base64 data
        image_data = base64.b64decode(image_data)
        # Save the image to a file
        path=str(settings.BASE_DIR)+str(settings.STATIC_URL)+"temp.jpg"

        with open(path, 'wb') as f:
            f.write(image_data)
        f.close()

        ################################
        fpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + 'haarcascade_frontalface_default.xml'
        classifier = cv2.CascadeClassifier(fpath)
        filename =  path
        im1 = cv2.imread(filename)
        upfaces = classifier.detectMultiScale(im1)
        print(filename)
        print('upfaceeeeee')
        print(len(upfaces))
        if len(upfaces) > 0:
            client = luxand(API_TOKEN)
            url = "https://api.luxand.cloud/subject"
            payload = {}
            headers = {'token': API_TOKEN}
            response = requests.request("DELETE", url, data=payload, headers=headers)
            id = 0
            fobj = User.objects.all()
            for f in fobj:
                ffname = str(settings.BASE_DIR) + str(settings.STATIC_URL) + f.image
                im = cv2.imread(ffname)
                print(ffname)
                try:
                    faces = classifier.detectMultiScale(im)
                    id = 0
                    if len(faces) > 0:
                        print("faces")
                        client.add_person(name=str(f.user_id), photos=[ffname])
                except:
                    pass
            print("finished")

            url = "https://api.luxand.cloud/photo/search/v2"
            headers = {"token": API_TOKEN}

            files = {"photo": open(path, "rb")}
            response = requests.post(url, headers=headers, files=files)
            result = json.loads(response.text)

            resp=''
            try:
                if len(result)>0:
                    print(result[0]['name'])
                    resp='Already Exists'
                else:
                    resp="uploaded"
            except:
                resp = "uploaded"

        print(resp)
        ################################

        # return JsonResponse({'error': 'Image data not found'}, status=400)
        return JsonResponse({'message': resp})
        # return HttpResponse('hello')
    else:
        return JsonResponse({'error': 'Image data not found'}, status=400)



