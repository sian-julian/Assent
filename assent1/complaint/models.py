from django.db import models
from user.models import User
# Create your models here.
class Complaints(models.Model):
    complaint_id = models.AutoField(primary_key=True)
    complaint = models.CharField(max_length=45)
    reply = models.CharField(max_length=45)
    #user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'complaints'
