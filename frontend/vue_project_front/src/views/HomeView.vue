<template>
  <v-app id="inspire">
    <hero-view></hero-view>
    <about-view></about-view>
<<<<<<< HEAD
    <naver-view></naver-view>
=======
    <router-view></router-view>
>>>>>>> 5133515400e1e151bccef3a1e91598a9e683bd56
  </v-app>
</template>

<script>
import HeroView from "@/components/common/HeroView.vue";
import AboutView from "@/components/common/AboutView.vue";
import NaverView from "@/components/naver/NaverView.vue";
export default {
  name: "HomeView",
  components: { HeroView, AboutView, NaverView },
};
</script>
