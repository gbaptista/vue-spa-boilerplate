import Vue from 'vue';

import HomePage from './pages/Home.vue';
import SettingsPage from './pages/Settings.vue';

import appRouter from './router/app';
import ApplyAppRouterMiddleware from './router/middlewares/app';
import UpdatePageFromPath from './router/helpers/update_page_from_path';

const app = new Vue({
  el: '#app',
  appRouter,
  components: { SettingsPage, HomePage },
  data: {
    currentPage: 'settings',
  },
  created() {
    UpdatePageFromPath(this, window.location.pathname);
  },
  methods: {
    goToPage(page) {
      if (page !== this.currentPage) {
        appRouter.push({ path: `/${page}` });
      }
    },
  },
});

appRouter.beforeEach((to, from, next) => {
  ApplyAppRouterMiddleware(app, to, from);

  next();
});
