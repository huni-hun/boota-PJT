<template>
  <v-app id="inspire">
    <hero-view></hero-view>
    <about-view></about-view>

    <naver-view></naver-view>
    <weather-view></weather-view>
    <router-view></router-view>
  </v-app>
</template>

<script>
import HeroView from "@/components/common/HeroView.vue";
import AboutView from "@/components/common/AboutView.vue";
import NaverView from "@/components/naver/NaverView.vue";
import WeatherView from "@/components/weather/WeatherView.vue";

export default {
  name: "HomeView",
  components: { HeroView, AboutView, NaverView, WeatherView },
};
</script>
