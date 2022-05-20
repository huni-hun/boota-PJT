<template>
  <div class="around">
    <button @click="foodChange">음식</button>
    <button @click="hospitalChange">의료</button>
    <button @click="studyChange">교육</button>

    <table id="food-list" v-if="foodVisible">
      <thead>
        <tr>
          <th>이름</th>
          <th>업종</th>
          <th>주소</th>
        </tr>
      </thead>
      <tbody>
        <tr class="item" v-for="(food, index) in foods" :key="index">
          <td>{{ food.bizesNm }}</td>
          <td>{{ food.indsSclsNm }}</td>
          <td>{{ food.lnoAdr }}</td>
        </tr>
      </tbody>
    </table>

    <table id="hospital-list" v-if="hospitalVisible">
      <thead>
        <tr>
          <th>이름</th>
          <th>업종</th>
          <th>주소</th>
        </tr>
      </thead>
      <tbody>
        <tr class="item" v-for="(hospital, index) in hospitals" :key="index">
          <td>{{ hospital.bizesNm }}</td>
          <td>{{ hospital.indsSclsNm }}</td>
          <td>{{ hospital.lnoAdr }}</td>
        </tr>
      </tbody>
    </table>

    <table id="study-list" v-if="studyVisible">
      <thead>
        <tr>
          <th>이름</th>
          <th>업종</th>
          <th>주소</th>
        </tr>
      </thead>
      <tbody>
        <tr class="item" v-for="(study, index) in studys" :key="index">
          <td>{{ study.bizesNm }}</td>
          <td>{{ study.indsSclsNm }}</td>
          <td>{{ study.lnoAdr }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "CommercialView",
  data() {
    return {
      hospitals: [],
      foods: [],
      studys: [],
      hospitalVisible: true,
      foodVisible: false,
      studyVisible: false,
      gugun: "",
    };
  },
  computed: {
    check() {
      return this.$store.state.gugun_code;
    },
    checkfood() {
      return this.$store.state.foodcommer;
    },
    checkhospital() {
      return this.$store.state.hospitalcommer;
    },
    checkstudy() {
      return this.$store.state.studycommer;
    },
  },
  watch: {
    check(val) {
      let info = {
        LCD: "Q",
        gugunCode: val,
      };
      (this.gugun = val), this.$store.dispatch("getFoodList", info);
    },
    checkfood(val) {
      this.foods = val;
    },
    checkhospital(val) {
      this.hosptials = val;
    },
    checkstudy(val) {
      this.studys = val;
    },
  },
  created() {},
  methods: {
    foodChange() {
      let info = {
        LCD: "Q",
        gugunCode: this.gugun,
      };
      this.hospitalVisible = false;
      this.studyVisible = false;
      this.foodVisible = true;
      this.$store.dispatch("getFoodList", info);
    },
    hospitalChange() {
      let info = {
        LCD: "S",
        gugunCode: this.gugun,
      };
      this.hospitalVisible = true;
      this.studyVisible = false;
      this.foodVisible = false;
      this.$store.dispatch("getHospitalList", info);
    },
    studyChange() {
      let info = {
        LCD: "R",
        gugunCode: this.gugun,
      };
      this.hospitalVisible = false;
      this.studyVisible = true;
      this.foodVisible = false;
      this.$store.dispatch("getStudyList", info);
    },

    //
    // check() {
    //   this.$store.dispatch("getStoreList", this.gugunCode);
    // },
    //
  },
};
</script>

<style></style>
