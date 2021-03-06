import React from 'react';
import { connect } from 'react-redux';

import { login } from '../../actions/session_actions';

class LoginForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { username: '', password: '' };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(field) {
    return (e) => {
      this.setState({ [field]: e.currentTarget.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.login(this.state);
  }

  render() {

    return(
      <form onSubmit={this.handleSubmit}>
        <p>Username</p>
        <input onChange={this.handleChange('username')} value={this.state.username} />
        <p>Password</p>
        <input type="password" onChange={this.handleChange('password')} value={this.state.password}/>
        <button>Twist in!</button>
      </form>
    );
  }
}


const mdp = (dispatch) => {
  return {
    login: (user) => dispatch(login(user))
  };
};

export default connect(null, mdp)(LoginForm);
