@Order = React.createClass
   handleDelete: (e) ->
     e.preventDefault()
     e.ajax
       method: 'DELETE'
       url : "orders/#{ @props.orders.id}"
       dataType: 'JSON'
       success: () =>
         @props.handleDeleteMenuItem @props.order

    handleEdit


