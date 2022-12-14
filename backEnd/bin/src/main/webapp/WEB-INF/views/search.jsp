<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy House</title>


    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/search.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto:wght@100&display=swap"
        rel="stylesheet">

    <script src="https://kit.fontawesome.com/b65e009655.js" crossorigin="anonymous"></script>

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a href="${pageContext.request.contextPath }" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <i class="text-primary fa-solid fa-apartment" style="font-size: 30px;"> <span
                            style="font-size: 20px;">happy house</span> </i>

                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03"
                    aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor03">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">?????? ??????
                                <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">????????? ??????</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">?????? ??????</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">?????? ?????? ??????</a>
                        </li>
                    </ul>
                <c:if test="${empty loginInfo}">
                <div id="login-banner">
                    <a href="<%=request.getContextPath()%>/member/login" class="btn btn-primary">?????????</a>
                    <a href="<%=request.getContextPath()%>/member/regist" class="btn btn-secondary">????????????</a>
                </div>
				</c:if>
				<c:if test="${!empty loginInfo}">
                <div id="logout-banner">
                    <a href="<%=request.getContextPath()%>/member/logout" class="btn btn-primary" id="logout">????????????</a>
                    
                    <a href="<%=request.getContextPath()%>/member/memberinfo" class="btn btn-secondary">????????????</a>
                </div>
                </c:if>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="search-bar d-flex">
            <div class="input-box">
                <input id="search-text" type="text" placeholder="????????? ??????" class="form-control">
                <div id="search" class="btn btn-primary"><i class="fa-solid fa-search"></i></div>
            </div>
            <div class="select-box d-flex">
                <select name="sido" id="sido" class="form-select"></select>
                <select name="gugun" id="gugun" class="form-select">
                    <option value="">????????????</option>
                </select>
                <select name="dong" id="dong" class="form-select">
                    <option value="">?????????</option>
                </select>
