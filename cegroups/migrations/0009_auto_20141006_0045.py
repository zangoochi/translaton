# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cegroups', '0008_auto_20141006_0042'),
    ]

    operations = [
        migrations.CreateModel(
            name='permObjectParent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('childObject', models.ForeignKey(related_name=b'childObject', to='cegroups.permObjects', null=True)),
                ('parentObject', models.ForeignKey(related_name=b'parentObject', to='cegroups.permObjects', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='permobjectparents',
            name='childObject',
        ),
        migrations.RemoveField(
            model_name='permobjectparents',
            name='parentObject',
        ),
        migrations.DeleteModel(
            name='permObjectParents',
        ),
    ]
