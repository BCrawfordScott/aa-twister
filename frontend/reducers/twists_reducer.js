import {
  RECEIVE_TWISTS,
  RECEIVE_TWIST,
} from '../actions/twist_actions';

export default (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_TWISTS:

      // // action.twists used to be an array
      // const newState = {};
      // action.twists.forEach(twist => {
      //   newState[twist.id] = twist;
      // });
      return action.payload.twists;
    case RECEIVE_TWIST:
      const { twist } = action;
      return Object.assign({}, state, { [twist.id]: twist });
    default:
      return state;
  }
};
