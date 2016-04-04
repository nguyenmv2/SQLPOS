class OrderStore
  @displayName: 'OrderStore'

  constructor: ->
    @bindActions(OrderActions)
    @order = []

  onRefresh: () ->
    @emitChange()

  onInitData: (id) ->
    $.ajax
      method: 'GET'
      url: "/orders/#{id}"
      dataType: 'JSON'
      success: (e) =>
        @order = e.order
        @emitChange()

  onFinishOrder: () ->
    data =
      table: @order.table
      total: @order.total
      status: 'COMPLETED'
      items: @order.items
    URL = "/orders/#{@order.id}"
    $.ajax
      method: 'PUT'
      url: URL
      dataType: 'JSON'
      data: {order: data}
      success: (e) =>
        @order = e
        @emitChange()

window.OrderStore = alt.createStore(OrderStore)
