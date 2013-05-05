# language: en
Feature: Stops Nearby
  In order catch a bus
  As a transit user
  I want to know the stops near my GPS location

  Scenario: Find stops within the default distance
    Given I am at 45.43074 latitude
    And I am at -75.6927 longitude
    When I request stops nearby
    Then the stops should be:
#     | distance | number | name                    |
      |        5 |   1883 | DALHOUSIE / ST PATRICK  |
      |       18 |   6402 | DALHOUSIE / ST PATRICK  |
      |       96 |   2322 | MURRAY / DALHOUSIE      |
      |      170 |   6837 | DALHOUSIE / CLARENCE    |
      |      172 |   2321 | ST PATRICK / CUMBERLAND |
      |      230 |   6838 | DALHOUSIE / YORK        |
      |      242 |   1884 | DALHOUSIE / BRUYÈRE     |
      |      260 |   7575 | MURRAY / CUMBERLAND     |
      |      272 |   2996 | BRUYÈRE / DALHOUSIE     |
      |      301 |   7585 | BRUYERE / PARENT        |
      |      332 |   2490 | BRUYERE / PARENT        |

 Scenario: Find stops within a specific distance
    Given I am at 45.43074 latitude
    And I am at -75.6927 longitude
    When I request stops nearby within 100 meters
    Then the stops should be:
#     | distance | number | name                    |
      |        5 |   1883 | DALHOUSIE / ST PATRICK  |
      |       18 |   6402 | DALHOUSIE / ST PATRICK  |
      |       96 |   2322 | MURRAY / DALHOUSIE      |
