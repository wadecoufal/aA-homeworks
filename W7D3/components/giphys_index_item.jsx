import React from 'react';

const GiphysIndexItem = ({ giphy }) => {

  return (
      <img src={giphy.images.downsized_still.url} />
  )
}

export default GiphysIndexItem;
