from django.shortcuts import render
from like.models import Like
# Create your views here.
def like(request):
    if request.method=="POST":
        obj=Like()
        obj.user_id=1
        obj.like=request.POST.get('like')
        obj.save()
    return render(request,'like/like.html')