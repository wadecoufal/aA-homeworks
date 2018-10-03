import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {

  constructor () {
    super();
    this.state = {
      searchTerm: ''
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange (e) {
    e.preventDefault();
    this.setState( {searchTerm: e.target.value})
  }

  handleSubmit (e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  render () {
    const { giphys } = this.props;
    return (
      <div>
        < GiphysIndex giphys={giphys} />
        <form onSubmit={this.handleSubmit}>
          <label>Search
            <input type="text" onChange={this.handleChange}></input>
          </label>

          <button type="submit" value="Search!"></button>
        </form>
      </div>
    )
  }

}

export default GiphysSearch;
