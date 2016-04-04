class OrdersActions
  constructor: ->
    @generateActions(
      'initData',
      'getAllOrder'
      'addOrder',
      'editOrder',
      'deleteOrder',
      'createOrder'
    )

@OrdersActions = alt.createActions(OrdersActions)
