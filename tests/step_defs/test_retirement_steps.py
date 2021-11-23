import pytest
from pytest_bdd import given, when, then, parsers, scenario
from retirement import *

@scenario('../features/retirement.feature', 'Calculate retirement age')

@given(parsers.parse('the {birth_month} and {birth_year} entered are valid'), target_fixture="determine_retirement")
def determine_retirement(birth_month, birth_year):
    calculated_year, calculate_month = calculate_retirement_date(birth_year, birth_month)