<template>
  <div class="regist">
    <div style="text-align: right">
      <button class="writeBtn" @click="writePage">질문하러 가기</button>
    </div>
    <div v-if="boards.length">
      <table id="board-list">
        <colgroup>
          <col style="width: 5%" />
          <col style="width: 40%" />
          <col style="width: 25%" />
          <col style="width: 25%" />
          <col style="width: 5%" />
        </colgroup>
        <thead>
          <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(board, index) in boards" :key="index">
            <td>{{ board.bno }}</td>
            <td>
              <a href="#" @click="movePage(board.bno)">{{ board.btitle }}</a>
            </td>
            <td>{{ board.bwriter }}</td>
            <td>{{ board.bwrite_date }}</td>
            <td>{{ board.bread_count }}</td>
          </tr>
        </tbody>
      </table>
      <div class="search">
        <input type="text" v-model="keyword" placeholder="검색어를 입력" />
        <button class="searchbtn" @click="searchPage()">검색</button>
      </div>
      <div class="pagination">
        <a
          v-if="startPage > 1"
          href="#"
          class="page-link"
          @click="movePageLink(startPage - 1)"
          >[이전]</a
        >
        <a
          v-for="val in endPage"
          :key="val"
          href="#"
          class="page-link"
          style=""
          @click="movePageLink(val)"
          >[{{ val }}]</a
        >
        <a
          v-if="endPage < totalPage"
          href="#"
          class="page-link"
          @click="movePageLink(endPage + 1)"
          >[다음]</a
        >
      </div>
    </div>
    <div v-else class="text-center"><img src="@/assets/noboard.png" /></div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  components: {},
  data() {
    return {
      boards: [],
      startPage: 0,
      totalPage: 0,
      endPage: 0,
      keyword: "",
    };
  },
  created() {
    http.get("/board").then(({ data }) => {
      console.log(data);
      this.boards = data.boardList;
      this.startPage = data.startPage;
      this.totalPage = data.totalPage;
      this.endPage = data.endPage;
    });
  },
  methods: {
    movePage(bno) {
      this.$router.push({ path: "/qna/detail/" + bno });
    },
    writePage() {
      this.$router.push("/qna/write");
    },
    searchPage() {
      http.get("/board/search?key=" + this.keyword).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
        console.log(this.startPage);
      });
    },
    movePageLink(p) {
      http.get("/board?p=" + p).then(({ data }) => {
        console.log(data);
        this.boards = data.boardList;
        this.startPage = data.startPage;
        this.totalPage = data.totalPage;
        this.endPage = data.endPage;
      });
    },
  },
};
</script>

<style>
.regist {
  display: inline;
}
.searchbtn {
  margin: 10px;
  background-color: rgb(102, 102, 102);
  color: #f0f0f0;
  border-color: rgb(176, 176, 176);
  border-radius: 5px;
  border-style: none;
}
.writeBtn {
  margin: 20px;
  background-color: rgb(219, 219, 219);
  padding: 7px;
  border-style: none;
  border-radius: 7px;
}
.search {
  margin-top: 20px;
}

.pagination {
  display: flex;
  position: relative;
  left: 45%;
  align-content: center;
  align-items: center;
}
th {
  border-bottom: 0.5px solid rgb(133, 132, 132);
}
td {
  padding: 5px;
  border-bottom: 0.5px solid rgb(212, 212, 212);
}

.page-link {
  text-decoration: none;
}
</style>
