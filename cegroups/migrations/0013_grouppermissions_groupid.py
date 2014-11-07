# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0001_initial'),
        ('cegroups', '0012_auto_20141007_1557'),
    ]

    operations = [
        migrations.AddField(
            model_name='grouppermissions',
            name='groupId',
            field=models.ForeignKey(related_name=b'+', to='auth.Group', null=True),
            preserve_default=True,
        ),
    ]
