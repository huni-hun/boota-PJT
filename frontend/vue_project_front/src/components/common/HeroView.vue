<template>
  <v-app>
    <v-container class="pt-15">
      <v-row>
        <v-col lg="6">
          <h1 class="intro-text">집, 구하세요?</h1>
          <h2 class="intro-textsub">HappyHouse가 찾아드릴게요!</h2>
          <p class="description">
            페어 4팀 유영진(가짜팀장) 김태훈(진짜팀장)의 프로젝트입니다. 부동산
            정보도 볼수잇구요, 뉴스도 볼수있어요 짱임 익명게시판도 있어요 진짜
            짱임
          </p>
          <v-btn color="indigo" class="white--text mr-10" rounded>
            매물보러가기</v-btn
          >
          <v-btn color="indigo" class="white--text" rounded>
            <v-icon>mdi-play-circle</v-icon></v-btn
          ></v-col
        >
        <v-col lg="6"> <img width="100%" src="@/assets/main.png" /> </v-col>
      </v-row>
    </v-container>
    <v-carousel hide-delimiters cycle>
      <v-carousel-item
        gradient="to top right, rgba(100,115,201,.33),rgba(25,32,72,.7)"
        v-for="(item, i) in items"
        :key="i"
        :src="item.src"
      >
        <v-container fill-height fluid pa-0 ma-0 pb-3>
          <v-layout fill-height align-end pb-4 mb-4>
            <v-row class="fill-height" align="center" justify="center">
              <div class="text-h2 white--text">{{ item.title }}</div>
            </v-row>
            <v-row class="fill-height" align="center" justify="center">
              <div class="text-h5 white--text">{{ item.sub }}</div>
            </v-row>
          </v-layout>
        </v-container>
      </v-carousel-item>
    </v-carousel>
  </v-app>
</template>
<script>
export default {
  data() {
    return {
      items: [
        {
          src: require("@/assets/map.png"),
          title: "매물 찾기",
          sub: "주변 상권까지 한눈에",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/sky.jpg",
          title: "Q&A",
          sub: "머라하직여기ㅡㄴ",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/bird.jpg",
          title: "익명으로 솔직하게",
          sub: "부동산 타임에서 부동산에 대한 솔직한 이야기를 나눠보세요",
        },
      ],
    };
  },
  name: "HeroView",
};
</script>

<style scoped>
.link {
  text-decoration: none;
  color: #707070;
}
.intro-text {
  margin-top: 100px;
  font-size: 60px;
  font-weight: bold;
  color: #444;
}
.intro-textsub {
  font-size: 60px;
  font-weight: bold;
  color: #444;
}
.description {
  font-size: 19px;
  margin: 32px 0px;
  color: #444444ba;
}
</style>
