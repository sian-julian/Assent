from django.db import models
from user.models import User
# Create your models here.
class PhotoUpload(models.Model):
    photo_id = models.AutoField(primary_key=True)
    photo = models.CharField(max_length=100)
    caption = models.CharField(max_length=300)
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=100)
    like = models.CharField(max_length=30, blank=True, null=True)
    blur = models.CharField(max_length=200, blank=True, null=True)
    show = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'photo_upload'

class Permission(models.Model):
    per_id = models.AutoField(primary_key=True)
    # image_id = models.IntegerField()
    image=models.ForeignKey(PhotoUpload,on_delete=models.CASCADE)
    user_id = models.IntegerField()
    status = models.CharField(max_length=45)
    upuser_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'permission'
