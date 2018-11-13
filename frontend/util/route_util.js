import React from 'react';
import { Redirect, Route, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';

// higher order Routes!

const Auth = ({ component: Component, loggedIn, path, exact }) => {
  function toRender(props) {
    // TODO: conditionally return the component, or a Redirect component
    if (loggedIn) {
      return <Redirect to="/" />;
    } else {
      return <Component {...props} />; // {...props} === {destructured props}
    }
  }
  return (
    // TODO: return a route that renders our component
    <Route path={path} exact={exact} render={toRender} />
  );
};

const Protected = ({ component: Component, loggedIn, path, exact }) => {
  function toRender(props) {
    // TODO: conditionally return the component, or a Redirect component
    if (loggedIn) {
      return <Component {...props} />; // {...props} === {destructured props}
    } else {
      return <Redirect to="/login" />;
    }
  }
  return (
    // TODO: return a route that renders our component
    <Route path={path} exact={exact} render={toRender} />
  );
};

const msp = state => {
  return {
    loggedIn: Boolean(state.session.currentUserId),
  };
};

export const AuthRoute = withRouter(connect(msp)(Auth));
export const ProtectedRoute = withRouter(connect(msp)(Protected));
