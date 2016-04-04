{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a } = React.DOM

@Order = React.createClass
  getInitialState: ->
    order: []

  componentWillMount: ->
    OrderStore.listen(@onChange)

  componentDidMount: ->
    OrderActions.initData(@props.params.id)

  componentWillUnmount: ->
    OrderStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  render: ->
    div null,
      div
        className:"container containerChild left col-md-9",
          React.createElement ItemsSelector,
            key: @state.order.id,
            order_id : @state.order.id
      div className:"container right col-md-3",
        React.createElement ItemsList,
          items: @state.order.items
