// import React from 'react';
// import { connect } from 'react-redux';
//
// import { signup } from '../../actions/session_actions';
//
// class SignupForm extends React.Component {
//   constructor(props) {
//     super(props);
//     // TODO
//   }
//
//   handleChange(field) {
//     // TODO
//   }
//
//   handleSubmit(e) {
//     // TODO
//   }
//
//   render() {
//     // TODO
//     return(
//       <form onSubmit={}>
//         <p>Username</p>
//         <input onChange={} value={} />
//         <p>Password</p>
//         <input onChange={} value={}/>
//         <button>Sign up!</button>
//       </form>
//     );
//   }
// }

// export ...

import React from 'react';
import { connect } from 'react-redux';

import { login } from '../../actions/session_actions';

class SignupForm extends React.Component {
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
    this.props.signup(this.state);
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
    signup: (user) => dispatch(signup(user))
  };
};

export default connect(null, mdp)(LoginForm);
