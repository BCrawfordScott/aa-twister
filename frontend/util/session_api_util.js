export const login = (user) => {
  // user = {username: 'username', password: 'starwars'}
  return $.ajax({
    method: 'POST',
    url: '/api/session',
    data: { user }, //shorthand for { user: user }
  });
};

window.login = login;

export const logout = () => {
  return $.ajax({
    method: 'DELETE',
    url: '/api/session',
  });
};

window.logout = logout;

export const signup = (user) => {
  return $.ajax({
    // method: ,
    // url: ,
    // data: ,
  });
};
