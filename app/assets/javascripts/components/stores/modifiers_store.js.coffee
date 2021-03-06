class ModifiersStore
  @displayName: 'ModifiersStore'

  constructor: ->
    @bindActions(ModifiersActions)
    @modifiers = []

    @exportPublicMethods(
      {
        getModifiers: @getModifiers
      }
    )

  onAddModifier: (data) ->
    dat = { modifier: data }
    URL = '/modifiers'
    $.ajax
      method: 'POST'
      url: URL
      dataType: 'JSON'
      data: dat
      success: (modifier) =>
        @modifiers = React.addons.update(
          @modifiers, { $push: [modifier] }
        )
        @emitChange()

  onEditModifier: (props) ->
    data =
      name:       props.name
      deltaPrice: props.deltaPrice
    index = _.findIndex(@modifiers, (e) => e.id == props.id)
    URL = "/modifiers/#{ props.id }"
    dat= { modifier: data }
    $.ajax
      method: 'PUT'
      url: URL
      dataType: 'JSON'
      data: dat
      success:(data) =>
        @modifiers = React.addons.update(
          @modifiers, { $splice: [[index, 1, data]] }
        )
        @emitChange()

  onDeleteModifier: (props) ->
    index = _.findIndex(@modifiers, (e) => e.id == props.id)
    URL = "/modifiers/#{ props }"
    $.ajax
      method: 'DELETE'
      url: URL
      dataType: 'JSON'
      success:() =>
        @modifiers = React.addons.update(
          @modifiers, { $splice: [[index , 1]]}
        )
        @emitChange()



  onInitData: () ->
    $.ajax
      method: 'GET'
      url: "/modifiers"
      dataType: 'JSON'
      success: (e) =>
        @modifiers = e
        console.log(@modifiers)
        @emitChange()

  getModifiers: () ->
    @getState().modifiers

window.ModifiersStore = alt.createStore(ModifiersStore)
