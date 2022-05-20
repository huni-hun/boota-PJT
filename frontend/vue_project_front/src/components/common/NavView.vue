<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fab fa-github fa-2x mx-3 ps-1"></i>
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-mdb-toggle="collapse"
        data-mdb-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <form class="me-3">
          <div class="form-white input-group" style="width: 250px">
            <input
              type="search"
              class="form-control rounded"
              placeholder="Search or jump to... ( / )"
              aria-label="Search"
              aria-describedby="search-addon"
            />
          </div>
        </form>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">Pull request</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Issues</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Marketplace</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Explore</a>
          </li>
        </ul>
        <ul class="navbar-nav d-flex flex-row ms-auto me-3">
          <li class="nav-item me-3 me-lg-0 dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-mdb-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="fas fa-plus"></i>
            </a>
            <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdown"
            >
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <a class="dropdown-item" href="#">Something else here</a>
              </li>
            </ul>
          </li>
          <li class="nav-item me-3 me-lg-0 dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown1"
              role="button"
              data-mdb-toggle="dropdown"
              aria-expanded="false"
            >
              <img
                src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                class="rounded-circle"
                height="22"
                alt=""
                loading="lazy"
              />
            </a>
            <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdown1"
            >
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <a class="dropdown-item" href="#">Something else here</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- <div>
    <b-navbar toggleable="lg" type="dark" variant="dark">
      <b-navbar-brand href="#">
        <router-link to="/">
          <img
            src="@/assets/happy.png"
            class="d-inline-block align-middle"
            width="90px"
            alt="Kitten"
          />
        </router-link>
      </b-navbar-brand>
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item href="#"
            ><router-link to="/" class="link">HOME</router-link></b-nav-item
          >
          <b-nav-item href="#"
            ><router-link to="/qna" class="link">Q&A</router-link></b-nav-item
          >
          <b-nav-item href="#"
            ><router-link to="/" class="link">공지사항</router-link></b-nav-item
          >
          <b-nav-item href="#"
            ><router-link to="/house" class="link">MAP</router-link></b-nav-item
          >
          <b-nav-item href="#"
            ><router-link to="/" class="link"
              >부동산 타임</router-link
            ></b-nav-item
          >
        </b-navbar-nav>

        <b-navbar-nav class="ml-auto">
          <b-nav-item-dropdown right>
            <template #button-content>
              <b-icon icon="person" font-scale="2.5"></b-icon>
            </template>
            <b-dropdown-item href="#">회원가입</b-dropdown-item>
            <b-dropdown-item href="#">로그인</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div> -->
</template>

<script>
export default {};
</script>

<style scoped>
.link {
  color: azure;
}

.link:hover {
  color: rgba(27, 177, 231, 1);
  text-decoration-line: none;
}
.form-white.input-group > .form-control:focus {
  border-color: #fff;
  box-shadow: inset 0 0 0 1px #fff;
}

.navbar-dark .navbar-nav .nav-link {
  color: #fff;
}

.navbar-dark .navbar-nav .nav-link:hover,
.navbar-dark .navbar-nav .nav-link:focus {
  color: rgba(255, 255, 255, 0.75);
}
</style>
