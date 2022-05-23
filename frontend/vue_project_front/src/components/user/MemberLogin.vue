<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center" dense>
      <v-col cols="12" sm="8" md="4" lg="4">
        <v-card elevation="0">
          <div class="text-center">
            <h1 class="mb-2">Login</h1>
          </div>

          <v-img src="@/assets/login.png" contain height="200"></v-img>

          <v-card-text>
            <v-form>
              <v-text-field
                label="아이디를 입력하세요"
                name="email"
                prepend-inner-icon="mdi-account"
                type="email"
                class="rounded-0"
                outlined
                v-model="user.user_id"
                @keyup.enter="confirm"
              ></v-text-field>
              <v-text-field
                label="비밀번호를 입력하세요"
                name="password"
                prepend-inner-icon="mdi-lock"
                type="password"
                suffix="| Forgot?"
                class="rounded-0"
                outlined
                v-model="user.user_pw"
                @keyup.enter="confirm"
              ></v-text-field>
              <v-btn
                class="rounded-0"
                color="#000000"
                x-large
                block
                dark
                @click="confirm"
                >Login</v-btn
              >

              <div id="naver_id_login"></div>

              <v-card-actions class="text--secondary">
                <v-checkbox color="#000000" label="Remember me"></v-checkbox>
                <v-spacer></v-spacer>
                <!-- <router-link :to="{ name: 'SignUp' }">Sign Up</router-link> -->
                계정이 없으신가요?
                <router-link :to="{ name: 'join' }">회원가입</router-link>
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
import { mapState, mapActions } from "vuex";
const memberStore = "memberStore";
export default {
  name: "MemberLogin",
  data() {
    return {
      user: {
        user_id: null,
        user_pw: null,
      },
    };
  },
  mounted() {
    const naver_id_login = new window.naver_id_login(
      "ETE3cgrx1amxAEe0KUxg",
      "http://localhost:8080/login/naver",
    );
    const state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 3, 128);
    naver_id_login.setState(state);
    // naver_id_login.setDomain("http://127.0.0.1:8080/");
    naver_id_login.init_naver_id_login();
  },
  computed: {
    ...mapState(memberStore, ["isLogin", "isLoginError"]),
  },
  methods: {
    ...mapActions(memberStore, ["userConfirm", "getUserInfo"]),
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      console.log(token);
      if (this.isLogin) {
        console.log("hey");
        await this.getUserInfo(token);
        console.log(token);
        this.$router.push({ name: "home" });
      }
    },
    movePage() {
      this.$router.push({ name: "signup" });
    },
  },
};
</script>

<style lang="css" scoped></style>
