"""
This module contains step definitions for service.feature.
It uses the requests package:
http://docs.python-requests.org/
"""

import requests

from pytest_bdd import scenario, given, then, parsers

# Shared Variables

DUCKDUCKGO_API = 'http://api.duckduckgo.com/'
QUERY = 'presidents of the united states'


# Scenarios

@scenario('../features/lab10.feature', 'Basic DuckDuckGo API Query')
def test_ddg():
    pass


# Given Steps

@given(parsers.parse('the DuckDuckGo API is queried with {last_name}'),
       target_fixture='ddg_response', converters=dict(last_name=str))
def ddg_response(last_name):
    params = {'q': QUERY, 'format': 'json'}
    response = requests.get(DUCKDUCKGO_API, params=params)
    return response


# Then Steps

@then(parsers.parse('the response contains results for {last_name}'),
      converters=dict(last_name=str))
def ddg_response_contents(ddg_response, last_name):
    exists = False
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    for topic in ddg_response.json()['RelatedTopics']:
        if last_name in topic['Text']:
            exists = True
            break
    assert exists


@then(parsers.parse('the response status code is {code:d}'), converters=dict(last_name=str))
def ddg_response_code(ddg_response, code):
    assert ddg_response.status_code == code
