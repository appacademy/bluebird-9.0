// ChirpForm.jsx
import React from 'react';
import uniqueId from '../../utils/uniqueId';

class ChirpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      body: '',
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleChange(e) {
    const body = e.currentTarget.value;
    this.setState({
      body,
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    const chirp = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveChirp(chirp);
    this.setState({ body: '' });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input
          type='text'
          onChange={this.handleChange}
          value={this.state.body}
        />
        <input
          type='submit'
          value='Share Chirp'
        />
      </form>
    );
  }
}

export default ChirpForm;