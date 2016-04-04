{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a, section,button } = React.DOM

@ItemsList = React.createClass
  render: ->
    div null,
      table
        className: 'table table-bordered'
        thead null,
          tr null,
            th null, 'Name'
            th null, 'Price'
        tbody null,
          _.map @props.items, (item) =>
            React.createElement ItemsListEntry,
              key: item.id,
              item: item
