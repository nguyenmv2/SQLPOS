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

window.OrderStore = alt.createStore(OrderStore)
