import twists from './twists_reducer';
import users from './users_reducer';
import { combineReducers } from 'redux';


export default combineReducers({ twists, users });
