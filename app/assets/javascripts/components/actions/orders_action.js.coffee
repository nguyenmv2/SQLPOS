class OrdersActions
  constructor: ->
    @generateActions(
      'initData',
      'getOrder',
      'addOrder',
      'editOrder',
      'deleteOrder'
    )
