<template>
  <div class="home">
    <section id="cards-box">
      <div class="card-container mt-4 d-flex justify-content-between">
        <!-- 카드 시작 -->
        <div class="card">
          <div class="card-body">
            <div>
              <b-icon icon="person" font-scale="2.5" class="card-icon"></b-icon>
            </div>
            <div class="card-title fw-bold fs-4">내집 마련하기</div>
            <div class="card-text">가용자금 확인 및 대출계획</div>
            <div class="card-text">집 종류 및 지역 선택</div>
            <div class="card-text">정보 수집 & 시세파악</div>
            <div class="card-text">인테리어 공사</div>
          </div>
        </div>
        <div class="card">
          <div class="card-body">
            <div>
              <b-icon
                icon="exclamation-circle"
                font-scale="2.5"
                class="card-icon"
              ></b-icon>
            </div>
            <div class="card-title fw-bold fs-4">오늘의 뉴스</div>
            <div class="card-text">
              서울 입주 2년차 아파트 전셋값 1억 4000만원 올라...
            </div>
            <div class="card-text">
              서울 입주 2년차 아파트 전셋값 1억 4000만원 올라...
            </div>
            <div class="card-text">
              서울 입주 2년차 아파트 전셋값 1억 4000만원 올라...
            </div>
          </div>
        </div>
        <div class="card">
          <div class="card-body">
            <div>
              <b-icon icon="bell" font-scale="2.5" class="card-icon"></b-icon>
            </div>
            <div class="card-title fw-bold fs-4">공지사항</div>
            <div class="card-text">
              <a href="">서비스 이용약관 변경 안내</a>
            </div>
            <div class="card-text">
              <a href="">고객센터 전화상담 점검 안내</a>
            </div>
            <div class="card-text">
              <a href="">개인정보 처리방침 개정 안내</a>
            </div>
            <div class="card-text">
              <a href="">[서비스 점검 공지 (3/30 04:00 ~ 06:00)]</a>
            </div>
          </div>
        </div>
        <!-- 카드 끝 -->
      </div>
    </section>
  </div>
</template>

<script></script>

<style>
#main {
  height: 400px;
}

.card {
  border: 1px solid #e0e0e0;
  box-shadow: none;
  border-radius: 8px;
  width: 100%;
  max-width: 350px;
  padding: 25px 20px;
  /* height: 340px; */
}

.card-icon {
  font-size: 80px;
  color: #3459e6;
  margin-bottom: 10px;
}

.card-text {
  color: rgb(141, 141, 141);
  word-break: keep-all;
  margin-bottom: 1rem;
}
.card-text a {
  text-decoration: none;
  color: rgb(141, 141, 141);
}
.card-title {
  color: rgb(50, 50, 75);
  margin-bottom: 20px;
}

nav {
  border-bottom: 1px solid #e0e0e0;
}

@media (max-width: 1080px) {
  .card {
    width: 100%;
    max-width: 100%;
  }

  .card-icon {
    font-size: 80px;
    color: #3459e6;
    margin-bottom: 10px;
  }

  .card-container {
    flex-wrap: wrap;
    /* justify-content: flex-start !important; */
  }

  footer {
    position: relative;
  }
}

@media (max-width: 768px) {
  .card {
    width: 100%;
    max-width: 100%;
  }

  .card-icon {
    font-size: 80px;
    color: #3459e6;
    margin-bottom: 10px;
  }

  .card-container {
    flex-wrap: wrap;
    /* justify-content: flex-start !important; */
  }
}
</style>
