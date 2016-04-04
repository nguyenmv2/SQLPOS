class OrderActions
  constructor: ->
    @generateActions(
      'initData',
      'addItem',
      'refresh',
      'finishOrder'
    )

@OrderActions = alt.createActions(OrderActions)
