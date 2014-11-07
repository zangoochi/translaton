# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0001_initial'),
        ('cegroups', '0018_permobjects'),
    ]

    operations = [
        migrations.CreateModel(
            name='groupPermissions',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('groupId', models.ForeignKey(related_name=b'+', to='auth.Group', null=True)),
                ('permObject', models.ForeignKey(to='cegroups.permObjects')),
                ('permOption', models.ForeignKey(to='cegroups.permOptions')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
