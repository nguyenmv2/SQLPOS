class ItemsStore
  @displayName: 'ItemsStore'

  constructor: ->
    @bindActions(ItemsActions)
    @items = []
#    @exportPublicMethods(
#      {
#        getItems: @getItems
#      }
#    )





@ItemsStore = alt.createStore(ItemsStore)