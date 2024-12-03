from django.db import models
# Create your models here.

class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    username = models.CharField(max_length=45)
    mail = models.CharField(max_length=45)
    phone = models.CharField(max_length=45)
    age = models.CharField(max_length=11)
    sex = models.CharField(max_length=5)
    image = models.CharField(max_length=100)
    password = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'user'
