@Modifier = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault
    ModifiersActions.deleteModifier(@props.modifier.id)

  handleEdit: (e) ->

    data =
      id:         @props.modifier.id
      name:       @refs.name.value
      deltaPrice: @refs.deltaPrice.value
    ModifiersActions.editModifier(data)
    @setState edit: false

  showView: ->
    React.DOM.tr null,
      React.DOM.td null, @props.modifier.name
      React.DOM.td null, @props.modifier.deltaPrice
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Destroy'

  editView: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.modifier.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.modifier.deltaPrice
          ref: 'deltaPrice'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  render: ->
    if (@state.edit)
      @editView()
    else
      @showView()
