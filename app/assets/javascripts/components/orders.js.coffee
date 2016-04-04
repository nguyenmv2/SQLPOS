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
  handleNewOrder: ->
    OrdersActions.createOrder()
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
      className: "container",
        div className:'row',
          h3 className: "title",
            'Orders'
        div className:'row',
          React.DOM.form
            className: 'form-inline'
            onSubmit: @handleSubmit
            React.DOM.div
              className: 'form-group'
              React.DOM.input
                type: 'text'
                className: 'form-control'
                placeholder: 'Table'
                name: 'name'
                value: @state.name
                onChange: @handleChange
          a
            className: 'btn btn-default'
            onClick: @handleNewOrder
            'New Order'

        div className:'row',
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
            th null, 'STATUS'
            th null, 'ACTION'
        tbody null,
          _.map @props.orders, (order)=>
            React.createElement OrderListItem,
              key: "#{order.id}",
              order: order
