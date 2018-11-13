import React from 'react';
import { Route, HashRouter } from 'react-router-dom';
import TwistIndex from './twist_index';
import UserIndex from './user_index';
import TwistShow from './twist_show';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import Greeting from './greeting';
import LoginForm from './session/login_form_container';
import { AuthRoute, ProtectedRoute } from '../util/route_util';


const App = ({ store }) => {
  return (
      <HashRouter>
        <div>
          <section className="header">
            <div className="logo-info">
              <img className="logo" src="../images/twister-logo.png" />
              <h3 className="twist-h3">App Academy Twister</h3>
            </div>
            <Greeting />
          </section>
          <AuthRoute exact path="/login" component={LoginForm}/>
          <Route exact path="/" component={TwistIndex}/>
          <Route path="/twists/:twistId" component={TwistShow}/>
          <ProtectedRoute path="/users" component={UserIndex}/>
        </div>
      </HashRouter>
  );
};

export default App;
