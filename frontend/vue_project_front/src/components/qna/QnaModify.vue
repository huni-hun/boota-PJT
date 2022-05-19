<template>
  <div>
    <h1>게시글 수정</h1>
    <div class="regist_form">
      <label for="bno" class="boardth">글번호</label>
      <div class="view boardtd">{{ board.bno }}</div>
      <label for="subject" class="boardth">제목</label>
      <input
        type="text"
        id="btitle"
        name="btitle"
        v-model="board.btitle"
        ref="title"
      /><br />
      <label for="userid" class="boardth">작성자</label>
      <div class="view boardtd">{{ board.bwriter }}</div>
      <label for="bwrite_date" class="boardth">작성일</label>
      <div class="view boardtd">{{ board.bwrite_date }}</div>
      <label for="content" class="boardth">내용</label>
      <input
        type="text"
        id="bcontent"
        name="bcontent"
        v-model="board.bcontent"
        ref="content"
      /><br />
      <div style="padding-top: 15px">
        <button @click="modifyBoard">수정</button>
        <button @click="moveList">목록</button>
        <router-link to="/qna/list" class="btn">목록</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  data() {
    return {
      board: {},
    };
  },
  created() {
    let bno = this.$route.params.bno;

    http.get("/board/" + bno).then(({ data }) => {
      //console.log(data.board);
      this.board = data.board;
    });
  },
  methods: {
    moveList() {
      this.$router.push({ path: "/qna/list" });
    },
    modifyBoard() {
      http
        .put("/board/" + this.board.bno, {
          bno: this.board.bno,
          btitle: this.board.btitle,
          bwriter: this.board.bwriter,
          bwrite_date: this.board.bwrite_date,
          bcontent: this.board.bcontent,
        })
        .then((resp) => {
          console.log(resp);
          alert("수정이 완료되었습니다.");
          this.moveList();
        });
    },
  },
};
</script>

<style></style>
