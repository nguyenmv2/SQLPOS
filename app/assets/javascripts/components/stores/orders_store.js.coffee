class OrdersStore
  @displayName: 'OrdersStore'

  constructor: ->
    @bindActions(OrdersActions)
    @orders = []
    @exportPublicMethods(
      {
        getOrders: @getOrders
      }
    )


  onGetOrder: (props)->
    $.ajax
      method: 'GET'
      url: "/orders/#{props}"
      dataType: 'JSON'
      success: (e) =>
        @order = e.order
        @items = e.order.items

  onInitData: (props) ->
    @orders = props.orders

  getOrders: () ->
    @getState().orders

window.OrdersStore = alt.createStore(OrdersStore)
