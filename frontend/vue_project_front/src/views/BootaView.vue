<template>
  <div class="dashboard">
    <v-subheader class="py-0 d-flex justify-space-between rounded-lg">
      <h3></h3>
      <v-row justify="end">
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark v-bind="attrs" v-on="on">
              글쓰기
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">User Profile</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      label="Legal first name*"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      label="Legal middle name"
                      hint="example of helper text only on focus"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      label="Legal last name*"
                      hint="example of persistent helper text"
                      persistent-hint
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field label="Email*" required></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field
                      label="Password*"
                      type="password"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6">
                    <v-select
                      :items="['0-17', '18-29', '30-54', '54+']"
                      label="Age*"
                      required
                    ></v-select>
                  </v-col>
                  <v-col cols="12" sm="6">
                    <v-autocomplete
                      :items="[
                        'Skiing',
                        'Ice hockey',
                        'Soccer',
                        'Basketball',
                        'Hockey',
                        'Reading',
                        'Writing',
                        'Coding',
                        'Basejump',
                      ]"
                      label="Interests"
                      multiple
                    ></v-autocomplete>
                  </v-col>
                </v-row>
              </v-container>
              <small>*indicates required field</small>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="dialog = false">
                Close
              </v-btn>
              <v-btn color="blue darken-1" text @click="dialog = false">
                Save
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-row>
    </v-subheader>
    <br />
    <v-row>
      <v-col lg="7" cols="12">
        <v-alert dense text type="success">
          Login Successfully! Welcome to <strong>Web Burden</strong>
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
          <v-card-title>Activities</v-card-title>
          <v-card-text class="py-0">
            <v-timeline align-top dense>
              <v-timeline-item color="indigo" small>
                <strong>5 Minuts ago</strong>
                <div class="text-caption">
                  You have new order please check this out
                </div>
              </v-timeline-item>
              <v-timeline-item color="green" small>
                <strong>35 Minuts ago</strong>
                <div class="text-caption mb-2">A Product has delivered!</div>
              </v-timeline-item>

              <v-timeline-item color="indigo" small>
                <strong>44 Minuts ago</strong>
                <div class="text-caption">
                  You have new order please check this out
                </div>
              </v-timeline-item>
            </v-timeline>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col>
        <v-card>
          <boota-board-view></boota-board-view>
          <!-- <v-data-table
            caption="Recent Order list"
            :headers="headers"
            :items="desserts"
            :items-per-page="5"
            class="elevation-1"
          >
            <template>
              <v-btn color="success" outlined small shaped>View</v-btn>
            </template>
          </v-data-table> -->
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import BootaBoardView from "@/components/boota/BootaBoardView.vue";
export default {
  name: "BootaView",
  data() {
    return {
      dialog: false,
    };
  },
  methods: {
    onButtonClick(item) {
      console.log("click on " + item.no);
    },
  },
  components: {
    BootaBoardView,
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
