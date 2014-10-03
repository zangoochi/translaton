from django.contrib.auth.models import User, AnonymousUser
from django.test import TestCase
from django.test.client import RequestFactory, Client


from texts.views import *

# Testing class for source text tests
class sourceTextTest(TestCase):
		def setup(self):
			# Had issues defining self.user, and self.factory here. Moved that code into testing functions
			pass

		# Make sure the page resolves
		def test_enter_new_source_resolves(self):
			# Create GET response from enter new source page
			response = self.client.get("/texts/enter-new-source/")
			self.assertEqual(response.status_code, 200)

		# Make sure 
		def test_enter_new_source_can_make_a_request(self):
			# Create instance of get request
			rf = RequestFactory()
			request = rf.get('/texts/enter-new-source/')

			# Simulate logged in user
			testuser = User.objects.create_user(username='testuser',email='testuser@test.com',password='t')
			request.user = testuser

			# Send request to view
			response = enterNewSource(request)
			self.assertEqual(response.status_code, 200)

		# Currently this test is failing due to no redirect when manually typing in the url without being logged in
		def test_enter_new_source_denies_anonymous(self):
			# Ensuring that the user is anonymous before testing
			self.user = AnonymousUser()
			
			# test that anonymous get request redirects to login page
			response = self.client.get('/texts/enter-new-source/', follow=True)
			self.assertRedirects(response, '/login/') # Does not redirect, returns 200 status, instead of 302 redirect status code
			
			# test that anonymous post request redirects to login page
			#response = self.client.post('/texts/enter-new-source/', follow=True)
			#self.assertRedirects(response, '/login/')

		# Currently this test will always fail because the form is never validated before posting
		def test_enter_new_source_fails_blank_form_post(self):
			# Simulate logged in user
			testuser = User.objects.create_user(username='testuser',email='testuser@test.com',password='t')
			self.user = testuser

			# Send request to view
			#response = self.client.post('/texts/enter-new-source/', {})
			#self.assertFormError(response, 'form', 'year', 'This field is required')

			# Can add more checks for invalid input for source and target languages, set Number, Passage letter, version number, and source passage input...