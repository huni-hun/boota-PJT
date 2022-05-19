<template>
  <div class="regist">
    <!-- <h1 class="writeTitle">Question 작성</h1> -->
    <div class="regist_form">
      <label class="titleLabel" for="title">제목 : </label>
      <input
        type="text"
        id="btitle"
        name="btitle"
        v-model="btitle"
        ref="btitle"
      /><br />
      <!-- <label for="bwriter">저자</label>
      <input
        type="text"
        id="author"
        name="author"
        v-model="author"
        ref="author"
      /><br /> -->
      <label for="content">내용</label>
      <textarea
        id="bcontent"
        name="bcontent"
        v-model="bcontent"
        ref="bcontent"
        cols="35"
        rows="5"
      ></textarea
      ><br />
      <button class="writeFormBtn submit" @click="checkValue">등록하기</button>
      <button class="writeFormBtn list" @click="moveList">목록으로</button>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data() {
    return {
      bwriter: "ssafy", // 로그인 기능 구현 후 수정
      btitle: "",
      bcontent: "",
    };
  },
  methods: {
    // 입력값 체크하기 - 체크가 성공하면 registBook 호출
    checkValue() {
      // 사용자 입력값 체크하기
      // isbn, 제목, 저자, 가격, 설명이 없을 경우 각 항목에 맞는 메세지를 출력
      let err = true;
      let msg = "";
      !this.btitle &&
        ((msg = "제목 입력해주세요"), (err = false), this.$refs.btitle.focus());
      err &&
        !this.bcontent &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.bcontent.focus());

      if (!err) alert(msg);
      // 만약, 내용이 다 입력되어 있다면 registBook 호출
      else this.registBook();
    },

    registBook() {
      http
        .post("/board", {
          bwriter: this.bwriter,
          btitle: this.btitle,
          bcontent: this.bcontent,
        })
        .then(({ data }) => {
          console.log(data);
        });
      this.moveList();
    },
    moveList() {
      this.$router.push({ path: "/qna" });
    },
  },
};
</script>

<style>
.writeTitle {
  font-size: 30px;
}
.writeFormBtn {
  padding: 7px;
  margin: 10px;
  border-radius: 7px;
  border: none;
}

.submit {
  background-color: rgb(158, 186, 236);
}

input {
  border: none;
  border-bottom: 1px solid rgb(109, 121, 143);
  margin-top: 30px;
}
textarea {
  border: none;
  background-color: rgb(252, 255, 232);
  margin: 30px;
  padding: 20px;
}
label {
  margin-right: 20px;
  font-size: 20px;
}

.regist_form {
  display: inline-block;
  padding: 20px;
  justify-content: flex-start;
  align-items: flex-start;
}
</style>
