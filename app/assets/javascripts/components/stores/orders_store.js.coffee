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

  onGetAllOrder: () ->
    console.log("called")
    $.ajax
      method: 'GET'
      url: '/orders'
      dataType: 'JSON'
      success: (e) =>
        console.log(e)
        @onInitData(e)
        @emitChange()


  onGetOrder: (props)->
    $.ajax
      method: 'GET'
      url: "/orders/#{props}"
      dataType: 'JSON'
      success: (e) =>
        @order = e.order
        @items = e.order.items

  onInitData: (props) ->
    console.log("asd")
    @orders = props.orders

  getOrders: () ->
    @getState().orders

window.OrdersStore = alt.createStore(OrdersStore)
