<template>
  <div>
    <div v-if="houses && houses.length != 0">
      <v-list style="max-height: 600px" dense class="overflow-y-auto">
        <house-list-item
          style="width: 350px"
          v-for="(house, index) in houses"
          :key="index"
          :house="house"
        />
      </v-list>
    </div>
    <div v-else>
      <v-alert border="right" colored-border type="error" elevation="2">
        주택 목록이 없습니다.
      </v-alert>
    </div>
  </div>
</template>

<script>
import HouseListItem from "@/components/house/HouseListItem.vue";
import { mapState } from "vuex";

export default {
  name: "HouseList",
  components: {
    HouseListItem,
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(["houses"]),
    // houses() {
    //   return this.$store.state.houses;
    // },
  },
};
</script>

<style></style>
