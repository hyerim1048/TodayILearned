### forms

forms.Field

django.core.validators import 

def clean : object validation

def clean_email(self) : - field Form validation 

   email_passed = self.cleaned_data.get("email") + additional validation 진행 

django.core.exceptions import ValidationError 

from django.utils.translation import ugettext_lazy as _

from .validators import validate_domainonly_email 

validate_domainonly_email
