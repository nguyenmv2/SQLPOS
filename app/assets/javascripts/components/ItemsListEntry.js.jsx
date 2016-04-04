var ItemsListEntry = React.createClass ({
  render: function() {
    return (
      <tr>
        <td> { this.props.item.item.menu_item.name} </td>
        <td>{this.props.item.item.price}</td>
      </tr>
    )
  }
})
