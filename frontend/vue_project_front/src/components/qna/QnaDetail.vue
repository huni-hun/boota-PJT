<template>
  <div class="regist">
    <div class="regist_form">
      <label for="articleno" class="boardth">글번호</label>
      <div class="view boardtd">{{ board.bno }}</div>
      <label for="subject" class="boardth">제목</label>
      <div class="view boardtd">{{ board.btitle }}</div>
      <label for="userid" class="boardth">작성자</label>
      <div class="view boardtd">{{ board.bwriter }}</div>
      <label for="price" class="boardth">작성일</label>
      <div class="view boardtd">{{ board.bwrite_date }}</div>
      <label for="content" class="boardth">내용</label>
      <div class="view boardtd">{{ board.bcontent }}</div>
      <label for="comment" class="boardth">답변</label>
      <b-row>
        <b-col v-if="comments.length">
          <b-table-simple hover responsive>
            <b-thead head-variant="dark">
              <b-tr>
                <b-th>작성자</b-th>
                <b-th>내용</b-th>
                <b-th>작성일</b-th>
              </b-tr>
            </b-thead>
            <b-tbody>
              <b-tr v-for="(comment, index) in comments" :key="index">
                <b-td>{{ comment.user_name }}</b-td>
                <b-td>{{ comment.ccontent }}</b-td>
                <b-td>{{ comment.cwrite_date }}</b-td>
              </b-tr>
            </b-tbody>
            <tbody></tbody>
          </b-table-simple>
        </b-col>
        <b-col v-else class="text-center">등록된 답변이 없습니다</b-col>
      </b-row>

      <div style="padding-top: 30px">
        <router-link :to="'/qna/modify/' + board.bno" class="userbtn"
          >수정</router-link
        >
        <router-link :to="'/qna/delete/' + board.bno" class="userbtn"
          >삭제</router-link
        >
        <router-link to="/qna/list" class="userbtn">목록</router-link>
      </div>
      <div>
        <router-link :to="'/qna/commentWrite/' + board.bno" class="adminbtn"
          >답변하기</router-link
        >
      </div>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data: function () {
    return {
      board: {},
      comments: [],
    };
  },
  created() {
    let bno = this.$route.params.bno;
    console.log(bno);

    http.get("/board/" + bno).then(({ data }) => {
      console.log(data.board);
      this.board = data.board;
    });

    http.get("/comment/" + bno).then(({ data }) => {
      console.log(data);
      this.comments = data;
    });
  },
};
</script>

<style>
.boardth {
  background-color: antiquewhite;
  margin: 15px;
  padding: 7px;
  border-radius: 7px;
}
.boardtd {
  background-color: #f0f0f0;
  border-radius: 7px;
}
.userbtn {
  text-decoration: none;
  background-color: #7ca3b7;
  border-radius: 10px;
  color: #f0f0f0;
  margin: 10px;
  padding: 10px;
}

.adminbtn {
  text-decoration: none;
  background-color: #7ca3b7;
  border-radius: 10px;
  color: #f0f0f0;
  margin: 10px;
  padding: 10px;
  position: absolute;
  right: 20px;
}
</style>
