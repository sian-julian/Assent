from django.db import models
from user.models import User
# Create your models here.
class Alert(models.Model):
    alert_id = models.AutoField(primary_key=True)
    alert = models.CharField(max_length=45)
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'alert'
