from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
# Create your models here.


class Agent(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, default=None, null=True)
    phone = models.CharField(max_length=12)
    photo = models.ImageField(upload_to='photo/%Y/%m/%d')


    def __str__(self):
        return self.user.username


class Property(models.Model):
    RENTAL = 'rental'
    SALE = 'sale'
    APARTMENT = 'apartment'
    HOUSE = 'house'
    TRANSACTION = (
                 (RENTAL, ('Rental')),
                 (SALE, ('Sale')),
    )

    TYPE = (
        (APARTMENT, ('Apartment')),
        (HOUSE, ('House')),
    )

    title = models.CharField(max_length=200)
    transaction = models.CharField(
        max_length=32,
        choices=TRANSACTION,
        default=SALE,
    )

    type = models.CharField(
        max_length=32,
        choices=TYPE,
        default=APARTMENT,
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    agent = models.ForeignKey(Agent, on_delete=models.SET_DEFAULT, default=None, null=True)
    price = models.IntegerField()
    size = models.IntegerField()
    rooms = models.IntegerField()
    bathrooms = models.IntegerField()
    garage = models.IntegerField(default=0)
    is_published = models.BooleanField(default=False)
    date = models.DateTimeField(default=datetime.now, blank=True)
    description = models.CharField(max_length=1000, default='')
    photo = models.ImageField(upload_to='photo/%Y/%m/%d')
    photo_1 = models.ImageField(upload_to='photo/%Y/%m/%d', blank=True, default=None)
    photo_2 = models.ImageField(upload_to='photo/%Y/%m/%d', blank=True, default=None)
    photo_3 = models.ImageField(upload_to='photo/%Y/%m/%d', blank=True, default=None)
    photo_4 = models.ImageField(upload_to='photo/%Y/%m/%d', blank=True, default=None)
    photo_5 = models.ImageField(upload_to='photo/%Y/%m/%d', blank=True, default=None)
    photo_6 = models.ImageField(upload_to='photo/%Y/%m/%d', blank=True, default=None)

    def __str__(self):
        return self.title


