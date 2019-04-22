export const RECEIVE_CHIRP = "RECEIVE_CHIRP";
export const RECEIVE_CHIRPS = "RECEIVE_CHIRPS";

export const receiveChirp = chirp => ({
  type: RECEIVE_CHIRP,
  chirp,
});

export const receiveChirps = chirps => ({
  type: RECEIVE_CHIRPS,
  chirps,
});

// FIXME: TESTING
window.receiveChirp = receiveChirp;
window.receiveChirps = receiveChirps;