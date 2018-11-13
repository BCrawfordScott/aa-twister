import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { fetchTwist } from '../actions/twist_actions';

class TwistShow extends React.Component {
  componentDidMount() {
    this.props.fetchTwist(this.props.match.params.twistId);
  }

  componentDidUpdate(oldProps) {
    if (oldProps.match.params.twistId !== this.props.match.params.twistId) {
      this.props.fetchTwist(this.props.match.params.twistId);
    }
  }

  render() {
    return (
      <>
        <p>{this.props.twist.body}</p>
        <Link to="/">Go Back</Link>
      </>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  const twistId = ownProps.match.params.twistId;
  const twist = state.entities.twists[twistId] || {};
  return { twist };
};

const mapDispatchToProps = (dispatch) => {
  return { fetchTwist: id => dispatch(fetchTwist(id)) };
};

export default connect(mapStateToProps, mapDispatchToProps)(TwistShow);
