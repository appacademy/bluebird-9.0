import { combineReducers } from 'redux';

import chirpsReducer from './chirpsReducer';

const rootReducer = combineReducers({
  chirps: chirpsReducer
});

export default rootReducer;