
import { connect } from 'react-redux';
import { selectAllChirps } from '../../reducers/selectors';
import ChirpIndex from './ChirpIndex';

const mapStateToProps = state => {
  return {
    chirps: selectAllChirps(state),
  };
};

export default connect(mapStateToProps)(ChirpIndex);