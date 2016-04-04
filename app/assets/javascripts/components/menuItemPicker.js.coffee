{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a, section,button } = React.DOM
@MenuItemPicker = React.createClass
  getInitialState: ->
    custo: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState custo: !@state.custo

  handleAdd: (e) ->
    e.preventDefault()
    data =
      order_id: @props.order_id
      menu_item_id: @props.menu_item.id
    console.log(data)
    ItemsActions.addItem(data)

  customizeView: ->
    _.map @props.modifiers, (mod) =>
      React.createElement ModPicker,
        key: mod.id,
        modifier: mod

  listView: ->
    React.DOM.tr null,
      React.DOM.td null, @props.menu_item.name
      React.DOM.td null, @props.menu_item.price
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleAdd
          'Add'
        React.DOM.a
          className: 'btn btn-warning'
          onClick: @handleToggle
          'Customize'
  render: ->
    if (@state.custo)
      @customizeView()
    else
      @listView()
