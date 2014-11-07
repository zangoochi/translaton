# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0006_auto_20141006_0029'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='permObjectRelations',
            new_name='permObjectParent',
        ),
    ]
