class ItemsStore
  @displayName: 'ItemsStore'

  constructor: ->
    @bindActions(ItemsActions)
    @items = []
    @menu_items = []
    @modifiers  = []
#    @exportPublicMethods(
#      {
#        getItems: @getItems
#      }
#    )
  onInitData: ->
    $.ajax
      method: 'GET'
      url: "/items"
      dataType: 'JSON'
      success: (e) =>
        @items = e
    $.ajax
      method: 'GET'
      url: "/menu_items"
      dataType: 'JSON'
      success: (e) =>
        @menu_items = e
    $.ajax
      method: 'GET'
      url: "/modifiers"
      dataType: 'JSON'
      success: (e) =>
        @modifiers = e
        @emitChange()

  onAddItem:(data) ->
    dat = { item: data }
    URL = '/items'
    $.ajax
      method: 'POST'
      url: URL
      dataType: 'JSON'
      data: dat
      success: (e) =>
        @items = React.addons.update(
          @items, { $push: [e] }
        )
        props =
          order_id: data.order_id
          item: e
        OrderActions.initData(props.order_id)




@ItemsStore = alt.createStore(ItemsStore)
