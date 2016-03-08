@ModifierForm = React.createClass
  getInitialState: ->
    name:  ''
    deltaPrice: ''

  valid: ->
    @state.name && @state.deltaPrice

  handleChange: (e) -> 
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) -> 
    e.preventDefault()
    $.post '/modifiers', { modifier: @state } , (data) =>
      @props.handleNewModifier data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
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
          placeholder: 'Delta Price'
          name: 'deltaPrice'
          value: @state.deltaPrice
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disable: !@valid()
        'Create Modifier'


