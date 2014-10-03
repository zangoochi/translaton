from django.db import models

class Record(models.Model):
	year            = models.PositiveSmallIntegerField()
	source_language = models.CharField(max_length=4)
	target_language = models.CharField(max_length=4)
	exam_number     = models.PositiveSmallIntegerField()
	second_passage  = models.CharField(max_length=2)
	a_passage_markings = models.CharField(max_length=3)
	second_passage_markings = models.CharField(max_length=3)
	grader_one      = models.PositiveSmallIntegerField()
	grader_two      = models.PositiveSmallIntegerField()
	target_text_a   = models.TextField()
	target_text_b_c = models.TextField()
	grader_stop_a   = models.CharField(max_length=3)
	grader_stop_b_c = models.CharField(max_length=3)
	incomplete_a    = models.CharField(max_length=3)
	incomplete_b_c  = models.CharField(max_length=3)
	global_quality_pts = models.PositiveSmallIntegerField()
	exam_reviewed_a = models.CharField(max_length=3, default="no")
	exam_appealed_b_c = models.CharField(max_length=3, default="no")


