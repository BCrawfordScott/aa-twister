import React, { Component } from 'react';
import { connect } from 'react-redux';
import { createTwist } from '../actions/twist_actions';

class TwistForm extends Component {
  constructor(props) {
    super(props);
    this.state = { body: '' };
    this.submit = this.submit.bind(this);
  }

  handleChange(field) {
    return e => {
      this.setState({ [field]: e.target.value });
    };
  }

  submit(e) {
    e.preventDefault();
    this.props.createTwist(Object.assign({}, this.state));
  }

  render() {
    return (
      <form className="twist-form" onSubmit={this.submit}>
        <label className="twist-input-label">Twist it!</label>
        <input className="twist-input"onChange={this.handleChange('body')} value={this.state.body} />
         <button className="twist-submit-button">Create Twist!</button>
      </form>
    );
  }
}
const mapDispatchToProps = dispatch => {
  return {
    createTwist: twist => {
      // twist.id = Math.floor(Math.random() * 1000);
      // dispatch(receiveTwist(twist));
      dispatch(createTwist(twist));
    },
  };
};

const connecter = connect(null, mapDispatchToProps);
export default connecter(TwistForm);

// export default connect(null, mapDispatchToProps)(TwistForm);
