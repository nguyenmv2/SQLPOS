@Modifiers = React.createClass
  getInitialState: ->
    modifiers: @props.data

  getDefaultProps: ->
    modifiers: []

  addModifier: (modifier) ->
    modifiers = React.addons.update(
      @state.modifiers, { $push: [modifier] }
    )
    @setState modifiers: modifiers

  deleteModifier: (modifier) ->
    index = @state.modifiers.indexOf modifier
    modifiers = React.addons.update(
      @state.modifiers, { $splice: [[index, 1]]}
    )
    @replaceState modifiers: modifiers

  updateModifier: (modifier, data) -> 
    index = @state.modifiers.indexOf modifier
    modifiers = React.addons.update(
      @state.modifiers, { $splice: [[index, 1, data]] }
    )
    @setState modifiers: modifiers

  render: -> 
    React.DOM.div 
      className: 'modifiers'
      React.DOM.h3
        className: 'title'
        'Modifiers'
      React.createElement ModifierForm, handleNewModifier: @addModifier
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Delta Price'
            React.DOM.th null, 'Action'
        React.DOM.tbody null, 
          for modifier in @state.modifiers
            React.createElement Modifier,
              key: modifier.id,
              modifier: modifier,
              handleDeleteModifier: @deleteModifier,
              handleEditModifier: @updateModifier


      
