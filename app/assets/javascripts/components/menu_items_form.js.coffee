@MenuItemsForm = React.createClass
  getInitialState: ->
    name: ''
    amount: ''
  valid: ->
    @state.name && @state.price
  
  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/menu_items ', { menu_item: @state }, (data) =>
      @props.handleNewMenuItem data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div 
        className: 'form-group'
        React.DOM.input
          type:'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input 
          type: 'number'
          className: 'form-control'
          placeholder: 'Price'
          name: 'price'
          value: @state.price
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disable: !@valid()
        'Create Menu Item'


