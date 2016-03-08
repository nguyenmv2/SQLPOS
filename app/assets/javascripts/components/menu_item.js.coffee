@MenuItem = React.createClass
  getInitialState: -> 
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/menu_items/#{ @props.menu_item.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteMenuItem @props.menu_item

  handleEdit: (e) ->
    e.preventDefault()
    data = 
      name: ReactDOM.findDOMNode(@refs.name).value
      price: ReactDOM.findDOMNode(@refs.price).value
    $.ajax
      method: 'PUT'
      url: "/menu_items/#{ @props.menu_item.id}"
      dataType: 'JSON'
      data:
        menu_item: data
      success: (data) =>
        @setState edit: false
        @props.handleEditMenuItem @props.menu_item, data
  
  showView: ->
    React.DOM.tr null,
      React.DOM.td null, @props.menu_item.name
      React.DOM.td null, @props.menu_item.price
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
          defaultValue: @props.menu_item.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.menu_item.price
          ref: 'price'
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
