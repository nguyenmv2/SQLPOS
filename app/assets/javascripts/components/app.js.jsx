var RouteHandler = ReactRouter.RouteHandler,
    Link = ReactRouter.Link;

var App = React.createClass({

  render: function() {

    return (
      <div>
        <nav className= "navbar navbar-default" >
          <div className= "container">
            <div className= "navbar-header">
              <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
                <span className="sr-only">Toggle navigation</span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
              </button>
              <a className="navbar-brand" href="#"> Fleur DeLis </a>
            </div>
            <div id="navbar" className="navbar-collapse collapse">
              <ul className="nav navbar-nav">
                <li className="active">
                  <Link  to='/'>Orders</Link>
                </li>
                <li>
                  <Link to='/modifiers'>Modifiers</Link>
                </li>
                <li>
                  <Link to='/menu_items'>Menu Items </Link>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div className= "container-fluid">
          <RouteHandler />
        </div>
      </div>
    );
  }
});
