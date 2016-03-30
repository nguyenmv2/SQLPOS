class ModifiersStore extends CRUDStore
  @displayName: 'ModifiersStore'

  constructor: ->
    @bindActions(ModifiersActions)
    @modifiers = []

    @exportPublicMethods({
      getModifiers: @getModifiers
    })

  addSucc: (modifier) ->   
    @modifiers = React.addons.update(
          @modifiers, { $push: [modifier] }
    )
    @emitChange()
  

  onAddModifier: (data) ->
    dat = { modifier: data }
    URL = '/modifiers'

    @addEntity(
      URL, 
      dat, 
      @addSucc
    ) 
  
  onEditModifier: (props) -> 
    data = 
      name: props.name
      deltaPrice: props.deltaPrice
    index = _.findIndex(@modifiers, (e) => e.id == props.id)

    URL = '/modifiers/#{ props.id }'
    dat= { modifier: data }
    super.editEntity(
      URL,
      dat,
      do (data) -> 
        @modifiers = React.addons.update(
          @modifiers, { $splice: [[index, 1, data]] }
        )
      
    )  

  onInitData: (props) ->
    @modifiers = props

  getModifiers: () ->
    @getState().modifiers
    
window.ModifiersStore = alt.createStore(ModifiersStore)
