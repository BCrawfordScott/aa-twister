import React, { Component } from "react";
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import TwistForm from './twist_form';
import { fetchTwists } from '../actions/twist_actions';

class TwistIndex extends Component {

  componentDidMount() {
    this.props.fetchTwists();
  }

  componentDidUpdate(oldProps) {
    // compare this.props vs oldProps and if they're diff, you can fetch new twist.
  }

  render() {
    const twists = this.props.twists.map(twist => {
      return (
        <li key={twist.id} className="twist-index-item">
          <Link to={`/twists/${twist.id}`}>{twist.body}</Link>
        </li>
      );
    });
    let form = "";
    if (this.props.loggedIn) {
      form = <TwistForm />;
    }

    return (
      <main className="twist-index">
        {form}
        <ul className="twist-list">
          {twists}
        </ul>
      </main>
    );
  }
}

const mapStateToProps = state => {
  const twists = Object.values(state.entities.twists);
  return {
    twists, // shorthand for twists: twists
    loggedIn: Boolean(state.session.currentUserId),
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchTwists: () => dispatch(fetchTwists()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TwistIndex);
