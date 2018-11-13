import * as SessionApiUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const REMOVE_CURRENT_USER = 'REMOVE_CURRENT_USER';

// const receiveUser = (user) => {
//   // return {
//   //
//   // };
// };

const receiveCurrentUser = (user) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user,
  };
};

const removeCurrentUser = () => {
  return {
    type: REMOVE_CURRENT_USER
  };
};

export const login = user => {
  return dispatch => {
    return SessionApiUtil.login(user).then( (user) => {
      dispatch(receiveCurrentUser(user));
    });
  };
};

export const signup = user => {
  return dispatch => {
    // return ;
  };
};


export const logout = () => {
  return dispatch => {
    return SessionApiUtil.logout().then(() => {
      dispatch(removeCurrentUser());
    });
  };
};
