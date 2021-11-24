Feature: DuckDuckGo Instant Answer  REST API
  As an application developer,
  I want to get instant answers for search terms via a REST API,
  So that my app can get answers anywhere.


  Scenario Outline: Basic DuckDuckGo API Query
    Given the DuckDuckGo API is queried with <last_name>
    Then the response status code is 200
    And the response contains results for <last_name>

    Examples: Presidents 1-10
    | last_name  |
    | Washington |
    | Adams      |
    | Jefferson  |
    | Madison    |
    | Monroe     |
    | Adams      |
    | Jackson    |
    | Buren      |
    | Harrison   |
    | Tyler      |

    Examples: Presidents 11-20
    | last_name  |
    | Polk       |
    | Taylor     |
    | Fillmore   |
    | Pierce     |
    | Buchanan   |
    | Lincoln    |
    | Johnson    |
    | Grant      |
    | Hayes      |
    | Garfield   |

    Examples: Presidents 21-30
    | last_name  |
    | Arthur     |
    | Cleveland  |
    | McKinley   |
    | Roosevelt  |
    | Taft       |
    | Wilson     |
    | Harding    |
    | Coolidge   |
    | Hoover     |
    | Roosevelt  |

    Examples: Presidents 31-44
    | last_name  |
    | Truman     |
    | Eisenhower |
    | Kennedy    |
    | Johnson    |
    | Nixon      |
    | Ford       |
    | Carter     |
    | Reagan     |
    | Bush       |
    | Clinton    |
    | Bush       |
    | Obama      |
    | Trump      |
    | Biden      |





