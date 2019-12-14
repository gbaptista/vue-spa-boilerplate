import UpdatePageFromPath from '../helpers/update_page_from_path';

const ApplyAppRouterMiddleware = (app, to) => {
  UpdatePageFromPath(app, to.path);
};

export default ApplyAppRouterMiddleware;
