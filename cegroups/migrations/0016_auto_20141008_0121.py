# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0015_permobjects_permoptions'),
    ]

    operations = [
        migrations.DeleteModel(
            name='permObjects',
        ),
        migrations.DeleteModel(
            name='permOptions',
        ),
    ]
