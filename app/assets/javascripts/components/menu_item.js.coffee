@MenuItem = React.createClass
  show: ->
    React.DOM.tr null,
      React.DOM.td null, @props.menu_item.name
      React.DOM.td null, @props.menu_item.price
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          'Destroy'
  edit: ->
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
