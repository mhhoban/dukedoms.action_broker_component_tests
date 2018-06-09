Feature: Action Broker

  Scenario: Player Buys Card
    Given a stocked cardId 11 pile
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 5        | 11      | 0           | buy        |
    Then action broker successfully returns acquire result object with values:
      | buys | actions | temp treasure | treasure | success |
      | 0    | 0       | 0             | 4        | True

  @foo
  Scenario: Player Cannot Buy From Empty Card Pile
    Given an empty cardId 12 pile
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 5        | 12      | 0           | buy        |
    Then action broker returns pile empty error

  @wip
  Scenario: Play Cannot Buy Card out of Phase
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase    |
      | 1         | 1337    | 1    | 0       | 0             | 0        | 1      | 0           | action        |
    Then action broker returns error with "not buy phase" message

  @wip
  Scenario: Play Cannot Buy Card With Insufficient Treasure
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 0        | 1      | 0           | buy        |
    Then action broker returns error with "insufficient treasure" message

  @wip
  Scenario: Player Cannot Acquire Card Without Acquire Limit
    When player submits a request to acquire card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 1       | 0             | 5        | 1      | 0           | action     |
    Then action broker returns error with "insufficient acquire limit" message

  @wip
  Scenario: Player Acquires Card
    When player submits a request to acquire card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 1       | 0             | 5        | 1      | 3           | action     |
    Then action broker returns acquire result object with values:
      | buys | actions | temp treasure | treasure |
      | 1    | 0       | 0             | 5        |
