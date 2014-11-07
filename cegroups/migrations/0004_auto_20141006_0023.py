# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0003_auto_20141006_0020'),
    ]

    operations = [
        migrations.CreateModel(
            name='permObjectRelations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('childObject', models.ForeignKey(related_name=b'childObject', to='cegroups.permObjects')),
                ('parentObject', models.ForeignKey(related_name=b'parentObject', to='cegroups.permObjects')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='permobjectrel',
            name='childObject',
        ),
        migrations.RemoveField(
            model_name='permobjectrel',
            name='parentObject',
        ),
        migrations.DeleteModel(
            name='permObjectRel',
        ),
    ]
