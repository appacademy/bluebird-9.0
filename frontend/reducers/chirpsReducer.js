import { RECEIVE_CHIRP, RECEIVE_CHIRPS } from '../actions/chirpActions';

// ex: state
// todos: {
//   30: {
//     id: 30,
//     body: "This is a chirp"
//   },
//   54: {
//     id: 54,
//     body: "Chirp chirp"
//   }
// }

const chirpReducer = (state = {}, action) => {
  Object.freeze(state);

  let newState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_CHIRP:
      // structuring state to have outer keys (id) to access our chirps in O(1)
      newState[action.chirp.id] = action.chirp;
      return newState;
    case RECEIVE_CHIRPS:
      // also structuring state to have outer keys
      for (let i = 0; i < action.chirps.length; i++) {
        const chirp = action.chirps[i];
        newState[chirp.id] = chirp;
      }
      return newState;
    default:
      return state;
  }
};

export default chirpReducer;