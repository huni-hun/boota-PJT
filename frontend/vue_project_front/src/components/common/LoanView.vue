<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="6"></v-col>
        <v-col cols="6">
          <v-card
            elevation="5"
            max-width="500"
            max-height="800"
            class="mx-auto rounded-xl mb-12"
          >
            <v-card-text>
              <div>서민 금융 정보</div>
            </v-card-text>
            <v-divider></v-divider>
            <v-carousel
              :continuous="false"
              :cycle="cycle"
              hide-delimiter-background
              delimiter-icon="mdi-minus"
              height="550"
              max-height="800"
            >
              <v-carousel-item v-for="(slide, i) in slides" :key="i">
                <v-sheet :color="colors[i]" height="100%" tile>
                  <v-card-text align="center" justify="center">
                    <div class="text-h5 font-weight-bold">
                      {{ slide.finPrdNm }}
                    </div>
                  </v-card-text>
                  <v-card-text
                    class="cText mb-12"
                    align="center"
                    justify="center"
                  >
                    <div>{{ slide.suprTgtDtlCond }}</div>
                  </v-card-text>
                  <v-card-text class="cText" align="center" justify="center">
                    <div>최대 금액 : {{ slide.lnLmt }}</div>
                  </v-card-text>

                  <v-card-text class="cText" align="center" justify="center">
                    <div>필요 사항 : {{ slide.incm }}</div>
                  </v-card-text>
                  <v-card-text class="cText" align="center" justify="center">
                    <div v-html="slide.rltSite"></div>
                  </v-card-text>
                  <v-card-text class="cText" align="center" justify="center">
                    <div>{{ slide.prftAddIrtCond }}</div>
                  </v-card-text>
                </v-sheet>
              </v-carousel-item>
            </v-carousel>
            <v-list two-line>
              <v-list-item>
                <v-list-item-content>
                  <v-list-item-title></v-list-item-title>
                  <v-list-item-subtitle
                    >서민금융진흥원 제공</v-list-item-subtitle
                  >
                </v-list-item-content>
                <v-list-item-action>
                  <v-switch v-model="cycle" label="자동" inset></v-switch>
                </v-list-item-action>
              </v-list-item>
            </v-list> </v-card></v-col
      ></v-row>
    </v-container>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      items: [],
      colors: [
        "#FFECB3",
        "#C8E6C9",
        "#E0F2F1",
        "#FFEBEE",
        "#ECEFF1",
        "#FFECB3",
        "#C8E6C9",
        "#E0F2F1",
        "#FFEBEE",
        "#ECEFF1",
      ],
      cycle: false,
      slides: ["First", "Second", "Third", "Fourth", "Fifth"],
    };
  },
  created() {
    axios
      .get(
        "http://apis.data.go.kr/1160100/service/GetSmallLoanFinanceInstituteInfoService/getOrdinaryFinanceInfo?resultType=json&ServiceKey=SNF%2FCMRIB%2Bn5iwElMkQi4XyBmnCRIfZQYhDaW1kxtQFDnoTQcXgo1gt8fkHPMOV4uDg%2BQbAiD2uZ364GGqR5Ig%3D%3D",
      )
      .then((resp) => {
        console.log(resp.data.response.body.items.item);
        this.slides = resp.data.response.body.items.item;
      });
  },
  methods: {},
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap%22");

* {
  font-family: "Noto Sans KR", sans-serif;
}

.cText {
  font-size: 17px;
}
</style>
