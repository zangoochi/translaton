# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0019_grouppermissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='permObjectParent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('childObject', models.ForeignKey(related_name=b'+', to='cegroups.permObjects', null=True)),
                ('parentObject', models.ForeignKey(related_name=b'+', to='cegroups.permObjects', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
