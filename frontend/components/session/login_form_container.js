import React from 'react';
import { connect } from 'react-redux';

import { login } from '../../actions/session_actions';
import SessionForm from './session_form';

const mdp = (dispatch) => {
  return {
    processForm: (user) => dispatch(login(user)),
    message: 'Twist In'
  };
};

export default connect(null, mdp)(SessionForm);
