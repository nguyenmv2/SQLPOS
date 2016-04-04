class OrderActions
  constructor: ->
    @generateActions(
      'initData',
      'addItem',
      'refresh'
    )

@OrderActions = alt.createActions(OrderActions)
