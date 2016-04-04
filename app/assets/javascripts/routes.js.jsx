// # Router = ReactRoute.Router
// # DefaultRoute = ReactRouter.DefaultRoute
// #
// # @MyRoutes = React.createElement(
// #   Route, { handler: App },
// #   React.createElement(DefaultRoute, handler: HelloWorld),
// #   React.createElement(Route, handler: AnotherPage, path: 'page1'))

var Route = ReactRouter.Route,
    DefaultRoute = ReactRouter.DefaultRoute;

this.MyRoutes = (
  <Route handler={App}>
    <DefaultRoute handler={Orders} />
    <Route handler={Modifiers} path='modifiers' />
    <Route handler={MenuItems} path='menu_items' />
    <Route handler={Order} path='/orders/:id' />
  </Route>
);
