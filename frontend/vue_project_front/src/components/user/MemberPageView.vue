<template>
  <table>
    <tr>
      <td>아이디</td>
      <td>{{ userInfo }}</td>
    </tr>
    <tr>
      <td>비밀번호</td>
    </tr>
    <tr>
      <td>이메일</td>
    </tr>
    <tr>
      <td>관심지역</td>
    </tr>
  </table>
</template>

<script>
import { mapState } from "vuex";

const memberStore = "memberStore";

export default {
  name: "MemberMyPage",
  components: {},
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
};
</script>

<style></style>
