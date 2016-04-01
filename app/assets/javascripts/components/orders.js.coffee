@Orders = React.createClass
  getInitialState: ->
    Orders: []

  componentDidMount: ->
    OrdersStore.listen(@onChange)
    OrdersActions.initData(@props.data)

  componentWillUnmount: ->
    OrdersStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)



  render: ->
    React.DOM.div
      className: 'Orders'
      React.DOM.h3
        className: 'title'
        'Orders'

      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Table'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Total'
            React.DOM.th null, 'Action'
        React.DOM.tbody null,
          for Order in @state.Orders
            React.createElement Order,
              key: Order.id,
              Order: Order
