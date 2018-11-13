import { RECEIVE_CURRENT_USER, REMOVE_CURRENT_USER } from '../actions/session_actions';
const defaultState = { currentUserId: null };

export default (state = defaultState, action) => {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return { currentUserId: action.user.id };
    case REMOVE_CURRENT_USER:
      return defaultState;
    default:
      return state;
  }
};
