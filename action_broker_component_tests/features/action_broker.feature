Feature: Action Broker

  Scenario: Player Buys Card
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 5        | 1      | 0           | buy        |
    Then action broker returns acquire result object with values:
      | buys | actions | temp treasure | treasure |
      | 0    | 0       | 0             | 4        |

  Scenario: Play Cannot Buy Card out of Phase
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase    |
      | 1         | 1337    | 1    | 0       | 0             | 0        | 1      | 0           | action        |
    Then action broker returns error with "not buy phase" message

  Scenario: Play Cannot Buy Card With Insufficient Treasure
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 0        | 1      | 0           | buy        |
    Then action broker returns error with "insufficient treasure" message

  Scenario: Player Cannot Acquire Card Without Acquire Limit
    When player submits a request to acquire card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 1       | 0             | 5        | 1      | 0           | action     |
    Then action broker returns error with "insufficient acquire limit" message

  Scenario: Player Acquires Card
    When player submits a request to acquire card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 1       | 0             | 5        | 1      | 3           | action     |
    Then action broker returns acquire result object with values:
      | buys | actions | temp treasure | treasure |
      | 1    | 0       | 0             | 5        |
