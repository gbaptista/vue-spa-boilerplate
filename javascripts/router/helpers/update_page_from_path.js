const UpdatePageFromPath = (app, path) => {
  if (path === '/settings') {
    app.currentPage = 'settings';
  } else if (path === '/home') {
    app.currentPage = 'home';
  } else {
    app.currentPage = 'home';
  }
};

export default UpdatePageFromPath;
