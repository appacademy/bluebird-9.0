import React from 'react';

const ChirpIndex = ({ chirps }) => (
  <ul className='chirp-index'>
    {
      chirps.map(chirp => (
        <li key={chirp.id}>{chirp.body}</li>
      ))
    }
  </ul>
);

export default ChirpIndex;