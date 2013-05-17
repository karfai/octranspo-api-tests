# language: en
Feature: Stops Nearby
  In order catch a bus
  As a transit user
  I want to know the stops near my GPS location

  Scenario: Find stops within the default (400m) distance
    Given I am at 45.43074 latitude
    And I am at -75.6927 longitude
    When I request stops nearby
    Then the stops should be:
#     | distance | number | name                    |
      |   5 | 1883 | DALHOUSIE / ST PATRICK  |
      |  18 | 6402 | DALHOUSIE / ST PATRICK  |
      |  96 | 2322 | MURRAY / DALHOUSIE      |
      | 170 | 6837 | DALHOUSIE / CLARENCE    |
      | 172 | 2321 | ST PATRICK / CUMBERLAND |
      | 230 | 6838 | DALHOUSIE / YORK        |
      | 242 | 1884 | DALHOUSIE / BRUYÈRE     |
      | 260 | 7575 | MURRAY / CUMBERLAND     |
      | 272 | 2996 | BRUYÈRE / DALHOUSIE     |
      | 301 | 7585 | BRUYERE / PARENT        |
      | 332 | 2490 | BRUYERE / PARENT        |

 Scenario Outline: Find stops within a specific distance
    Given I am at <lat> latitude
    And I am at <lon> longitude
    When I request stops nearby within <distance> meters
    Then the stops should be the <position> <count> in <filename>:

    Examples:
    |      lat |      lon | distance | position | count | filename    |
    | 45.43074 | -75.6927 |      100 | first    |     3 | stops.table |
    | 45.43074 | -75.6927 |      90  | first    |     2 | stops.table |
