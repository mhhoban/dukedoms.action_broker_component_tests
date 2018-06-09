Feature: Action Broker

  Scenario: Player Buys Card
    Given a stocked cardId 11 pile
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 5        | 11      | 0           | buy        |
    Then action broker successfully returns acquire result object with values:
      | buys | actions | temp treasure | treasure | success |
      | 0    | 0       | 0             | 4        | True

  Scenario: Player Cannot Buy From Empty Card Pile
    Given an empty cardId 12 pile
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 5        | 12      | 0           | buy        |
    Then action broker returns "pile empty" error

  Scenario: Player Cannot Buy With No Treasure
    Given a stocked cardId 11 pile
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase |
      | 1         | 1337    | 1    | 0       | 0             | 0        | 11      | 0           | buy        |
    Then action broker returns "insufficient treasure" error

  Scenario: Player Cannot Buy With No Buys
    Given a stocked cardId 11 pile
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId  | acquire lim | turn phase |
      | 1         | 1337    | 0    | 0       | 0             | 0        | 11      | 0           | buy        |
    Then action broker returns "insufficient buys" error

  Scenario: Play Cannot Buy Card out of Phase
    When player submits a request to buy a card with values:
      | player id | game id | buys | actions | temp treasure | treasure | cardId | acquire lim | turn phase    |
      | 1         | 1337    | 1    | 0       | 0             | 0        | 1      | 0           | action        |
    Then action broker returns "wrong phase" error

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
