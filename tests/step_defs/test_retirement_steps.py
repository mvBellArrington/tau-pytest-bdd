from pytest_bdd import scenario, parsers, given, when, then
from retirement import *
import pytest

CONVERTERS = {
    'birth_year': int,
    'birth_mont': int,
    'error': bool,
    'year_of_retirement': int,
    'month_of_retirement': str,
    'retirement_age': int,
    'remaining_month': int
}


@scenario('../features/retirement.feature', 'Determine valid year input')
@given('Birth year should be between 1900 and 2021 inclusively')
@when()
@then()
@scenario('../features/retirement.feature', 'Determine valid month input')
@given()
@when()
@scenario('../features/retirement.feature', 'Calculate retirement age')
@given()
@when()
@then()
@scenario('../features/retirement.feature', 'Calculate month and year of retirement')
@given()
@when()
@then()
def test_calculate_range(birth_year):
    assert birth_year == "2021"
