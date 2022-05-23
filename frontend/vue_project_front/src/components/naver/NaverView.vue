<template>
  <div>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left" width="7%">글번호</th>
            <th class="text-left" width="33%">제목</th>
            <th class="text-left" width="40%">내용</th>
            <th class="text-left" width="7%">링크</th>
            <th class="text-left" width="13%">작성일시</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(news, index) in newsList" :key="index">
            <td>{{ index }}</td>
            <td v-html="news.title"></td>
            <td v-html="news.description"></td>
            <td class="alink">
              <a href="">{{ news.link }}</a>
            </td>
            <td>{{ news.pubDate }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  data() {
    return {
      newsList: [],
    };
  },
  created() {
    http.get("/naver/news?keyword=" + "부동산").then(({ data }) => {
      console.log(data);
      this.newsList = data.items;
      console.log(this.newsList);
    });
  },
};
</script>

<style></style>
