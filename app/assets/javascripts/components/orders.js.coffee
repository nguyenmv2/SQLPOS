{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a } = React.DOM

@Orders = React.createClass
  getInitialState: ->
    orders: []

  componentDidMount: ->
    OrdersStore.listen(@onChange)
    OrdersActions.initData(@props)
    console.log("Inside the component")

  componentWillUnmount: ->
    OrdersStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  logState: () ->
    console.log(@state.orders)

  render: ->
    React.createElement InfoTile,
      content: 'Testing123',
      subject: 'Subjet Test',
      width: 6
    div
      className: "orders"
      h3
        className: "title"
        'Orders'
        React.createElement OrderList, orders: @state.orders

@OrderList = React.createClass
  render: ->

    table
      className: 'table table-bordered'
      thead null,
        tr null,
          th null, 'ID'
          th null, 'TABLE'
          th null, 'TOTAL'
          th null, 'ACTION'
      tbody null,
        _.map @props.orders, (order)=>
          React.createElement OrderListItem,
            key: "#{order.id}",
            order: order

@OrderListItem = React.createClass
  render: ->
    tr null,
      td null, @props.order.id
      td null, @props.order.table
      td null, @props.order.total
      td null,
        a
          className: 'btn btn-default'
          'View'
        a
          className: 'btn btn-primary'
          'Finialize Order'
