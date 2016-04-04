{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a, section,button } = React.DOM
Link = ReactRouter.Link

@Orders = React.createClass
  getInitialState: ->
    orders: []

  componentWillMount: ->
    OrdersStore.listen(@onChange)
  componentDidMount: ->
    OrdersActions.getAllOrder()

  componentWillUnmount: ->
    OrdersStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  render: ->

    # div
    #   className: 'wrapper',
    #   div
    #     className: 'content-wrapper',
    #     section
    #       className: 'content-header',
    #       h3 null, 'Test Widget'
    #     section
    #       className: 'content',
    #       div
    #         className: 'row',
    #         React.createElement InfoTile,
    #           key: 'RowOne',
    #           width: 3,
    #           subject: 'Test',
    #           content: ''

    div
      className: "container"
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
