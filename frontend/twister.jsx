import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import configureStore from './store/store';
import App from './components/app';
// import * as SessionApiUtil from './util/session_api_util';
import * as SessionActions from './actions/session_actions';


const Root = ({ store }) => {
  return (
      <Provider store={store}>
        <App />
      </Provider>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  let preloadedState;
  if (window.currentUser) {
    preloadedState = {
      entities: {
        users: {
          [window.currentUser.id]: window.currentUser,
        }
      },
      session: {
        currentUserId: window.currentUser.id
      }
    }
  }
  window.currentUser = null;
  const store = configureStore(preloadedState);
  window.store = store;
  window.login = SessionActions.login;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
