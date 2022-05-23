<template v-slot:default>
  <div>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left" width="7%">글번호</th>
            <th class="text-left" width="50%">제목</th>

            <th class="text-left" width="15%">작성일시</th>
            <th class="text-left" width="7%">조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(board, index) in boards" :key="index">
            <td>{{ board.bno }}</td>
            <td class="alink">
              <a href="#" @click="movePage(board.bno)">{{ board.btitle }}</a>
            </td>

            <td>{{ board.bwrite_date }}</td>
            <td>{{ board.bread_count }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  name: "BootaBoardView",
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
    http.get("/boota").then(({ data }) => {
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

<style></style>
