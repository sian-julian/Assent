"""assent1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from login import views

urlpatterns = [
    path('admin/', admin.site.urls),
    url('alert/', include('alert.url')),
    url('chat/', include('chat.url')),
    url('comment/', include('comment.url')),
    url('complaint/', include('complaint.url')),
    url('feedback/', include('feedback.url')),
    url('friend_request/', include('friend_request.url')),
    # url('image/', include('image.url')),
    url('like/', include('like.url')),
    url('login/', include('login.url')),
    url('photo_upload/', include('photo_upload.url')),
    url('user/', include('user.url')),
    url('temp/',include('temp.url')),
    url('$',views.login)
]
