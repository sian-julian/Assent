from django.db import models
from user.models import User
from photo_upload.models import PhotoUpload
# Create your models here.
class Like(models.Model):
    #user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    like_id = models.AutoField(primary_key=True)
    photo_id = models.IntegerField()
    # photo = models.ForeignKey(PhotoUpload, on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'like'
