# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0013_grouppermissions_groupid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='grouppermissions',
            name='groupId',
        ),
        migrations.RemoveField(
            model_name='grouppermissions',
            name='permObject',
        ),
        migrations.RemoveField(
            model_name='grouppermissions',
            name='permOption',
        ),
        migrations.DeleteModel(
            name='groupPermissions',
        ),
        migrations.DeleteModel(
            name='permObjects',
        ),
        migrations.DeleteModel(
            name='permOptions',
        ),
    ]
