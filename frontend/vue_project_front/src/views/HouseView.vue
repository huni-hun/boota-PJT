<template>
  <b-container class="bv-example-row mt-3 text-center">
    <h3 class="underline-orange">
      <b-icon icon="house-fill"></b-icon> House Service
    </h3>
    <b-row>
      <b-col>
        <house-search-bar></house-search-bar>
      </b-col>
    </b-row>
    <b-row>
      <b-col cols="6" align="left">
        <house-list />
      </b-col>
      <b-col cols="6">
        <house-detail />
      </b-col>
    </b-row>

    <!-- 맵 -->
    <b-row>
      <b-col cols="12"><KakaoMap /></b-col>
    </b-row>
    <!-- 맵 끝 -->
    <!-- 리뷰 -->
    <b-row>
      <b-col cols="12">
        <reivew-view />
      </b-col>
    </b-row>
    <!-- 리뷰 끝 -->
    <!-- 주변 상권 -->
    <b-row style="margin-top: 100px">
      <b-col cols="12">
        <commercial-view />
      </b-col>
    </b-row>
    <!-- 상권 끝 -->
  </b-container>
</template>
<script>
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import HouseList from "@/components/house/HouseList.vue";
import HouseDetail from "@/components/house/HouseDetail.vue";
import KakaoMap from "@/components/map/KakaoMap.vue";
import ReivewView from "@/components/reivew/ReivewView.vue";
import CommercialView from "@/components/commercial/CommercialView.vue";

export default {
  name: "HouseView",
  components: {
    HouseSearchBar,
    HouseList,
    HouseDetail,
    KakaoMap,
    ReivewView,
    CommercialView,
  },
};
</script>

<style scoped>
.underline-orange {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(231, 149, 27, 0.3) 30%
  );
}
</style>
