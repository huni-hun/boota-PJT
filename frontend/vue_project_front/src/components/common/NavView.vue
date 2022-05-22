<template>
  <v-toolbar flat height="100px">
    <v-toolbar-title
      ><router-link to="/">
        <img
          src="@/assets/happy3.png"
          class="align-middle"
          width="130px"
          alt="Kitten"
        /> </router-link
    ></v-toolbar-title>

    <v-spacer></v-spacer>

    <v-btn text><router-link to="/qna" class="link">Q&A</router-link> </v-btn>

    <v-btn text><router-link to="/house" class="link">MAP</router-link></v-btn>

    <v-btn text
      ><router-link to="/" class="link">부동산 타임</router-link>
    </v-btn>
    <v-menu left bottom>
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon v-bind="attrs" v-on="on">
          <v-icon>mdi-account</v-icon>
        </v-btn>
      </template>

      <v-list>
        <v-list-item>
          <v-list-item-title
            ><router-link to="/login" class="link"
              >로그인</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item>
          <v-list-item-title
            ><router-link to="/join" class="link"
              >로그아웃</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item>
          <v-list-item-title
            ><router-link to="/" class="link"
              >회원정보</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item>
          <v-list-item-title
            ><router-link to="/join" class="link"
              >회원가입</router-link
            ></v-list-item-title
          >
        </v-list-item>
      </v-list>
    </v-menu>
  </v-toolbar>
</template>

<script>
export default {
  data() {
    return {
      drawer: null,
    };
  },
};
</script>

<style scoped>
.link {
  text-decoration: none;
  color: #707070;
}
</style>
