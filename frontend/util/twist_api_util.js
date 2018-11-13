export const fetchTwists = () => {

  return $.ajax({
    url: '/api/twists',
    method: 'GET'
  });
};

export const fetchTwist = id => {
  return $.ajax({
    url: `/api/twists/${id}`,
    method: 'GET'
  });
};

export const createTwist = twist => {
  return $.ajax({
    url: '/api/twists',
    method: 'POST',
    data: { twist } // shorthand for { twist: twist }
  });
};
