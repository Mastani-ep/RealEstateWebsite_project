# Generated by Django 4.1 on 2022-09-07 21:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('estatesite', '0010_alter_property_photo_1_alter_property_photo_2_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='property',
            name='photo_1',
            field=models.ImageField(blank=True, default=None, upload_to='photo/%Y/%m/%d'),
        ),
        migrations.AlterField(
            model_name='property',
            name='photo_2',
            field=models.ImageField(blank=True, default=None, upload_to='photo/%Y/%m/%d'),
        ),
        migrations.AlterField(
            model_name='property',
            name='photo_3',
            field=models.ImageField(blank=True, default=None, upload_to='photo/%Y/%m/%d'),
        ),
        migrations.AlterField(
            model_name='property',
            name='photo_4',
            field=models.ImageField(blank=True, default=None, upload_to='photo/%Y/%m/%d'),
        ),
        migrations.AlterField(
            model_name='property',
            name='photo_5',
            field=models.ImageField(blank=True, default=None, upload_to='photo/%Y/%m/%d'),
        ),
        migrations.AlterField(
            model_name='property',
            name='photo_6',
            field=models.ImageField(blank=True, default=None, upload_to='photo/%Y/%m/%d'),
        ),
    ]