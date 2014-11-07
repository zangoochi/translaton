# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0007_auto_20141006_0032'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='permObjectParent',
            new_name='permObjectParents',
        ),
    ]
