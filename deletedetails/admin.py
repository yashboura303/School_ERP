from django.contrib import admin
from .models import DeletedCurrentAddress, DeletedParentInfo, DeletedPermanentAddress, DeletedStudentInfo
# Register your models here.
admin.site.register(DeletedCurrentAddress)
admin.site.register(DeletedPermanentAddress)
admin.site.register(DeletedParentInfo)
admin.site.register(DeletedStudentInfo)