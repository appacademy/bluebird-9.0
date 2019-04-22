export const selectAllChirps = state => {
  const chirpKeys = Object.keys(state.chirps);
  const allChirps = [];
  for (let i = chirpKeys.length - 1; i >= 0; i--) {
    const chirpKey = chirpKeys[i];
    const chirp = state.chirps[chirpKey];
    allChirps.push(chirp);
  }
  return allChirps;
};