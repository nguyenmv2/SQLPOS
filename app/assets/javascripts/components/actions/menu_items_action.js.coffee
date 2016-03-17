class MenuItemsActions
  constructor: ->
    @generateActions(
      'initData',
      'editMenuItem',
      'deleteMenuItem',
      'addMenuItem'
    )

@MenuItemsActions = alt.createActions(MenuItemsActions)