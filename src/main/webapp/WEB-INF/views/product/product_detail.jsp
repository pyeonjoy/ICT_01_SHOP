<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   function goToBuyPage() {
      window.location.href = "mypage_order.jsp";
   }
</script>
<meta charset="UTF-8">
<title>product_detail</title>
<style type="text/css">
.product_detail_wrap {
   margin: 0px auto;
   width: 1000px;
   line-height: 25px;
}

.product_detail_top {
   text-align: center;
}

.product_detail_select p {
   font-size: 14px;
   padding-top: 10px;
}

.product_detail_image {
   background-color: gray;
   width: 500px;
   height: 423px;
   margin: 10px 30px 0px 0px;
   float: left;
   position: relative;
   background-image: url('resources/image/pro1.png'); /* 이미지 경로 지정 */
   background-size: contain; /* 이미지를 요소에 맞게 크기 조정 */
   background-position: center; /* 이미지를 가운데 정렬 */
}

.product_detail_heart {
    width: 50px;
    height: 50px;
    position: absolute;
    top: 353px;
    left: 430px;
    background-image: url('resources/image/heart_01.png'); /* 이미지 경로 지정 */
    background-size: contain; /* 이미지를 요소에 맞게 크기 조정 */
    background-position: center; /* 이미지를 가운데 정렬 */
    background-repeat: no-repeat; /* 이미지 반복 없음 */
    background-color: transparent; /* 배경 투명 설정 */
}


.product_detail_text_right {
   width: 400px;
   margin: 10px 10px 20px 0px;
   float: right;
   /*background-color: pink;*/
}

.product_detail_title {
   width: 200px;
   display: inline-block;
   float: left;
   margin: 0px;
   float: left;
}

.product_detail_price {
   margin: 0px;
   width: 100px;
   text-align: right;
   float: right;
}

.product_detail_subtitle {
   margin: 34px 0px 20px 0px;
}

.product_detail_select {
   width: 95px;
   height: 120px;
   background-color: gray;
   display: inline-block;
   margin: 10px 0px;
   line-height: 80px;
}

.product_detail_under_wrap1 {
   margin: 10px 0px 10px 0px;
   width: 200px;
   height: 30px;
   display: flex;
}

.product_detail_type {
   margin: 5px 5px;
}

.product_detail_btn1 {
   font-size: 10px;
   margin: 0px 5px;
   background-color: lightgray;
   border-radius: 20px;
   width: 50px;
   height: 25px;
   border: none;
}

.product_detail_btn2 {
   font-size: 10px;
   background-color: lightgray;
   border: none;
   color: gary;
   width: 195px;
   height: 30px;
   margin: 0;
}

.product_detail_body {
   float: left;
   margin: 100px auto 70px;
   width: 100%;
}

#footer {
   position: static;
}

.product_detail_check_btn {
   display: none;
}

.product_detail_check_btn:checked ~ .product_detail_detail {
   display: block;
}

.product_detail_detail {
   display: none;
   padding: 6px;
   font-size: 15px;
}

.product_detail_description {
   display: block;
   width: 1000px;
   margin: 20px auto 90px;
}
</style>
<script type="text/javascript">
   function cartList_go() {
      alert("장바구니에 추가되었습니다.");
   }
