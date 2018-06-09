Feature: Play Card

  Scenario: Play Township Card
    When action broker receives play card request for card "Township":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 7       | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 1    | 1       | 3        | 0             |

  Scenario: Play Maproom Card
    When action broker receives play card request for card "Maproom":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 8       | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 1    | 1       | 3        | 0             |

  Scenario: Play Forge Card
    When action broker receives play card request for card "Forge":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 9       | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 1    | 0       | 3        | 0             |

  Scenario: Play Cosmopolitan Card
    When action broker receives play card request for card "Cosmopolitan":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 10      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 2    | 0       | 3        | 0             |

  Scenario: Play Manic Card
    When action broker receives play card request for card "Manic":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 11      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 1    | 2       | 3        | 0             |

  Scenario: Play Bazzar Card
    When action broker receives play card request for card "Bazzar":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 12      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 2    | 1       | 3        | 1             |

  Scenario: Play Woodsman Card
    When action broker receives play card request for card "Woodsman":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 13      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 2    | 0       | 3        | 0             |

  Scenario: Play Fiete Card
    When action broker receives play card request for card "Fiete":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 14      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | -1          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure | target card |
      | 2    | 3       | 3        | 2             | -1          |

  Scenario: Play Artificier Card
    When action broker receives play card request for card "Artificer":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 15      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | 11          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 1    | 0       | 3        | 0             |

  Scenario: Play Sorceress Card
    When action broker receives play card request for card "Sorceress":
      | card id | slot id | player id | game id | buys | actions | treasure | temp treasure | phase  | target card |
      | 16      | 0       | 1         | 1337    | 1    | 1       | 3        | 0             | action | 11          |
    Then action broker returns results:
      | buys | actions | treasure | temp treasure |
      | 1    | 0       | 3        | 0             |
