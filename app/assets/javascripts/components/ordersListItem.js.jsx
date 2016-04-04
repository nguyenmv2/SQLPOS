
var Link = ReactRouter.Link;
var OrderListItem = React.createClass({
  //
  render: function() {
    var link = "/orders/"+ this.props.order.id;
    console.log(this.props.order)
    return (
    <tr>
      <td> {this.props.order.id} </td>
      <td> {this.props.order.table} </td>
      <td> {this.props.order.total} </td>
      <td> {this.props.order.status} </td>
      <td>
        {/*<button className="btn btn-default">*/}
        <Link className="btn btn-default" to={link} params={{order: this.props.order}}> View </Link>
        {/*</button>*/}
      </td>
    </tr>
  )
  }
})
