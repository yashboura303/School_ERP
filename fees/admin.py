from django.contrib import admin
from .models import Fee,FeeCategory, FeeCycle, FeeDiscount, ClassSectionFees

admin.site.register(Fee)
admin.site.register(FeeCategory)
admin.site.register(FeeCycle)
admin.site.register(FeeDiscount)
admin.site.register(ClassSectionFees)
# Register your models here.
