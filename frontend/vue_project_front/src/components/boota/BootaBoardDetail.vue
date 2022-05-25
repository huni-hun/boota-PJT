<template>
  <v-card
    :loading="loading"
    class="mx-auto my-12"
    max-width="700"
    max-height="10000"
  >
    <v-img height="100" src="@/assets/bootawrite.png"></v-img>

    <v-card-title>
      <!-- <p class="qtext"></p> -->
      {{ board.btb_title }}</v-card-title
    >

    <v-card-text>
      <v-row align="center" class="mx-0">
        <div class="my-1 grey--text">작성일 : {{ board.btb_write_date }}</div>
      </v-row>

      <div class="my-1 mb-5 text-subtitle-5">익명</div>

      <div class="black--text">
        {{ board.btb_content }}
      </div>
    </v-card-text>

    <v-divider class="mx-4"></v-divider>

    <!-- <v-card-title><p class="atext"></p></v-card-title> -->
    <v-card-text class="d-flex justify-space-around mb-6">
      <v-btn color="#eceff1"
        ><router-link :to="'/boota/modify/' + board.btbno" class="btn corbtn"
          >수정</router-link
        >
      </v-btn>
      <v-btn color="#455A64">
        <router-link :to="'/boota/delete/' + board.btbno" class="btn delbtn"
          >삭제</router-link
        ></v-btn
      >
      <v-btn color="indigo">
        <router-link to="/boota" class="btn listbtn">목록</router-link>
      </v-btn>
      <v-btn>
        <router-link :to="'/boota/commentWrite/' + board.btbno" class="btn"
          >댓글달기</router-link
        >
      </v-btn>
    </v-card-text>
    <v-card-text class="d-flex justify-center mb-6">
      <v-btn class="mr-7" color="#eceff1" disabled
        >{{ board.like_count }}
      </v-btn>
      <v-icon class="thumb" @click="updateLike"> mdi-thumb-up</v-icon>
    </v-card-text>
    <v-divider class="mx-4"></v-divider>
    <v-card-text v-if="comments.length">
      <v-simple-table>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left" width="10%">작성자</th>
              <th class="text-left" width="50%">답변</th>
              <th class="text-left" width="20%">좋아요</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(comment, index) in comments" :key="index">
              <td>익명{{ index }}</td>
              <td>{{ comment.ccontent }}</td>
              <td>{{ comment.like_count }}</td>
              <v-icon
                class="thumb"
                @click="updateCommentLike(comment.comment_no)"
              >
                mdi-thumb-up</v-icon
              >
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-card-text>
    <v-card-text v-else>댓글이 한 개도 없네요</v-card-text>
  </v-card>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data: function () {
    return {
      board: {},
      comments: {},
      btbnoTemp: 0,
    };
  },
  created() {
    let btbno = this.$route.params.btbno;
    this.btbnoTemp = btbno;
    console.log(btbno);

    http
      .get("/boota/" + btbno)
      .then(({ data }) => {
        console.log(data.board);
        this.board = data.board;
      })
      .catch((error) => {
        console.log(error);
      });

    http
      .get("boota/comment/" + btbno)
      .then(({ data }) => {
        console.log(data);
        this.comments = data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    updateLike() {
      let btbno = this.btbnoTemp;

      http
        .put("/boota/like/" + btbno)
        .then(({ data }) => {
          console.log(data);
        })
        .catch((error) => {
          console.log(error);
        });
      this.setBoard();
    },
    setBoard() {
      let btbno = this.btbnoTemp;

      http
        .get("/boota/" + btbno)
        .then(({ data }) => {
          this.board = data.board;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    updateCommentLike(val) {
      let comment_no = val;
      console.log(comment_no);

      http
        .put("/boota/comment/like/" + comment_no)
        .then(({ data }) => {
          console.log(data);
        })
        .catch((error) => {
          console.log(error);
        });
      this.setComment();
    },
    setComment() {
      let btbno = this.btbnoTemp;

      http
        .get("boota/comment/" + btbno)
        .then(({ data }) => {
          this.comments = data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scoped>
.btn {
  text-decoration: none;
}
.delbtn {
  color: #eceff1;
}
.corbtn {
  color: #37473f;
}
.listbtn {
  color: #eceff1;
}
.qtext {
  font-size: 30px;
  font-weight: bold;
  color: #6c63ff;
  margin-right: 10px;
}
.atext {
  font-size: 30px;
  font-weight: bold;
  color: #eb5b3a;
}

.thumb {
  font-size: 35px;
  color: #ef306a;
}
</style>
