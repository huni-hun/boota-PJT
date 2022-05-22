<template>
  <v-app id="inspire">
    <hero-view></hero-view>
    <about-view></about-view>
  </v-app>
</template>

<script>
import HeroView from "@/components/common/HeroView.vue";
import AboutView from "@/components/common/AboutView.vue";
export default {
  name: "HomeView",
  components: { HeroView, AboutView },
};
</script>
