@Modifier = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/modifiers/#{@props.modifier.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteModifier @props.modifier

  handleEdit: (e, data) ->
    e.preventDefault()
    data =
      name: ReactDOM.findDOMNode(@refs.name).value
      deltaPrice: ReactDOM.findDOMNode(@refs.deltaPrice).value
    $.ajax
      method: 'PUT'
      url: "/modifiers/#{@props.modifier.id }"
      dataType: 'JSON'
      data: 
        modifier: data
      success: (data) =>
        @setState edit: false
        @props.handleEditModifier @props.modifier, data

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



