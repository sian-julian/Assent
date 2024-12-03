from django.http import HttpResponseRedirect
from django.shortcuts import render
from photo_upload.models import PhotoUpload
import datetime
from django.core.files.storage import FileSystemStorage
from assent1 import settings
from user.models import User
from luxand import luxand
import requests
import cv2
import json
from user.models import User
API_TOKEN="36f0a9d16c554e87bd09d024842e1b50"
from photo_upload.models import Permission
from comment.models import Comment
# Create your views here.
def photoupload(request):
    ss=request.session["uid"]
    ob = User.objects.get(user_id=ss)
    obja = PhotoUpload.objects.all()
    ab=Comment.objects.all()
    context = {
        'o': obja,
        'p': ob,
        'k':ab
    }
    if request.method=="POST":
        obj=PhotoUpload()
        # obj.photo=request.POST.get('image')
        myfile = request.FILES['hello']
        fd = FileSystemStorage()
        filename = fd.save(myfile.name, myfile)
        upfilename = filename
        obj.photo = myfile.name
        obj.caption=request.POST.get('type')
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.status="hide"
        obj.like=1
        obj.blur="pending"
        obj.show=0
        obj.user_id=ss
        obj.save()
        fobj = User.objects.all()
        # file = request.FILES['hello']
        # fs = FileSystemStorage()
        # fpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + file.name
        # filename = fs.save(fpath, file)
        fpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + 'haarcascade_frontalface_default.xml'
        classifier = cv2.CascadeClassifier(fpath)
        filename = str(settings.BASE_DIR) + str(settings.STATIC_URL) + filename
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
            ################################
            blur_strength = 31
            url = "https://api.luxand.cloud/photo/search/v2"
            headers = {"token": API_TOKEN}

            files = {"photo": open(str(settings.BASE_DIR) + str(settings.STATIC_URL) + upfilename, "rb")}
            response = requests.post(url, headers=headers, files=files)
            result = json.loads(response.text)
            # #     print(result)
            img = cv2.imread(str(settings.BASE_DIR) + str(settings.STATIC_URL) + upfilename)
            for reg in result:
                print('Name :', reg['name'])
                print('session :', str(ss))
                if str(ss) != reg['name']:
                    l = reg['rectangle']['left']
                    t = reg['rectangle']['top']
                    r = reg['rectangle']['right']
                    b = reg['rectangle']['bottom']
                    print(l, ',', t, ',', r, ',', b)
                    roi = img[t:b, l:r]
                    blurred_roi = cv2.GaussianBlur(roi, (blur_strength, blur_strength), 0)
                    # Replace the original ROI with the blurred one
                    img[t:b, l:r] = blurred_roi
                    ops = Permission()
                    ops.image_id = obj.photo_id
                    ops.user_id = reg['name']
                    ops.status = 'pending'
                    ops.upuser_id = ss
                    ops.save()
                    ops = Permission()
                    ops.image_id = obj.photo_id
                    ops.user_id = ss
                    ops.status = 'approved'
                    ops.upuser_id = ss
                    ops.save()
                # cv2.rectangle(img, (l, t), (r, b), (0, 255, 0), 2)
            sv_blur = str(settings.BASE_DIR) + str(settings.STATIC_URL) + str(obj.photo_id) + 'blur.jpg'
            cv2.imwrite(sv_blur, img)
            obj.blur = str(obj.photo_id) + 'blur.jpg'
            obj.save()
            #
            # if response.status_code == 200:
            #     return response.json()
            # else:
            #     print("Can't recognize people:", response.text)
            #     return None
            '''
            for fc in upfaces:
                print("reco : "+str(id))
                x, y, w, h = [v for v in fc]
                sub_face = im1[y:y + h, x:x + w]
                savename = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "_cropped_" + str(id) + ".jpg"
                # print('fname=',savename)
                cfname=cv2.imwrite(savename, sub_face)
                print("cf name:",cfname)
                # filename
                result = client.recognize(photo=savename)
                # result=client.recognize(photo=filename)

                print(result)
                if len(result)>0:
                    print("recognition result")

                    uiddd=result[0]['name']
                    print(str(uiddd) +" : "+ str(ss))
                    if str(uiddd) != str(ss):
                        roi = cv2.GaussianBlur(sub_face, (23, 23), 30)
                        im1[y:y + roi.shape[0], x:x + roi.shape[1]] = roi
                        print('blur')
                        obj.status = "hide"

                        ops=Permission()
                        ops.image_id=obj.image_id
                        ops.user_id=uiddd
                        ops.status='pending'
                        ops.upuser_id=ss
                        ops.save()



                    #insert permission table
                id += 1
            '''
            # savename = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "blur" +str(obj.image_id) + str(id) + ".jpg"
            # obj.blur_image="blur" +str(obj.image_id) + str(id) + ".jpg"
            # obj.save()
            # print(obj.blur_image)
            # cv2.imwrite(savename,im1)
    return render(request,'photo_upload/nw.html',context)
