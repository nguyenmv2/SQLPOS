class OrdersStore
  @displayName: 'OrdersStore'

  constructor: ->
    @bindActions(OrdersActions)
    @order = []

#    @exportPublicMethods(
#      {
#        getOrders: @getOrders
#      }
#    )

  onGetOrder: (props)->
    $.ajax
      method: 'GET'
      url: "/orders/#{ props }"
      dataType: 'JSON'
      success: (e) =>
        @order = e.order 
