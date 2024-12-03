from django.db import models
from user.models import User
from photo_upload.models import PhotoUpload
# Create your models here.
class Comment(models.Model):
    #user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    comment_id = models.AutoField(primary_key=True)
    comment = models.CharField(max_length=100)
    #photo_id = models.IntegerField()
    photo=models.ForeignKey(PhotoUpload,on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'comment'


class Cyber(models.Model):
    c_id = models.AutoField(primary_key=True)
    comments = models.CharField(max_length=100)
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'cyber'
