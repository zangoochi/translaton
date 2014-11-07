# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0011_grouppermissions_test'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='grouppermissions',
            name='groupId',
        ),
        migrations.RemoveField(
            model_name='grouppermissions',
            name='test',
        ),
    ]
