{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a, section,button } = React.DOM


@ModPicker = React.createClass
  getInitialState: ->
    modifiers = []
  componentWillMount: ->
    CustomizationsStore.listen(@onChange)
    Modifiers.listen(@onChange)
  componentDidMount: ->
    CustomizationsActions.initData()
    Modifiers.initData()
  componentWillUnmount: ->
    CustomizationsStore.unlisten(@onChange)

  render: ->
    _.map @state.modifiers, (mod) =>
      React.createElement ModPickerItem,
        key: mod.id,
        modifier: mod


@ModPickerItem = React.createClass
  render: ->
    tr null,
      td null, @props.mod.name
      td null, @props.mod.deltaPrice
