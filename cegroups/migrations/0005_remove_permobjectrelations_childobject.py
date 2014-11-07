# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0004_auto_20141006_0023'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='permobjectrelations',
            name='childObject',
        ),
    ]
