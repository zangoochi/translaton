from django.contrib import admin
from texts.models import SourceText, TargetText, Exam
from texts.models import Language, sourceDiscrepancyQueue, Error, Grader
from texts.models import ErrorCode, Discrepancy, TargetReviewQueue, TargetInputQueue, GraderQueue, ErrorJSON

# Register your models here.
admin.site.register(SourceText)
admin.site.register(TargetText)
admin.site.register(Language)
admin.site.register(Exam)
admin.site.register(ErrorCode)
admin.site.register(Discrepancy)
admin.site.register(TargetReviewQueue)
admin.site.register(GraderQueue)
admin.site.register(sourceDiscrepancyQueue)
admin.site.register(ErrorJSON)
admin.site.register(Error)
admin.site.register(TargetInputQueue)
admin.site.register(Grader)
