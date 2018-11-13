import * as TwistApiUtil from '../util/twist_api_util';

export const RECEIVE_TWISTS = 'RECEIVE_TWISTS';
export const RECEIVE_TWIST = 'RECEIVE_TWIST';

 export const receiveTwists = payload => {

  return {
    type: RECEIVE_TWISTS,
    payload,
  };
};
 export const receiveTwist = twist => {
  return {
    type: RECEIVE_TWIST,
    twist,
  };
};

export const fetchTwists = () => dispatch => {

  return TwistApiUtil.fetchTwists().then(payload => {

    return dispatch(receiveTwists(payload));
  });
};

export const fetchTwist = id => dispatch => {
  return TwistApiUtil.fetchTwist(id).then(twist => {
    return dispatch(receiveTwist(twist));
  });
};

export const createTwist = twist => dispatch => {
  return TwistApiUtil.createTwist(twist).then(response => {
    return dispatch(receiveTwist(response));
  });
};
