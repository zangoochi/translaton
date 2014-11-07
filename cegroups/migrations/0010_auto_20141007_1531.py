# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0009_auto_20141006_0045'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='permobjectparent',
            name='childObject',
        ),
        migrations.RemoveField(
            model_name='permobjectparent',
            name='parentObject',
        ),
        migrations.DeleteModel(
            name='permObjectParent',
        ),
        migrations.AlterField(
            model_name='grouppermissions',
            name='groupId',
            field=models.ForeignKey(to='auth.Group'),
        ),
    ]
