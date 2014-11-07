# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0005_remove_permobjectrelations_childobject'),
    ]

    operations = [
        migrations.AddField(
            model_name='permobjectrelations',
            name='childObject',
            field=models.ForeignKey(related_name=b'childObject', to='cegroups.permObjects', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='permobjectrelations',
            name='parentObject',
            field=models.ForeignKey(related_name=b'parentObject', to='cegroups.permObjects', null=True),
        ),
    ]
