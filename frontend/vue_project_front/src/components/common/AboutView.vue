<template>
  <v-container class="container pl-16 ma-15">
    <h1 class="text-center headtext"><b>오늘의 정보</b></h1>
    <router-view></router-view>
  </v-container>
</template>

<script>
export default {
  name: "AboutView",
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap");

* {
  font-family: "Noto Sans KR", sans-serif;
}
</style>
