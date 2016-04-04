class ItemsActions
  constructor: ->
    @generateActions(
      'initData',
      'addItem'
    )
@ItemsActions = alt.createActions(ItemsActions)
