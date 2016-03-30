@MenuItems = React.createClass
  getInitialState: ->
    menu_items: []

  componentDidMount: ->
    MenuItemsStore.listen(@onChange)
    MenuItemsActions.initData(@props.data)

  componentWillUnmount: ->
    MenuItemsStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  render: -> 
    React.DOM.div
      className: 'menu_items'
      React.DOM.h3
        className: 'title'
        'Menu Items'
      React.createElement MenuItemsForm
      React.DOM.table
        className: 'table table-striped table-sm table-bordered'
        React.DOM.thead
          className: 'thead-inverse'
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Price'
            React.DOM.th null, 'Action'
        React.DOM.tbody null,
          for menu_item in @state.menu_items
            React.createElement MenuItem,
              key: menu_item.id,
              menu_item: menu_item


