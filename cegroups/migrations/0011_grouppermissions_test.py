# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0010_auto_20141007_1531'),
    ]

    operations = [
        migrations.AddField(
            model_name='grouppermissions',
            name='test',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
