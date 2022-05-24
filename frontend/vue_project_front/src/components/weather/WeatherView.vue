<template>
  <div><v-btn color="success" @click="geofind">text</v-btn></div>
</template>

<script>
//import http from "@/util/http-common.js";
import Vue from "vue";
import VueGeolocationApi from "vue-geolocation-api";
import axios from "axios";

Vue.use(VueGeolocationApi);

export default {
  name: "WeatherView",
  data() {
    return { latitude: "", longitude: "", textContent: "" };
  },
  methods: {
    geofind() {
      if (!("geolocation" in navigator)) {
        this.textContent = "Geolocation is not available.";
        return;
      }
      this.textContent = "Locating...";

      // get position
      navigator.geolocation.getCurrentPosition(
        (pos) => {
          this.latitude = pos.coords.latitude;
          this.longitude = pos.coords.longitude;
        },
        (err) => {
          this.textContent = err.message;
        }
      );
      this.getWeather(this.latitude, this.longitude);
    },
    getWeather(lat, lng) {
      console.log(lat, lng);
      axios
        .get(
          "https://api.openweathermap.org/data/2.5/weather?lat=" +
            lat +
            "&lon=" +
            lng +
            "&appid=72eff09e84e2cbe56acc1c783a9c22bb"
        )
        .then((resp) => console.log(resp));
    },
  },
};
</script>

<style></style>
