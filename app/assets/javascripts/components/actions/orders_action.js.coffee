class OrdersActions
  constructor: ->
    @generateActions(
      'initData',
      'getAllOrder'
      'addOrder',
      'editOrder',
      'deleteOrder',
      
    )

@OrdersActions = alt.createActions(OrdersActions)
