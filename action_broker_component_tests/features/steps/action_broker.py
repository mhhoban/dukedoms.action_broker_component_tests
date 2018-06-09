from behave import given, then, when
from hamcrest import assert_that, equal_to

@when('player submits a request to buy a card with values')
def submit_buy_request(context):
    """
    submit request to buy a given card
    """
    outcome, result = context.clients.action_broker.acquireCard.buy_card(
        buyCardRequest={
            'playerId':int(context.table.rows[0]['player id']),
            'gameId':int(context.table.rows[0]['game id']),
            'playerBuys':int(context.table.rows[0]['buys']),
            'playerActions':int(context.table.rows[0]['actions']),
            'playerTempTreasure':int(context.table.rows[0]['temp treasure']),
            'playerTreasure':int(context.table.rows[0]['treasure']),
            'cardId':int(context.table.rows[0]['cardId']),
            'aquireLimit':int(context.table.rows[0]['acquire lim']),
            'playerTurnPhase':context.table.rows[0]['turn phase']
        }
    ).result()
    assert_that(result.status_code, equal_to(200))
    context.outcome = outcome

@then('action broker successfully returns acquire result object with values')
def assert_acquire_results_success(context):
    """
    asserts the contents of the acquire results object returned
    """
    assert_that(context.outcome.success, equal_to(True))
    assert_that(context.outcome.playerBuys, equal_to(int(context.table.rows[0]['buys'])))
    assert_that(context.outcome.playerActions, equal_to(int(context.table.rows[0]['actions'])))
    assert_that(context.outcome.playerTempTreasure, equal_to(int(context.table.rows[0]['temp treasure'])))
    assert_that(context.outcome.playerTreasure, equal_to(int(context.table.rows[0]['treasure'])))
