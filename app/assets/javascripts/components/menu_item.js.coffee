@MenuItem = React.createClass
  getInitialState: -> 
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    MenuItemsActions.deleteMenuItem(@props.menu_item.id)

  handleEdit: (e) ->
    data =
      id:     @props.menu_item.id
      name:   @refs.name.value
      price:  @refs.price.value
    MenuItemsActions.editMenuItem(data)
    @setState edit: false

  
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
