class MenuItemsStore
  @displayName: 'MenuItemsStore'

  constructor: ->
    @bindActions(MenuItemsActions)
    @menu_items = []

    @exportPublicMethods(
      {
        getMenuItems: @getMenuItems
      }
    )

  onEditMenuItem: (props) ->
    data =
      name:   props.name
      price:  props.price
    index = _.findIndex(@menu_items, (e) => e.id == props.id)
    $.ajax
      method: 'PUT'
      url: "/menu_items/#{ props.id }"
      dataType: 'JSON'
      data:
        menu_item: data
      success: (data) =>
        @menu_items = React.addons.update(
          @menu_items, { $splice: [[index, 1, data]] }
        )
        @emitChange()

  onDeleteMenuItem: (props) ->
    index = _.findIndex(@menu_items, (e) => e.id == props)
    $.ajax
      method: 'DELETE'
      url: "/menu_items/#{ props }"
      dataType: 'JSON'
      success: () =>
        @menu_items = React.addons.update(
          @menu_items, { $splice: [[index , 1]]}
        )
        @emitChange()


  onAddMenuItem: (data) ->
    dat = { menu_item: data }
    URL = '/menu_items'
    $.ajax
      method: 'POST'
      url: URL
      dataType: 'JSON'
      data: dat
      success: (e) =>
        console.log(e)

        @menu_items = React.addons.update(
          @menu_items, { $push: [e] }
        )
        @emitChange()

    # $.post '/menu_items ', { menu_item: data }, (e) =>
    #   @menu_items = React.addons.update(
    #     @menu_items, { $push: [e] }
    #   )
    #   @emitChange()
    # , 'JSON'

  onInitData: () ->
    $.ajax
      method: 'GET'
      url: "/menu_items"
      dataType: 'JSON'
      success: (e) =>
        console.log(e)
        @menu_items = e
        @emitChange()


  getMenuItems: () ->
    @getState().menu_items

window.MenuItemsStore = alt.createStore(MenuItemsStore)
