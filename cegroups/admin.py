from django.contrib import admin
from cegroups.models import permObjects, groupPermissions, permOptions

# Register your models here.
admin.site.register(permObjects)
admin.site.register(groupPermissions)
admin.site.register(permOptions)
