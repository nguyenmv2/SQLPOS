@Modifiers = React.createClass
  getInitialState: ->
    modifiers: []

  componentDidMount: ->
    ModifiersStore.listen(@onChange)
    ModifiersActions.initData(@props.data)

  componentWillUnmount: ->
    ModifiersStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  

  render: ->
    React.DOM.div
      className: 'modifiers'
      React.DOM.h3
        className: 'title'
        'Modifiers'
      React.createElement ModifierForm
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
              modifier: modifier