<!--                 <select name="dong" id="dong" class="form-select"> -->
<!--                     <option value="">2022</option> -->
<!--                 </select> -->
<!--                 <select name="dong" id="dong" class="form-select"> -->
<!--                     <option value="">02</option> -->
<!--                 </select> -->
            </div>
        </div>
        <div class="d-flex h-100">
            <aside class="side-menu">
                <div class="title fw-bold fs-5 pt-2 pb-2">?????? ??????
	 				<button style="float: right; margin-right: 10px;" id ="changeArc" class="btn btn-outline-primary btn-sm ">????????? ??????</button>
	 				 <button style="float: right; margin-right: 10px; display:none;" id ="returnArc" class="btn btn-outline-primary btn-sm ">??????????????? ??????</button>
	                <button style="float: right; margin-right: 10px;" id = "priceSort" class="btn btn-outline-primary btn-sm ">?????????</button>
	                <button style="float: right; margin-right: 10px;" id = "areaSort" class="btn btn-outline-primary btn-sm ">?????????</button>
                </div>
                <div class="item-list">
                </div>

            </aside>
            <div class="map-box bg-light h-100 w-100 min-width:1200px">
                <div id="map" style="width: 100%; min-width: 1200px; height:100%"></div>
                <div class="control-box">
                    <div class="custom_typecontrol radius_border d-flex">
                        <div id="btnRoadmap" class="btn btn-sm btn-primary" onclick="setMapType('roadmap')">??????</div>
                        <div id="btnSkyview" class="btn btn-sm btn-light" onclick="setMapType('skyview')">????????????</div>
                    </div>
                    <!-- ?????? ??????, ?????? ????????? div ????????? -->
                    <div class="custom_zoomcontrol radius_border"> 
                        <span onclick="zoomIn()"><i class="fa-solid fa-plus"></i></span>  
                        <span onclick="zoomOut()"><i class="fa-solid fa-minus"></i></span>
                    </div>
                </div>
            </div>

        </div>

    </main>



    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f7f5fde63f4485e2da2ec94ca2c656b"></script>
    <script>
        var mapContainer = document.getElementById('map'), // ????????? ????????? div 
            mapOption = {
                center: new kakao.maps.LatLng(37.56690080111218, 126.97872864067423), // ????????? ????????????
                level: 3 // ????????? ?????? ??????
            };
        // ????????? ????????? div???  ?????? ????????????  ????????? ???????????????
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // ????????? ??????, ??????, ????????? ?????? ??????????????? ???????????? ????????? ??????????????? ????????? ????????? ??????????????? ???????????? ???????????????
        kakao.maps.event.addListener(map, 'bounds_changed', function () {
            // ?????? ??????????????? ??????????????? 
            var bounds = map.getBounds();
            // ??????????????? ????????? ????????? ??????????????? 
            var swLatlng = bounds.getSouthWest();
            // ??????????????? ????????? ????????? ??????????????? 
            var neLatlng = bounds.getNorthEast();
            var message = '??????????????? ????????? ??????, ?????????  ' + swLatlng.toString() + '??????';
            message += '????????? ??????, ?????????  ' + neLatlng.toString() + '????????? ';
            // console.log(message);
        });

        // ???????????? ???????????? ?????? ?????? ???????????? ????????? ???????????? ???????????? ??????????????? ????????? ???????????????
        function setMapType(maptype) {
            var roadmapControl = document.getElementById('btnRoadmap');
            var skyviewControl = document.getElementById('btnSkyview');
            if (maptype === 'roadmap') {
                map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
                roadmapControl.className = 'btn btn-sm btn-primary';
                skyviewControl.className = 'btn btn-sm btn-light';
            } else {
                map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
                skyviewControl.className = 'btn btn-sm btn-primary';
                roadmapControl.className = 'btn btn-sm btn-light';
            }
        }

        // ?????? ??????, ?????? ??????????????? ?????? ????????? ????????? ???????????? ????????? ???????????? ???????????????
        function zoomIn() {
            map.setLevel(map.getLevel() - 1);
        }

        // ?????? ??????, ?????? ??????????????? ?????? ????????? ????????? ???????????? ????????? ???????????? ???????????????
        function zoomOut() {
            map.setLevel(map.getLevel() + 1);
        }

    </script>
    <script>
    var searchTarget = [];

    $(document).ready(function() {
    	$.ajax({
    		type:'get',
    		url:"<%=request.getContextPath()%>/transaction",
    		data: {
    			"gugun":"11110",
    			"year":"2022",
    			"month":"02"
    		},
    		contentType: 'application/json; charset=UTF-8',
    		success: function(result) {
    		
    			let r = JSON.parse(result);		
    			
    			setTransactionList(r['response']['body']['items']['item']);
    			
    				
	
    		},
    		error: function(a,b,c) {
    			
    			console.log(a+b+c);
    		}
    	
    	})
    })

    $(document).on('keyup', 'input[id="search-text"]', function (e) {
      let name = $(e.target).val();
      if (e.keyCode == 13) {
    	  getSearchList(name);
      }
    });

    $(document).on('click', '#search', function (e) {
      let name = $('input[id="search-text"]').val();
      getSearchList(name);
    });

    $(document).on('click', '.item', function(e) {
    // console.log(e.target.parentNode)
    	  let aptName = $(e.target).parents('.item').children('.item-name').text().trim();
    	  
    	  getSearchList(aptName);
    })

    $(document).on('change', '#dong', function () {
    	  var sido = $('#sido option:checked').text();
    	  var gugun = $('#gugun option:checked').text();
    	  var dong = $('#dong option:checked').text();
    	  console.log(sido, gugun, dong);
    	  
    	  getSearchListByDongName(dong);	  
    	  
    	});

    $(document).on('change', '#gugun', function() {
    		var sido = $('#sido option:checked').val();
    		var gugun = $('#gugun option:checked').val();
    		console.log(sido, gugun);
    		getTransactionList(gugun.substring(0,5)); 
    	  
    })
    function getSearchList(name) {
    	let result = [];
    	for(let i=0;i<this.searchTarget.length;i++) {
    		if(searchTarget[i]['?????????'].includes(name) || searchTarget[i]['?????????'] == name) {
    			result.push(searchTarget[i]);
    		}
    	}
    	setTransactionList(result);	
    }

    function getSearchListByDongName(dongName) {
    	let result = [];
    	for(let i=0;i<this.searchTarget.length;i++) {
    		if(searchTarget[i]['?????????'] == dongName) {
    			result.push(searchTarget[i]);
    		}			
    	}
    	setTransactionList(result);
    }

    function getTransactionList(gugun) {
    	$.ajax({
    		type:'get',
    		url:'<%=request.getContextPath()%>/transaction',
    		data: {
    			'gugun':gugun,
    			'year':'2022',
    			'month':'02'
    		},		
    		contentType: 'application/json; charset=UTF-8',
    		success: function(result) {
    			let r = JSON.parse(result);		
    			setTransactionList(r['response']['body']['items']['item']);
    			
    		},
    		error: function(a,b,c) {
    			console.log(a+b+c);
    		}
    	
    	})
    } 

    
    function setTransactionList(jsonData) {
    	result = '';
    	
    	sortJson = jsonData;
    	searchTarget = jsonData;
        console.log(searchTarget);
    		
        for (var i = 0; i < jsonData.length; i++) {
          // console.log(jsonData[i]);
          var yearMonth = String(jsonData[i]['???']) + String(jsonData[i]['???']);
          var day = jsonData[i]['???'];
          var name = jsonData[i]['?????????'];
          var area = jsonData[i]['????????????'];
          var price = jsonData[i]['????????????'];
          var roadName = jsonData[i]['?????????'];
          var dongName = jsonData[i]['?????????'];

        
          var text = `
          <div class="item">
              <div class="item-name">
                  \${name}
              </div>
              <div class="item-info">
                  <div class="price">???????????? : \${price}??????</div>
                  <div class="area">?????? : \${area}m??</div>
              </div>
              <div class="date">
                  <i class="fa-regular fa-calendar-days"></i>
                  \${yearMonth.slice(0, 4)}.\${yearMonth.slice(4, 6)}.\${day}
              </div>
              <div class="item-road" style="display: none">
                  \${roadName}
              </div>
              <div class="item-dong" style="display: none">
                  \${dongName}
              </div>                                                
          </div>`;

          result += text;
        }

        $('.item-list').html(result);
    }


    //
    // ??????????????? ?????? ??? ????????? ????????????
    $(document).on('click', '.item', function (e) {
      // console.log(e.target.parentNode)
      var aptName = $(e.target).parents('.item').children('.item-name').text();
      var aptLoad = $(e.target).parents('.item').children('.item-road').text();
      aptLoad = $.trim(aptLoad);
    // console.log(aptLoad)

      // #1. fetch latlngjson.json
      fetch('data/latlngjson.json')
        .then((response) => {
          return response.json();
        })
        .then((jsonData) => {
      //console.log(jsonData)
          var result = '';
          for (var i = 0; i < 25000; i++) {
            // #2. ?????????(loadName)?????? ???????????? ??????, ?????? ?????????
            var loadAddress = String(jsonData[i]['???????????????']);

            if (loadAddress.includes(aptLoad)) {
              var lat = String(jsonData[i]['??????']) * 1;
              var long = String(jsonData[i]['??????']) * 1;
    // console.log(lat);
    // console.log(long);
              // #3. ???????????? ?????? ????????? ????????????
              var container = document.getElementById('map'); // ????????? ?????? ????????? DOM
    															// ????????????
              var options = {
                // ????????? ????????? ??? ????????? ?????? ??????
                center: new kakao.maps.LatLng(lat, long), // ????????? ????????????.
                level: 1, // ????????? ??????(??????, ?????? ??????)
              };

              var map = new kakao.maps.Map(container, options); // ?????? ?????? ??? ?????? ??????

              // ????????? ????????? ???????????????
              var markerPosition = new kakao.maps.LatLng(lat, long);

              // ????????? ???????????????
              var marker = new kakao.maps.Marker({
                position: markerPosition,
              });

              // ????????? ?????? ?????? ??????????????? ???????????????
              marker.setMap(map);

              // ????????? ????????? ???????????? ??? ?????? ?????? ????????? ?????????????????? ???????????????
              var iwContent = `<div style="padding:5px;">${aptName}</div>`; // ??????????????????
    																		// ?????????
    																		// ????????????
    																		// HTML
    																		// ???????????????
    																		// document
    																		// element???
    																		// ???????????????

              // ?????????????????? ???????????????
              var infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
              });

              // ????????? ??????????????? ???????????? ???????????????
              kakao.maps.event.addListener(marker, 'mouseover', function () {
                // ????????? ??????????????? ???????????? ???????????? ?????????????????? ???????????? ???????????????
                infowindow.open(map, marker);
              });

              // ????????? ??????????????? ???????????? ???????????????
              kakao.maps.event.addListener(marker, 'mouseout', function () {
                // ????????? ??????????????? ???????????? ???????????? ?????????????????? ???????????????
                infowindow.close();
              });

              break;
            }
          }
        });
    });

    let url = 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes';
    let regcode = '*00000000';
    // ?????? ??????/?????????, ???
    // https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000

   	var sortJson;
    var reverse = 0;
    $("#priceSort").click(function() {
		result = '';
    	
		if(reverse == 0){
	        console.log(sortJson);
	        sortJson.sort(function(a,b){
	    		return parseFloat(a.????????????) - parseFloat(b.????????????)
	    	});
	        reverse++;
		}else{
	        console.log(sortJson);
	    	sortJson.sort(function(a,b){
	    		return parseFloat(b.????????????) - parseFloat(a.????????????)
	    	});
	    	reverse--;
		}
        
        for (var i = 0; i < sortJson.length; i++) {
          var yearMonth = String(sortJson[i]['???']) + String(sortJson[i]['???']);
          var day = sortJson[i]['???'];
          var name = sortJson[i]['?????????'];
          var area = sortJson[i]['????????????'];
          var price = sortJson[i]['????????????'];
          var roadName = sortJson[i]['?????????'];
          var dongName = sortJson[i]['?????????'];

        
          var text = `
          <div class="item">
              <div class="item-name">
                  \${name}
              </div>
              <div class="item-info">
                  <div class="price">???????????? : \${price}??????</div>
                  <div class="area">?????? : \${area}m??</div>
              </div>
              <div class="date">
                  <i class="fa-regular fa-calendar-days"></i>
                  \${yearMonth.slice(0, 4)}.\${yearMonth.slice(4, 6)}.\${day}
              </div>
              <div class="item-road" style="display: none">
                  \${roadName}
              </div>
              <div class="item-dong" style="display: none">
                  \${dongName}
              </div>                                                
          </div>`;

          result += text;
        }

        $('.item-list').html(result);
    })		
    
    ////// ?????? ??????
   	var sortJson;
    var reverse = 0;
    $("#areaSort").click(function() {
		result = '';
    	
		if(reverse == 0){
	        console.log(sortJson);
	        sortJson.sort(function(a,b){
	    		return parseFloat(a.????????????) - parseFloat(b.????????????)
	    	});
	        reverse++;
		}else{
	        console.log(sortJson);
	    	sortJson.sort(function(a,b){
	    		return parseFloat(b.????????????) - parseFloat(a.????????????)
	    	});
	    	reverse--;
		}
        
        for (var i = 0; i < sortJson.length; i++) {
          var yearMonth = String(sortJson[i]['???']) + String(sortJson[i]['???']);
          var day = sortJson[i]['???'];
          var name = sortJson[i]['?????????'];
          var area = sortJson[i]['????????????'];
          var price = sortJson[i]['????????????'];
          var roadName = sortJson[i]['?????????'];
          var dongName = sortJson[i]['?????????'];

        
          var text = `
          <div class="item">
              <div class="item-name">
                  \${name}
              </div>
              <div class="item-info">
                  <div class="price">???????????? : \${price}??????</div>
                  <div class="area">?????? : \${area}m??</div>
              </div>
              <div class="date">
                  <i class="fa-regular fa-calendar-days"></i>
                  \${yearMonth.slice(0, 4)}.\${yearMonth.slice(4, 6)}.\${day}
              </div>
              <div class="item-road" style="display: none">
                  \${roadName}
              </div>
              <div class="item-dong" style="display: none">
                  \${dongName}
              </div>                                                
          </div>`;

          result += text;
        }

        $('.item-list').html(result);
    })		
    </script>
    <script>
    var searchTarget = [];

	$(document).ready(function(){					
		$.get("<%=request.getContextPath()%>/map/sido"
			,function(data, status){
				$.each(data, function(index, vo) {
					$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
				});
			}
			, "json"
		);
	});

    $(document).on('click', '#search', function (e) {
      let name = $('input[id="search-text"]').val();
      getSearchList(name);
    });


				$(document).on("change", "#sido", function() {
					$.get("<%=request.getContextPath()%>/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">??????</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get("<%=request.getContextPath()%>/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">??????</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get("<%=request.getContextPath()%>/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$("tbody").empty();
								$.each(data, function(index, vo) {
									let str = `
										<tr class="${colorArr[index%3]}">
										<td>${vo.aptCode}</td>
										<td>${vo.aptName}</td>
										<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
										<td>${vo.buildYear}</td>
										<td>${vo.recentPrice}</td>
									`;
									$("tbody").append(str);
								});
								
							}
							, "json"
					);
				});

				
    </script>

<script>
    const changeArcBtn = document.querySelector("#changeArc");
    const returnArcBtn = document.querySelector("#returnArc");
    const areas = document.getElementsByClassName("area");

    changeArcBtn.addEventListener('click',(e)=>{

        for (area of areas){

            let areaBefore = area.innerHTML;
            area.value = areaBefore;

            areaBefore=areaBefore.slice(5,-2);

            let areaAfter = Math.round(areaBefore*0.3025*100)/100;

            area.innerHTML = `?????? : \${areaAfter} ???`;
        }

        returnArcBtn.style.display="";
        changeArcBtn.style.display="none";
    })

    returnArcBtn.addEventListener('click',(e)=>{

        for (area of areas){

            let areaBefore = area.innerHTML;
            area.value = areaBefore;

            areaBefore=areaBefore.slice(5,-1);

            let areaAfter = Math.round(areaBefore * 3.305785 * 100)/100;

            area.innerHTML = `?????? : \${areaAfter}m??`;


        }

        changeArcBtn.style.display="";
        returnArcBtn.style.display="none";
    })

    </script>
    

</body>

</html>