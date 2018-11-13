import React from 'react';
import { connect } from 'react-redux';
import { logout } from '../actions/session_actions';
import { Link, withRouter } from 'react-router-dom';


const Greeting = ({ loggedIn, currentUser, logout, history, path }) => {
  let greeting;
  if (loggedIn) {
    greeting = (
      <div className="greeting">
        <h1 className="welcome">Hello {currentUser.username}!</h1>
        <button onClick={logout}>Logout</button>
      </div>
  );
  } else if (path !== "/login") {
    greeting = (
      <>
        <button onClick={() => history.push('/login')}>Login</button>
      </>
    );
  } else {
    greeting = "";
  }
  return greeting;
};


const msp = (state, ownProps) => {
  const currUserId = state.session.currentUserId;
  return {
    loggedIn: Boolean(currUserId),
    currentUser: state.entities.users[currUserId],
    history: ownProps.history,
    path: ownProps.location.pathname
  };
};

const mdp = dispatch => {
  return {
    logout: () => dispatch(logout()),
  };
};

export default withRouter(connect(msp, mdp)(Greeting));
