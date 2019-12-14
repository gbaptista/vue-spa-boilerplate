<template>
  <div>
    Home Page: {{ message }}
    <br><br>
    <a
      href="settings"
      @click.prevent="goToPage('settings')"
    >settings</a>
  </div>
</template>

<script>
export default {
  data() {
    return { message: 'Hello From Home' };
  },
  methods: {
    goToPage(page) {
      this.$parent.goToPage(page);
    },
  },
};
</script>
