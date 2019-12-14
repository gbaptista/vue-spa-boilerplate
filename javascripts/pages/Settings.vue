<template>
  <div>
    Settings Page: {{ message }}
    <br><br>
    <a
      href="home"
      @click.prevent="goToPage('/')"
    >home</a>
  </div>
</template>

<script>
export default {
  data() {
    return { message: 'Hello From Settings' };
  },
  methods: {
    goToPage(page) {
      this.$parent.goToPage(page);
    },
  },
};
</script>
