class OrdersActions
  constructor: ->
    @generateActions(
      'initData',
      'addOrder',
      'editOrder',
      'deleteOrder'
    )

@OrdersActions = alt.createActions(OrdersActions)
