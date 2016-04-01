@Order = React.createClass
# Table - Order ID - Total - Actions

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.Order.table
      React.DOM.td null, @props.Order.id
      React.DOM.td null, @props.Order.total

      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'

          'View'
        React.DOM.a
          className: 'btn btn-danger'

          'Destroy'
