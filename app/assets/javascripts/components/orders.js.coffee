@Orders = React.createClass
  getIntialState: -> 
    orders: @props.data

  getDefaultState: ->
    orders: []

  addOrder: (order) -> 
    orders = React.addons.update(
      @State.orders, {$push: [order]}
    )
    @setState orders: orders

  deleteOrder: (order) -> 
    index = @state.orders.indexOf order
    orders = React.addons.update(@state.orders, {$splice: [[index, 1]] })

    @replaceState orders: orders

  updateOrder: (order, data) ->
    index = @state.orders.indexOf order
    orders = React.addons.update(
      @state.orders, {$splice: [[index, 1, data]] }
    )
    @setState orders: orders

  renderOrderView: ->
    React.DOM.div
      className: 'orders'
      React.DOM.h3
        className: 'title'
        'Orders'
      React.DOM.table
        className: 'table table-striped table-sm table-bordered' 
        React.DOM.thead
          className: 'thead-inverse'
          React.DOM.tr null,
            React.DOM.th null, 'Table No'
            React.DOM.th null, 'Total'
            React.DOM.th null, 'Action'
#        React.DOM.tbody null,
#          for order in @state.order
#            React.createElement Order,
#              key: order.id,
#              order: order,
#              handleDeleteOrder: @deleteOrder,
#              handleEditOrder: @updateOrder

  render: ->
    @renderOrderView()


