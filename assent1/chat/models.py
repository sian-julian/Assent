from django.db import models

# Create your models here.


class Chat(models.Model):
    chat_id = models.AutoField(primary_key=True)
    message = models.CharField(max_length=450)
    sender_id = models.IntegerField()
    rec_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'chat'
