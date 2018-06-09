from behave import given, then, when
from hamcrest import assert_that, equal_to

@when('action broker receives play card request for card "{card}"')
def send_play_card_request(context, card):
    """
    sends play card request to action broker
    """
    outcome, result = context.clients.action_broker.playCard.play_card(
        playCardRequest={
            'playerId':int(context.table.rows[0]['player id']),
            'gameId':int(context.table.rows[0]['game id']),
            'playerBuys':int(context.table.rows[0]['buys']),
            'playerActions':int(context.table.rows[0]['actions']),
            'playerTempTreasure':int(context.table.rows[0]['temp treasure']),
            'playerTreasure':int(context.table.rows[0]['treasure']),
            'cardId':int(context.table.rows[0]['card id']),
            'cardSlotId':int(context.table.rows[0]['slot id']),
            'targetCardId':int(context.table.rows[0]['target card']),
            'playerTurnPhase':context.table.rows[0]['phase'],
        }
    ).result()
    assert_that(result.status_code, equal_to(200))
    context.outcome = outcome

@then('action broker returns results')
def assert_action_broker_results(context):
    """
    asserts that action broker returned expected results
    """
    outcome = context.outcome
    assert_that(outcome.success, equal_to(True))
    assert_that(outcome['playerBuys'], equal_to(int(context.table.rows[0]['buys'])))
    assert_that(outcome['playerActions'], equal_to(int(context.table.rows[0]['actions'])))
    assert_that(outcome['playerTempTreasure'], equal_to(int(context.table.rows[0]['temp treasure'])))
    assert_that(outcome['playerTreasure'], equal_to(int(context.table.rows[0]['treasure'])))
