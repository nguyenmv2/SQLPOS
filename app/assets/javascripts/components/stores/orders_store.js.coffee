class OrdersStore
  @displayName: 'OrdersStore'

  constructor: ->
    @bindActions(OrdersActions)
    @orders = []

#    @exportPublicMethods(
#      {
#        getOrders: @getOrders
#      }
#    )

