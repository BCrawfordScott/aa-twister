import React from 'react';
import { connect } from 'react-redux';

import { signup } from '../../actions/session_actions';
import SessionForm from './session_form';

const mdp = (dispatch) => {
  return {
    processForm: (user) => dispatch(signup(user)),
    message: 'Twist Up'
  };
};

export default connect(null, mdp)(SessionForm);
