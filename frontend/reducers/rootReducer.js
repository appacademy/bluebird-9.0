import { combineReducers } from 'redux';

import chirpReducer from './chirpReducer';

const rootReducer = combineReducers({
  chirps: chirpReducer
});

export default rootReducer;