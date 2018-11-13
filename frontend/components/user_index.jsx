import React, { Component } from "react";
import { connect } from 'react-redux';
import { fetchUsers } from '../actions/user_actions';

class UserIndex extends Component {

  componentDidMount() {
    this.props.fetchUsers();
  }

  render() {
    const users = this.props.users.map(user => {
      return (
        <li key={user.id} className="twist-index-item">
          <p>{user.username}</p>
        </li>
      );
    });

    return (
      <main className="twist-index">
        <ul className="twist-list">
          {users}
        </ul>
      </main>
    );
  }
}

const mapStateToProps = state => {
  const users = Object.values(state.entities.users);
  return {
    users
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchUsers: () => dispatch(fetchUsers())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserIndex);
