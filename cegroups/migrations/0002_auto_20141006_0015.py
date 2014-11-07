# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='groupPermissions',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('groupId', models.IntegerField(default=1)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='permObjects',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('objectName', models.CharField(max_length=255)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='permOptions',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('description', models.CharField(max_length=255)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='grouppermissions',
            name='permObject',
            field=models.ForeignKey(to='cegroups.permObjects'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='grouppermissions',
            name='permOption',
            field=models.ForeignKey(to='cegroups.permOptions'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='permobjectrelations',
            name='childObject',
            field=models.ForeignKey(related_name=b'childObject', to='cegroups.permObjects'),
        ),
        migrations.DeleteModel(
            name='permParentObjects',
        ),
        migrations.AlterField(
            model_name='permobjectrelations',
            name='parentObject',
            field=models.ForeignKey(related_name=b'parentObject', to='cegroups.permObjects'),
        ),
        migrations.DeleteModel(
            name='permChildObjects',
        ),
    ]
