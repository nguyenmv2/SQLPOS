@MenuItems = React.createClass
  getInitialState: ->
    menu_items: @props.data

  getDefaultProps: ->
    menu_items: []
  
  addMenuItem: (menu_item) ->
    menu_items = React.addons.update(
      @state.menu_items, { $push: [menu_item] }
    )
    @setState menu_items: menu_items

  deleteMenuItem: (menu_item) ->
    index = @state.menu_items.indexOf menu_item
    menu_items = React.addons.update(
      @state.menu_items, { $splice: [[index, 1]]}
    )
    @replaceState menu_items: menu_items
  
  updateMenuItem: (menu_item, data) ->
    index = @state.menu_items.indexOf menu_item
    menu_items = React.addons.update(@state.menu_items, { $splice: [[index, 1, data]] })
    @setState menu_items: menu_items

  render: -> 
    React.DOM.div
      className: 'menu_items'
      React.DOM.h3
        className: 'title'
        'Menu Items'
      React.createElement MenuItemsForm, handleNewMenuItem: @addMenuItem     
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
              menu_item: menu_item,
              handleDeleteMenuItem: @deleteMenuItem,
              handleEditMenuItem: @updateMenuItem

