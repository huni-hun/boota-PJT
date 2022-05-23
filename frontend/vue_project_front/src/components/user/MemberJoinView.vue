<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center" dense>
      <v-col cols="12" sm="8" md="4" lg="4">
        <v-card elevation="0">
          <div class="text-center">
            <h1 class="mb-2">Register</h1>
          </div>
          <a
            href="https://edu-fedorae.netlify.app"
            name="Fedorae Education"
            title="Fedorae Education"
            target="_blank"
          >
            <v-img
              src="@/assets/join.png"
              alt="Fedorae Education Log"
              contain
              height="200"
            ></v-img>
          </a>
          <v-card-text>
            <v-form>
              <v-text-field
                label="Enter your name"
                name="name"
                v-model="myId"
                prepend-inner-icon="mdi-account"
                type="text"
                class="rounded-0"
                outlined
              ></v-text-field>
              <v-text-field
                label="Enter your email"
                name="email"
                v-model="myEmail"
                prepend-inner-icon="mdi-email"
                type="email"
                class="rounded-0"
                outlined
              ></v-text-field>
              <v-text-field
                label="Enter your password"
                name="password"
                v-model="myPw"
                prepend-inner-icon="mdi-lock"
                type="password"
                class="rounded-0"
                outlined
              ></v-text-field>
              <v-text-field
                label="Re-enter password"
                name="password"
                v-model="rePw"
                prepend-inner-icon="mdi-lock-outline"
                type="password"
                class="rounded-0"
                outlined
              ></v-text-field>
              <v-btn
                @click="joinMyData"
                class="rounded-0"
                color="#000000"
                x-large
                block
                dark
                >Register</v-btn
              >
              <v-card-actions class="text--secondary">
                <v-spacer></v-spacer>
                <!-- <router-link :to="{ name: 'SignUp' }">Sign Up</router-link> -->
                Already have an account?
                <a href="#" class="pl-2" style="color: #000000">Sign In</a>
              </v-card-actions>
            </v-form>
          </v-card-text>
          <v-card-actions class="ml-6 mr-6 text-center">
            <p>
              By continuing, you agree to Fedorae Education's
              <a href="#" class="pl-2" style="color: #000000">Policy</a> and
              <a href="#" class="pl-2" style="color: #000000">Terms of Use</a>
            </p>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import http from "@/util/http-common.js";
import router from "@/router";

export default {
  name: "app-register",
  data() {
    return {
      myId: "",
      myPw: "",
      rePw: "",
      myEmail: "",
    };
  },
  methods: {
    joinMyData() {
      let user_id = this.myId;
      let user_pw = this.myPw;
      let user_email = this.myEmail;
      if (user_pw != this.rePw) {
        alert("비밀번호를 확인하시오");
      } else {
        console.log(user_id);
        http
          .post("/join", {
            user_id: user_id,
            user_pw: user_pw,
            user_email: user_email,
          })
          .then(({ data }) => {
            console.log(data);
          });

        alert("가입완료.");
        router.push({ name: "home" });
      }
    },
  },
};
</script>

<style lang="css" scoped></style>
