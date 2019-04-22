import { connect } from 'react-redux';
import { receiveChirp } from '../../actions/chirpActions';

import ChirpForm from './ChirpForm';

const mapDispatchToProps = dispatch => {
  return {
    receiveChirp: chirp => dispatch(receiveChirp(chirp)),
  };
};

export default connect(null, mapDispatchToProps)(ChirpForm);