def viewimage(request):
    obj=PhotoUpload.objects.all()
    context={
        'x':obj
    }
    return render(request,'photo_upload/viewimage.html',context)
def caption(request):
    if request.method=="POST":
        obj=PhotoUpload()
        obj.caption=request.POST.get('caption')
        obj.user_id=1
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request,'photo_upload/viewimage.html')

def vi(request):
    ss=request.session['uid']


    ob=list(Permission.objects.filter(user_id=ss,status='pending').values_list('image_id',flat=True))
    print(ob)
    # obj=ImageAs.objects.filter(image_id__in=ob)
    # obj=Permission.objects.filter(image_id__in=ob)
    obj = Permission.objects.filter(status='pending',user_id=ss)
    context={
        'u':obj
    }
    return render(request, 'photo_upload/per.html',context)

def app(request,idd):
    ob=Permission.objects.get(per_id=idd)
    ob.status='approved'
    ob.save()

    imgdata=PhotoUpload.objects.get(photo_id=ob.image_id)

    permit=list(Permission.objects.filter(image_id=ob.image_id,status='approved').values_list('user_id',flat=True))

    blur_strength = 31
    url = "https://api.luxand.cloud/photo/search/v2"
    headers = {"token": API_TOKEN}

    files = {"photo": open(str(settings.BASE_DIR) + str(settings.STATIC_URL) + imgdata.photo, "rb")}
    response = requests.post(url, headers=headers, files=files)
    result = json.loads(response.text)
    # #     print(result)
    img = cv2.imread(str(settings.BASE_DIR) + str(settings.STATIC_URL) + imgdata.photo)
    for reg in result:
        print('Name :', reg['name'])

        if int(reg['name']) in permit:
            pass
        else:
            l = reg['rectangle']['left']
            t = reg['rectangle']['top']
            r = reg['rectangle']['right']
            b = reg['rectangle']['bottom']
            print(l, ',', t, ',', r, ',', b)
            roi = img[t:b, l:r]
            blurred_roi = cv2.GaussianBlur(roi, (blur_strength, blur_strength), 0)
            # Replace the original ROI with the blurred one
            img[t:b, l:r] = blurred_roi

        # cv2.rectangle(img, (l, t), (r, b), (0, 255, 0), 2)
    sv_blur = str(settings.BASE_DIR) + str(settings.STATIC_URL) + str(imgdata.photo_id) + 'blur.jpg'
    cv2.imwrite(sv_blur, img)
    imgdata.blur_image = str(imgdata.photo_id) + 'blur.jpg'
    imgdata.save()

    obper=Permission.objects.filter(image_id=ob.image_id,status='pending')
    if len(obper)<=0:
        obv=PhotoUpload.objects.get(photo_id=ob.image_id)
        obv.status='show'
        obv.save()
    return vi(request)


def user_photo(request):
    ss=request.session["uid"]
    obj = PhotoUpload.objects.filter(user_id=ss)
    context={
        'x':obj
    }
    return render(request,'photo_upload/profile.html',context)

def lik(request,idd):
    app=PhotoUpload.objects.get(photo_id=idd)
    app.like=int(app.like)+1
    app.save()
    return photoupload(request)



