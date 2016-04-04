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

  onCreateOrder: () ->
    data =
      table: ''
      total: '0.0'
      status: "ONGOING",
      items: []
    URL = '/orders'
    $.ajax
      method: 'POST'
      url: URL
      dataType: 'JSON'
      data: {order: data}
      success: (data) =>
        @orders = React.addons.update(
          @orders, { $push: [data] }
        )
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
