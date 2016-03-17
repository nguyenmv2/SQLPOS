class OrdersActions
  constructor: ->
    @generateActions(
      'initData',
      'addOrder',
      'editOrder',
      'deleteOrder'
    )