<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">

.product_list_heart_button {
    float: right;
    width: 30px;
    margin-left: 3px;
    cursor: pointer;
}

.product_list_cart_button {
    border-radius: 100%;
    float: right;
    width: 30px;
    margin-left: 3px;
    cursor: pointer;
}

.product_list_wrapper {
    display: grid;
    width: 90%;
    margin: 100px auto 250px;
    grid-template-columns: repeat(4, 1fr);
    grid-template-areas: "product1 product2 product3 product4 product5
        product6 product7 product8";
    grid-gap: 10px;
}

.product_list_table {
    width: 400px;
}

.product_list_table th, .product_list_table tr, .product_list_table td {
    border-collapse: collapse;
    text-align: left;
    padding-bottom: 10px;
}

.product_list_main_image {
    width: 100%;
}

.product_list_product {
    margin: 0px 10px;
}

.product_list_sort select {
    border-style: none;
    float: right;
    position: relative;
    top: 150px;
    left: 320px;
}

#footer {
    position: static;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    function toggleCartStatus(element) {
        // 카트 아이콘 클릭 시 alert 창 표시
        alert('상품이 장바구니에 추가되었습니다.');
    }

    $(document).ready(function() {
        $('.product_list_cart_button').click(function() {
            // 카트 아이콘 클릭 시 toggleCartStatus 함수 호출
            toggleCartStatus(this);
        });

        $('.material-symbols-outlined').click(function() {
            var k = $(this).css('font-variation-settings');
            console.log(k);
            if (k === '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400') {
                console.log("true");
                $(this).css('font-variation-settings', '"FILL" 0, "GRAD" 0, "opsz" 24, "wght" 400');
            } else {
                console.log("false");
                $(this).css('font-variation-settings', '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400');
            }
        });
        
        // 카트 아이콘 클릭 시 fill 색상 제거
        $('.product_list_cart_button').click(function() {
            $(this).css('font-variation-settings', '"FILL" 0, "GRAD" 0, "opsz" 24, "wght" 400');
        });
    });
</script>







</head>
<body>
   <%@include file="../main/header.jsp"%>
   <div class="product_list_sort">
      <select>
         <option>최신순</option>
         <option>인기순</option>
         <option>가격순</option>
      </select>
   </div>
   <br>
   <div class="product_list_wrapper">
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>





               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>




               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>



               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>


               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>




               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>



               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>




               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
      <div class="product_list_product">
         <a href="product_detail.do"><img src="resources/image/pro1.png"
            class="product_list_main_image"></a>
         <table class="product_list_table">
            <tbody>
               <tr>
                  <th colspan="5"><a href="product_detail.do">상품명</a></th>
                  <th><span
                     class="material-symbols-outlined product_list_cart_button"
                     onclick="addToCart('product1')">shopping_cart</span> <span
                     class="material-symbols-outlined product_list_heart_button"
                     onclick="toggleHeartIcon(this)">favorite</span></th>



               </tr>
               <tr>
                  <td colspan="6">라일락/장미/자작나무</td>
               </tr>
               <tr>
                  <td colspan="6">20,000</td>
               </tr>
            </tbody>
         </table>
         <br> <br> <br>
      </div>
   </div>
   <%@include file="../main/footer.jsp"%>
</body>
</html>