</script>
</head>
<body>
   <%@include file="../main/header.jsp"%>


   <div class="product_detail_body">
      <div class="product_detail_wrap">
         <div class="product_detail_top">
            <hr>
            <p>
               <small>perfume</small>
            </p>
            <h4>퍼퓸 밤 홀리메탈</h4>
            <hr>
         </div>
         <div class="product_detail_image">
            <div class="product_detail_heart"></div>
         </div>
         <div class="product_detail_text_right">
            <div>
               <h4 class="product_detail_title">퍼퓸 밤 홀리메탈</h4>
               <h3 class="product_detail_price">55,400</h3>
            </div>
            <div>
               <p class="product_detail_subtitle">측백나무잎ㅣ차가운 금속ㅣ화이트 머스크</p>
               <p>
                  <small> 우연히 발 딛은 신성한 유적지의 성전에서 느껴지는 깨끗하고 차분한 공기를 떠올리게 합니다.
                     푸른 측백나무 잎가지와 세이지의 조합에 깊이를 더해주는 인센스와 절제된 차가움을 지닌 금속성의 느낌이 어우러져 마치
                     정지된 시간의 순간을 맞이한 듯 신비한 느낌을 자아내고, 화이트 머스크와 우디노트가 기분 좋은 여운으로 어우러져 오랜
                     시간 은은하게 머무릅니다.</small>
               </p>
            </div>
            <div>
               <div class="product_detail_select">
                  <img alt="" src="">
                  <p>perfume</p>
               </div>

               <div class="product_detail_select">
                  <img alt="" src="">
                  <p>
                     <small>perfume</small>
                  </p>
               </div>

               <div class="product_detail_select">
                  <img alt="" src="">
                  <p>
                     <small>perfume</small>
                  </p>
               </div>

               <div class="product_detail_select">
                  <img alt="" src="">
                  <p>
                     <small>perfume</small>
                  </p>
               </div>
            </div>
            <div class="product_detail_under_wrap1">
               <p class="product_detail_type">Type</p>
               <button class="product_detail_btn1">6g</button>
               <button class="product_detail_btn1">12g</button>
            </div>
            <div class="product_detail_under_wrap2">
               <button class="product_detail_btn2" onclick="cartList_go()">장바구니에
                  추가하기</button>
               <button class="product_detail_btn2"
                  onclick="location.href='order_pay.do'">구매하기</button>
            </div>
         </div>
      </div>
   </div>
   <!-- div body 끝 -->
   <div class="product_detail_description">
      <div>
         <input class="product_detail_check_btn"
            id="product_detail_check_btn1" type="checkbox">
         <hr>
         <label for="product_detail_check_btn1">&#10148;제품 상세 정보</label>
         <h2 class="product_detail_detail">DAY OF NEST</h2>
         <p class="product_detail_detail">둥지 속에 포근히 감싸인 알의 따뜻하고 부드러운 곡선과
            질감을 닮은 에그퍼퓸은 알을 깨고 속을 경험하기 전에는 무엇이 들어 있을지 예상할 수 없는 궁금증을 자아냅니다. 세상에
            흩어진 모든 이야기에서 영감을 받은 감각적인 향이 단조로운 일상에 자유롭고 새로운 리듬을 부여합니다. 탬버린즈가 찾아낸
            규정되지 않은 아름다움을 향수를 통해 경험해보세요.</p>
         <br>
         <h2 class="product_detail_detail">전성분</h2>
         <p class="product_detail_detail">변성알코올, 향료, 부틸렌글라이콜, 정제수, 리모넨,
            리날룰, 알파-아이소메틸아이오논, 헥실신남알, 쿠마린, 제라니올, 하이드록시시트로넬알, 시트랄</p>
         <br>
         <h2 class="product_detail_detail">사용방법</h2>
         <ul class="product_detail_detail">
            <li>향수를 원하는 만큼 분사하여 사용하세요.</li>
            <li>맥박이 뛰는 곳에도 가볍게 터치해주면 향을 더 고르게 느낄 수 있습니다.</li>
            <li>옷, 이불 등 섬유에 직접 뿌릴 경우 이염/오염에 주의해주세요.</li>
            <li>원료 특성상 내용물의 색상 편차가 있을 수 있고 미량의 침전물이 보일 수 있으나, 품질에는 이상이 없으니
               안심하고 사용해주세요.</li>
         </ul>
         <br>
         <h2 class="product_detail_detail">사용시 주의사항</h2>
         <ul class="product_detail_detail">
            <li>화장품 사용시 또는 사용 후 직사광선에 의하여 사용부위가 붉은 반점, 부어오름 또는 가려움증 등의 이상
               증상이나 부작용이 있는 경우에는 전문의 등과 상담할 것</li>
            <li>상처가 있는 부위 등에는 사용을 자제할 것</li>
            <li>불꽃을 향하여 사용하지 말 것</li>
            <li>어린이의 손이 닿지 않는 곳에 보관할 것</li>
            <li>직사광선을 피해서 보관할 것</li>
         </ul>
         <br>
         <h2 class="product_detail_detail">사용기한</h2>
         <p class="product_detail_detail">사용기한 36개월(상품 발송일 기준으로 사용기한이 12개월
            이상 남은 상품만을 판매합니다.)</p>
         <br>
         <h2 class="product_detail_detail">제조업자</h2>
         <p class="product_detail_detail">한국ICT(주)</p>
         <br>
      </div>
      <div>
         <input class="product_detail_check_btn"
            id="product_detail_check_btn2" type="checkbox">
         <hr>
         <label for="product_detail_check_btn2">&#10148; 배송 및 반품</label>
         <p class="product_detail_detail">배송비는 2,500원이며, 3만원 이상 구매하실 경우 배송
            비용은 무료입니다.</p>
         <p class="product_detail_detail">주문일로부터 1-2 영업일 이내 출고됩니다.</p>
         <p class="product_detail_detail">배송은 지역 택배사 사정에 따라 약간의 지연이 생길 수
            있습니다.</p>
         <p class="product_detail_detail">상품 혹은 증정품의 포장(랩핑)을 개봉 및 훼손한 경우
            반품이 불가합니다.</p>
         <p class="product_detail_detail">단순 변심 또는 주문 실수로 인한 교환이 불가합니다.
            신중한 구매 부탁드립니다.</p>
      </div>
      <div class="product_detail_under_wrap2">
         <button class="product_detail_btn2" onclick="goToBuyPage()">구매하기</button>
         <button class="product_detail_btn2" onclick="cartList_go()">장바구니에
            추가하기</button>

      </div>
      <%@include file="../main/footer.jsp"%>
</body>
</html>