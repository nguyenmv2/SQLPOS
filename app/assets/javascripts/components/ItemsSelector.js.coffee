{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a, section,button } = React.DOM
@ItemsSelector = React.createClass
  getInitialState: ->
    menu_items : []
    modifiers : []
  componentWillMount: ->
    ItemsStore.listen(@onChange)

  componentDidMount: ->
    ItemsActions.initData()

  componentWillUnmount: ->
    ItemsStore.unlisten(@onChange)

  onChange:(state) ->
    @setState(state)

  render: ->
    # div null,
      div className:"container containerChild left col-md-9",
        table
          className: 'table table-bordered'
          thead null,
            tr null,
              th null, 'Name'
              th null, 'Price'
          tbody null,
            _.map @state.menu_items, (m) =>
              React.createElement MenuItemPicker,
                key: m.id,
                order_id : @props.order_id
                menu_item: m,
                modifiers: @state.modifiers

      # div className:"container right col-md-3",
      #   React.createElement ItemsList,
      #     items: @props.items
