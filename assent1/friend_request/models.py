from django.db import models
from user.models import User
# Create your models here.
class FriendRequest(models.Model):
    request_id = models.AutoField(primary_key=True)
    request = models.CharField(max_length=45)
    #user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    receiver_id = models.IntegerField()
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'friend_request'

class FriendRequest1(models.Model):
    request_id = models.AutoField(primary_key=True)
    request = models.CharField(max_length=45)
    sender_id = models.IntegerField()
    #user_id = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'friend_request1'
