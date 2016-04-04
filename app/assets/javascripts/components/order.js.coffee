{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a } = React.DOM
{Navigation} = ReactRouter
@Order = React.createClass



  getInitialState: ->
    order: []


  componentWillMount: ->
    OrderStore.listen(@onChange)
    # ItemsStore.listen(@onChange)

  componentDidMount: ->
    # ItemsActions.initData()
    OrderActions.initData(@props.params.id)

  componentWillUnmount: ->
    OrderStore.unlisten(@onChange)
    # ItemsStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  handleFinish: ()->
    OrderActions.finishOrder()
    @transitionTo('/')

  render: ->
    # React.createElement ItemsSelector,
    #     key: @state.order.id,
    #     order_id : @state.order.id,
    #     items: @state.order.items,
    #     menu_items: @state.menu_items

    div null,
      div className:"container containerChild left col-md-9",

        div className: 'row',
          React.createElement ItemsSelector,
              key: @state.order.id,
              order_id : @state.order.id,
              items: @state.order.items,
              menu_items: @state.menu_items

      div className:"container right col-md-3",
        div className: 'row',
          React.createElement ItemsList,
            items: @state.order.items
        div className: 'row',
          h3 null,
            "Total: #{@state.order.total}"
        div className: 'row',
          div className: 'span12',
            a
              className: 'btn btn-danger btn-block'
              onClick: @handleFinish
              'Finish'
