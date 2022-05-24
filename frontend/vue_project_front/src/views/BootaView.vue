<template>
  <div class="dashboard">
    <v-subheader class="py-0 d-flex justify-space-between rounded-lg">
      <h3></h3>

      <v-row justify="end">
        <!-- 부타 글쓰기  -->
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ attrs }">
            <v-btn
              class="rounded-pill mr-7"
              color="indigo"
              dark
              v-bind="attrs"
              @click="checkUserloc()"
            >
              글쓰기
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <v-img height="80" src="@/assets/bootawrite.png"></v-img>
              <span class="text-h5">부동산타임 글쓰기 </span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="12" md="6">
                    <v-text-field
                      v-model="btb_title"
                      id="btb_title"
                      name="btb_title"
                      ref="btb_title"
                      label="제목"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="12" md="6"> </v-col>
                  <v-col cols="12" sm="12" md="12">
                    <v-textarea
                      auto-grow
                      filled
                      label="내용"
                      id="btb_content"
                      name="btb_content"
                      placeholder="내용을 입력하세요"
                      v-model="btb_content"
                    ></v-textarea>
                  </v-col>

                  <v-col rows="3" cols="12" md="6">
                    <v-text-field
                      label="Password*"
                      type="password"
                      name="btb_pw"
                      id="btb_pw"
                      v-model="btb_pw"
                      required
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12" sm="6">
                    <v-autocomplete
                      :items="[
                        '서울',
                        '수도권',
                        '지방',
                        '아파트',
                        '매매',
                        '행복주택',
                        '귀농',
                        '주식',
                        '코인',
                      ]"
                      label="관심"
                      multiple
                    ></v-autocomplete>
                  </v-col>
                </v-row>
              </v-container>
              <small>*삭제시 비밀번호가 필요합니다</small>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="dialog = false">
                안쓸래요
              </v-btn>
              <v-btn color="blue darken-1" text @click="updateBoota()">
                올리기
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <!-- 부타 글쓰기 end -->
      </v-row>
    </v-subheader>
    <house-search-bar></house-search-bar>
    <br />
    <v-row class="ma-5">
      <v-col lg="7" cols="12">
        <v-alert dense text :type="types">
          <div>
            <button @click="geofind">우리 동네 인증하기</button>
            <p>{{ textContent }}</p>
          </div>
        </v-alert>

        <v-row>
          <v-col lg="6" cols="12">
            <v-card elevation="2" class="rounded-lg" height="300px">
              <v-card-text class="d-flex justify-space-between align-center">
                <div>
                  <strong>Hot 매물</strong> <br />
                  <span>지금 가장 인기있는 매물입니다</span>
                </div>
                <v-avatar size="60" style="border: 3px solid #444">
                  <span style="color: white">+</span>
                </v-avatar>
              </v-card-text>
              <v-card-actions class="d-flex justify-space-between">
              </v-card-actions>
            </v-card>
          </v-col>
          <v-col lg="6" cols="12">
            <v-card elevation="2" class="rounded-lg" height="300px">
              <v-card-text class="d-flex justify-space-between align-center">
                <div>
                  <strong>Hot 게시글</strong> <br />
                  <span>지금 가장 핫한 게시글입니다</span>
                </div>
                <v-avatar size="60" style="border: 3px solid #444">
                  <span style="color: white">+</span>
                </v-avatar>
              </v-card-text>
              <v-card-actions class="d-flex justify-space-between">
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="12" lg="5">
        <v-card>
          <v-card-title>우리동네 게시판</v-card-title>
          <v-card-text class="py-0">
            <v-timeline align-top dense>
              <v-timeline-item color="indigo" small>
                <strong>자유 게시판</strong>
                <div class="text-caption">익명으로 자유롭게</div>
              </v-timeline-item>
              <v-timeline-item color="green" small>
                <strong>시사 이슈</strong>
                <div class="text-caption mb-2">이슈</div>
              </v-timeline-item>

              <v-timeline-item color="indigo" small>
                <strong>정보 게시판</strong>
                <div class="text-caption">동네 정보 같이 공유해요</div>
              </v-timeline-item>
            </v-timeline>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col>
        <!-- 글 리스트 -->
        <component :is="whichStep"></component>

        <!-- 글 리스트 -->
        <router-view></router-view>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import Vue from "vue";
import VueGeolocationApi from "vue-geolocation-api";
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
// import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import axios from "axios";

Vue.use(VueGeolocationApi);
const Kakao = axios.create({
  baseURL: "https://dapi.kakao.com", // 공통 요청 경로
  headers: {
    Authorization: "KakaoAK b004e076e4908b59d3812882c7779d61",
  },
});
export default {
  name: "BootaView",
  data() {
    return {
      dialog: false,
      btb_title: "",
      btb_pw: "",
      btb_content: "",
      latitude: "",
      longitude: "",
      textContent: "",
      nowloc: "",
      checkloc: "",
      active: 0,
      userLocauth: false,
      types: "info",
    };
  },
  methods: {
    onButtonClick(item) {
      console.log("click on " + item.no);
    },
    updateBoota() {
      this.dialog = false;
      http
        .post("/boota", {
          btb_title: this.btb_title,
          btb_content: this.btb_content,
          btb_pw: this.btb_pw,
          guguncode: this.nowloc,
        })
        .then(({ data }) => {
          alert("등록이 완료되었습니다!");
          console.log(data);
        })
        .catch((error) => console.log(error));
    },
    moveList() {
      this.$router.push({ path: "/boota" });
    },
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

          this.alterGun(this.latitude, this.longitude);
        },
        (err) => {
          this.textContent = err.message;
        },
      );
    },
    alterGun(lat, lng) {
      // 현재 위치 위도 경도로 구군 구함

      Kakao.get(
        "/v2/local/geo/coord2regioncode.json?y=" + lat + "&x=" + lng,
      ).then(
        ({ data }) => (this.nowloc = data.documents[0].region_2depth_name),
      );

      if (this.nowloc == this.checkgugun) {
        this.userLocauth = true;
        this.textContent = this.nowloc + " 인증되었습니다 ^.^";
        this.types = "success";
      } else {
        this.textContent =
          this.nowloc + "에 위치해 있습니다. 활동에 제약이 생깁니다";
        this.userLocauth = false;
      }
    },

    checkUserloc() {
      if (!this.userLocauth) {
        alert("동네 정보가 불일치 합니다 위치를 확인해주세요");
        this.dialog = false;
      } else {
        this.dialog = true;
      }
    },
  },
  components: {
    HouseSearchBar,
    BootaBoardView: () => import("@/components/boota/BootaBoardView.vue"),
    //다른 게시판 만들고 채우기
  },
  computed: {
    whichStep() {
      switch (this.active) {
        case 0:
          return "BootaBoardView";
        case 1:
          return "BootaBoardView";
        default:
          return "BootaBoardView";
      }
    },
    checkgugun() {
      return this.$store.state.map_gugunName;
    },
  },
  watch: {
    checkgugun(val) {
      this.checkloc = val;
    },
    checkDialog(val) {
      this.userLocauth = val;
    },
  },
};
</script>

<style scoped>
.overlap-icon {
  position: absolute;
  top: -33px;
  text-align: center;
  padding-top: 12px;
}
</style>
