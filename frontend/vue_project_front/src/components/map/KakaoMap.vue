<template>
  <!-- 카카오맵 Vue -->

  <div class="map_wrap">
    <div
      id="map"
      style="
        border-radius: 10px;
        width: 100%;
        height: 100%;
        position: relative;
        overflow: hidden;
      "
    ></div>

    <div id="menu_wrap" class="bg_white">
      <div class="option">
        <div>
          <input
            type="text"
            placeholder="ex)대전 맛집"
            id="keyword"
            size="15"
          />
          <v-btn class="pa-0 ml-9 rounded-circle" @click="keywordSearch"
            ><v-icon>mdi-magnify</v-icon></v-btn
          >
        </div>
      </div>
      <hr />
      <ul id="placesList"></ul>
      <div id="pagination"></div>
    </div>

    <div hidden>
      {{ aptlist }}
    </div>
  </div>
</template>

<script>
export default {
  name: "KakaoMap",
  data() {
    return {
      container: Document,
      aptlist: [],
      si: "",
      gugun: "",

      keyword: "",

      markers: [],

      centerlat: "",
      centerlon: "",
    };
  },

  computed: {
    checkhouses() {
      return this.$store.state.houses;
    },
    checksido() {
      return this.$store.state.map_sidoName;
    },
    checkgugun() {
      return this.$store.state.map_gugunName;
    },
  },
  watch: {
    checkhouses(val) {
      console.log(val);
      this.aptlist = val;
      this.addMarker();
    },
    checksido(val) {
      this.si = val;
    },
    checkgugun(val) {
      this.gugun = val;
    },
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      this.addScript();
    }
  },
  updated() {
    this.addMarker();
  },
  methods: {
    initMap() {
      this.container = document.getElementById("map");
      var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 즁심죄표
        level: 3, //지도의 레벨
      };
      let map = new kakao.maps.Map(this.container, options); // 지도 생성 및 객체 리턴

      kakao.maps.event.addListener(map, "dragend", function () {
        // 지도 중심좌표를 얻어옵니다
        var latlng = map.getCenter();

        var message = "변경된 지도 중심좌표는 " + latlng.getLat() + " 이고, ";
        message += "경도는 " + latlng.getLng() + " 입니다";
        console.log(message);
      });

      //마커추가하려면 객체를 아래와 같이 하나 만든다.
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
          //현재 위치
          const mylat = position.coords.latitude;
          const mylon = position.coords.longitude;

          const myPosition = new kakao.maps.LatLng(mylat, mylon);
          console.log(myPosition);
          const message = `<div> 현재 위치 </div>`;

          displayMarker(myPosition, message);
        });
      } else {
        var myPosition = new kakao.maps.LatLng(33.450701, 126.570667);
        var message = `현재 위치를 찾을 수 없습니다`;
        displayMarker(myPosition, message);
      }

      function displayMarker(myPosition, message) {
        const marker = new kakao.maps.Marker({
          map: map,
          position: myPosition,
        });
        const iwContent = message;
        const iwRemovable = true;

        var infowindow = new kakao.maps.InfoWindow({
          content: iwContent,
          removable: iwRemovable,
        });
        infowindow.open(map, marker);
        map.setCenter(myPosition);
      }
      // var marker = new kakao.maps.Marker({
      //   position: map.getCenter(),
      // });
      // marker.setMap(map);
    },
    addScript() {
      const script = document.createElement("script"); /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=5109dcfdfa66abe5fce885e757428197&libraries=services";
      document.head.appendChild(script);
    },
    addMarker() {
      var that = this;
      var mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5, // 지도의 확대 레벨
      }; // 지도를 생성합니다
      var map = new kakao.maps.Map(this.container, mapOption); // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder(); // 주소로 좌표를 검색합니다
      var imageSrc =
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
      //해당 동에 아파트 거래내역이 없으면 해당 동으로 위치 조정
      if (this.aptlist.length == 0) {
        var addrFullName = this.si + " " + this.gugun + " ";
        geocoder.addressSearch(addrFullName, function (result, status) {
          // 정상적으로 검색이 완료됐으면
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
              map: map,
              position: coords,
            }); // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
              content:
                '<div style="width:150px;text-align:center;padding:6px 0;">' +
                "해당 도시에 거래 내역이 없습니다." +
                "</div>",
            });
            infowindow.open(map, marker); // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            marker.setMap(map);
            map.setCenter(coords);
          }
        });
      }

      this.aptlist.forEach((element) => {
        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);
        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        var addrFullName =
          this.si +
          " " +
          this.gugun +
          " " +
          element.법정동 +
          " " +
          element.도로명;

        geocoder.addressSearch(addrFullName, function (result, status) {
          // 정상적으로 검색이 완료됐으면
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
              map: map,
              clickable: true,
              position: coords,
              image: markerImage, // 마커 이미지
              title: element.아파트,
            }); // 인포윈도우로 장소에 대한 설명을 표시합니다

            var infowindow = new kakao.maps.InfoWindow({
              content:
                '<div style="width:150px;text-align:center;padding:6px 0;">' +
                addrFullName +
                " " +
                element.아파트 +
                "</div>",
            });
            infowindow.open(map, marker);
            marker.setMap(map); //마커를 지도에 표시
            map.setCenter(coords);

            kakao.maps.event.addListener(marker, "click", function () {
              moveMarker(marker);
            });
            that.centerlat = map.getCenter().getLat();
            that.centerlon = map.getCenter().getLng();
          }
        });
        function moveMarker(marker) {
          var moveLatLon = marker.getPosition;
          map.setCenter(moveLatLon);
        }
      });

      this.centerlat = map.getCenter().getLat();
      this.centerlon = map.getCenter().getLng();

      console.log(this.centerlat, this.centerlon);
    },

    /////////////////////////////////////////////////////////////////////////
    keywordSearch() {
      console.log(this.centerlat, this.centerlon);
      var that = this;
      var markers = [];

      var mapContainer = document.getElementById("map"); // 지도를 표시할 div
      console.log("여기", this.centerlat, this.centerlon);
      var mapOption = {
        center: new kakao.maps.LatLng(that.centerlat, that.centerlon), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
      };

      // 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);
      // var nowlat = map.getCenter().getLat();
      // var nowlon = map.getCenter().getLng();

      // console.log(nowlat, nowlon);

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places();

      ps.keywordSearch(this.keyword, placesSearchCB);
      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

      // 키워드로 장소를 검색합니다
      searchPlaces();
      function searchPlaces() {
        var keyword = document.getElementById("keyword").value;
        console.log(keyword);
        console.log("여기", that.centerlat, that.centerlon);

        if (!keyword.replace(/^\s+|\s+$/g, "")) {
          alert("키워드를 입력해주세요!");
          return false;
        }

        var tlat = that.centerlat;
        var tlng = that.centerlon;
        console.log("서치", tlat, tlng);
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB, {
          radius: 2000,
          location: new kakao.maps.LatLng(tlat, tlng),
        });
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
          // 정상적으로 검색이 완료됐으면
          // 검색 목록과 마커를 표출합니다
          const bounds = new kakao.maps.LatLngBounds();

          for (var i = 0; i < data.length; i++) {
            //displayMarker(data[i]);
            bounds.extend(
              new kakao.maps.LatLng(that.centerlat, that.centerlon),
            );
          }

          map.setBounds(bounds);
          displayPlaces(data);

          // 페이지 번호를 표출합니다
          displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
          alert("검색 결과가 존재하지 않습니다.");
          return;
        } else if (status === kakao.maps.services.Status.ERROR) {
          alert("검색 결과 중 오류가 발생했습니다.");
          return;
        }

        // function displayMarker(place) {
        //   var marker = new kakao.maps.Marker({
        //     map: map,
        //     position: new kakao.maps.LatLng(place.y, place.x),
        //     clickable: true,
        //   });

        //   kakao.maps.event.addListener(marker, "click", function () {
        //     console.log(marker);
        //     infowindow.setContent(`<div>` + place.place_name + `</div>`);
        //     infowindow.open(map, marker);
        //   });
        // }
      }

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {
        var listEl = document.getElementById("placesList");
        var menuEl = document.getElementById("menu_wrap");
        var fragment = document.createDocumentFragment(),
          bounds = new kakao.maps.LatLngBounds();
        //var listStr = "";

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for (var i = 0; i < places.length; i++) {
          // 마커를 생성하고 지도에 표시합니다
          var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

          // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
          // LatLngBounds 객체에 좌표를 추가합니다
          bounds.extend(placePosition);

          // 마커와 검색결과 항목에 mouseover 했을때
          // 해당 장소에 인포윈도우에 장소명을 표시합니다
          // mouseout 했을 때는 인포윈도우를 닫습니다
          (function (marker, title) {
            kakao.maps.event.addListener(marker, "mouseover", function () {
              displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, "mouseout", function () {
              infowindow.close();
            });

            itemEl.onmouseover = function () {
              displayInfowindow(marker, title);
            };

            itemEl.onmouseout = function () {
              infowindow.close();
            };
          })(marker, places[i].place_name);

          fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
      }

      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, places) {
        var el = document.createElement("li"),
          itemStr =
            '<span class="markerbg marker_' +
            (index + 1) +
            '"></span>' +
            '<div class="infoel">' +
            "   <h5>" +
            places.place_name +
            "</h5>";

        if (places.road_address_name) {
          itemStr +=
            "    <span>" +
            places.road_address_name +
            "</span>" +
            '   <span class="jibun gray">' +
            places.address_name +
            "</span>";
        } else {
          itemStr += "    <span>" + places.address_name + "</span>";
        }

        itemStr += '  <span class="tel">' + places.phone + "</span>" + "</div>";

        el.innerHTML = itemStr;
        el.className = "item";

        return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx, title) {
        console.log(title);
        var imageSrc =
            "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
          imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
          imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
          },
          markerImage = new kakao.maps.MarkerImage(
            imageSrc,
            imageSize,
            imgOptions,
          ),
          marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage,
          });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker); // 배열에 생성된 마커를 추가합니다

        return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
        var paginationEl = document.getElementById("pagination"),
          fragment = document.createDocumentFragment(),
          i;

        // // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
          paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
          var el = document.createElement("a");
          el.href = "#";
          el.innerHTML = i;

          if (i === pagination.current) {
            el.className = "on";
          } else {
            el.onclick = (function (i) {
              return function () {
                pagination.gotoPage(i);
              };
            })(i);
          }

          fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + "</div>";

        infowindow.setContent(content);
        infowindow.open(map, marker);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
          el.removeChild(el.lastChild);
        }
      }
    },
  },
};
</script>
<style>
.map_wrap,
.map_wrap * {
  margin: 0;
  padding: 0;
  font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
  font-size: 12px;
}
.map_wrap a,
.map_wrap a:hover,
.map_wrap a:active {
  color: #000;
  text-decoration: none;
}
.map_wrap {
  position: relative;
  width: 100%;
  height: 500px;
}
#menu_wrap {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  width: 250px;
  margin: 10px 0 30px 10px;
  padding: 5px;
  overflow-y: auto;
  background: rgba(255, 255, 255, 0.7);
  z-index: 1;
  font-size: 12px;
  border-radius: 10px;
}
.bg_white {
  background: #fff;
}
#menu_wrap hr {
  display: block;
  height: 1px;
  border: 0;
  border-top: 2px solid #5f5f5f;
  margin: 3px 0;
}
#menu_wrap .option {
  text-align: center;
}
#menu_wrap .option p {
  margin: 10px 0;
}
#menu_wrap .option button {
  margin-left: 5px;
}
#placesList li {
  list-style: none;
}
#placesList .item {
  position: relative;
  border-bottom: 1px solid #888;
  overflow: hidden;
  cursor: pointer;
  min-height: 65px;
}
#placesList .item span {
  display: block;
  margin-top: 4px;
}
#placesList .item h5,
#placesList .item .infoel {
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
#placesList .item .infoel {
  padding: 10px 0 10px 55px;
}
#placesList .infoel .gray {
  color: #8a8a8a;
}
#placesList .infoel .jibun {
  padding-left: 26px;
  background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
    no-repeat;
}
#placesList .infoel .tel {
  color: #009900;
}
#placesList .item .markerbg {
  float: left;
  position: absolute;
  width: 36px;
  height: 37px;
  margin: 10px 0 0 10px;
  background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
    no-repeat;
}
#placesList .item .marker_1 {
  background-position: 0 -10px;
}
#placesList .item .marker_2 {
  background-position: 0 -56px;
}
#placesList .item .marker_3 {
  background-position: 0 -102px;
}
#placesList .item .marker_4 {
  background-position: 0 -148px;
}
#placesList .item .marker_5 {
  background-position: 0 -194px;
}
#placesList .item .marker_6 {
  background-position: 0 -240px;
}
#placesList .item .marker_7 {
  background-position: 0 -286px;
}
#placesList .item .marker_8 {
  background-position: 0 -332px;
}
#placesList .item .marker_9 {
  background-position: 0 -378px;
}
#placesList .item .marker_10 {
  background-position: 0 -423px;
}
#placesList .item .marker_11 {
  background-position: 0 -470px;
}
#placesList .item .marker_12 {
  background-position: 0 -516px;
}
#placesList .item .marker_13 {
  background-position: 0 -562px;
}
#placesList .item .marker_14 {
  background-position: 0 -608px;
}
#placesList .item .marker_15 {
  background-position: 0 -654px;
}
#pagination {
  margin: 10px auto;
  text-align: center;
}
#pagination a {
  display: inline-block;
  margin-right: 10px;
}
#pagination .on {
  font-weight: bold;
  cursor: default;
  color: #777;
}
</style>
