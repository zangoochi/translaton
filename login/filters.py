#==================================================================================================================================================================
# Helper Decorators.

# Use Decorators to help limit the views for certain pages. The def is_admin decorator is used to check if the user is 
# in the Administrator Group. If True then the user may enter the view calling the decorator, if not, then return user back to the 
# main page.

# To use the Decorator in a view do:

# from login.views import *  (This imports this view so this can be used. Can also call it specifically as import is_admin)
# Then above the view you want to test just place @is_admin
#==================================================================================================================================================================

from django.contrib.auth.decorators import user_passes_test

def is_admin(function=None):
  actual_decorator = user_passes_test(
    lambda u: u.is_authenticated() and u.groups.filter(name='Administrator').exists(), login_url='/'
  )
  return actual_decorator(function)


def is_grader(function=None):
  actual_decorator = user_passes_test(
    lambda u: u.is_authenticated() and u.groups.filter(name='Grader').exists() or is_admin, login_url='/'
  )
  return actual_decorator(function)

