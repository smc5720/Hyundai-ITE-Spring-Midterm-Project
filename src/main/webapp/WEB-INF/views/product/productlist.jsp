<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
ul {
	list-style: none;
	padding: 0;
}

.container {
	padding: 0;
}

a {
	color: black;
	text-decoration: none;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

.cell {
	float: left;
	box-sizing: border-box;
}

.product-list .cell {
	width: 20%;
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 20px;
}

.img-box>img {
	display: block;
	width: 100%;
	cursor: pointer;
}

div .product-color {
	text-align: center;
}

div .product-color>a>img {
	margin: 0px 2px;
	width: 18px;
	height: 18px;
}

@media ( max-width :1440px) {
	.product-list .row .cell {
		width: calc(100%/ 4);
	}
}

.product-list .row .cell .brand-name, .product-name, .product-price {
	text-align: center;
	font-size: 12px;
}

.imgswap img:last-child {
	display: none
}

.imgswap:hover img:first-child {
	display: none
}

.imgswap:hover img:last-child {
	display: inherit
}

.btn-group button {
	cursor: pointer;
	float: left;
}

.btn-group button:not(:last-child) {
	border-right: none;
}

.dropdown-menu {
	min-width: 10rem;
}

input[id="cb1"] {
	display: none;
}

input[id="cb1"]+label {
	width: 22px;
	height: 22px;
	margin: 2px 2px;
	cursor: pointer;
	border-radius: 5px;
	background: lightblue;
}

input[id="cb2"] {
	display: none;
}

input[id="cb2"]+label {
	width: 40px;
	margin: 2px 2px;
	cursor: pointer;
	border: 1px solid black;
	text-align: center;
}

input[id="cb3"] {
	display: none;
}

input[id="cb3"]+label {
	width: 80px;
	margin: 2px 2px;
	cursor: pointer;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<p class="card-text bg m-4"
			style="transform: rotate(0); text-align: center; font-size: 20px;"
			id="product_category_title"></p>
	</div>
	<script>
		const url = new URL(window.location.href);
		const urlParams = url.searchParams;
		let tmp = "<a href='' class='stretched-link'>"
				+ urlParams.get("cLarge") + "</a>";
		tmp += " > ";
		tmp += "<a href='' class='stretched-link'>" + urlParams.get("cMedium")
				+ "</a>";
		tmp += " > ";
		tmp += "<a href='' class='stretched-link'>" + urlParams.get("cSmall")
				+ "</a>";
		$("#product_category_title").html(tmp);
	</script>
	<hr />
	<div class="container">
		<form id="productFilter">
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					브랜드</button>
				<div class="dropdown-menu" id="test">
					<input type="checkbox" value='Brand1' /> Brand1<br /> <input
						type="checkbox" value='Brand2' /> Brand2<br /> <input
						type="checkbox" value='Brand3' /> Brand3<br />
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					색상</button>
				<div class="dropdown-menu">
					<input type="checkbox" id="cb1" value="red"><label
						for="cb1"></label> <input type="checkbox" id="cb1" value="black"><label
						for="cb1"></label> <input type="checkbox" id="cb1" value="blue"><label
						for="cb1"></label> <input type="checkbox" id="cb1" value="yellow"><label
						for="cb1"></label> <input type="checkbox" id="cb1" value="green"><label
						for="cb1"></label>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					사이즈</button>
				<div class="dropdown-menu">
					<input type="checkbox" value='XS' id="cb2" /><label for="cb2">XS</label>
					<input type="checkbox" value='S' id="cb2" /><label for="cb2">S</label>
					<input type="checkbox" value='M' id="cb2" /><label for="cb2">M</label>
					<input type="checkbox" value='L' id="cb2" /><label for="cb2">L</label>
					<input type="checkbox" value='XL' id="cb2" /><label for="cb2">XL</label>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					가격</button>
				<div class="dropdown-menu" style="font-size: 11px;">
					<input type="checkbox" value='0' /> ￦ 100,000 이하<br /> <input
						type="checkbox" value='1' /> ￦ 100,000 ~ ￦ 300,000 <br /> <input
						type="checkbox" value='2' /> ￦ 300,000 ~ ￦ 500,000<br /> <input
						type="checkbox" value='3' /> ￦ 500,000 ~ ￦ 1,000,000<br /> <input
						type="checkbox" value='4' /> ￦ 1,000,000 이상<br />
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					정렬순</button>
				<div class="dropdown-menu">
					<input type="checkbox" value='NEW' id="cb3" /><label>신상품</label> <input
						type="checkbox" value='MANY' id="cb3" /><label>판매순</label> <input
						type="checkbox" value='HIGH' id="cb3" /><label>고가순</label> <input
						type="checkbox" value='LOW' id="cb3" /><label>저가순</label> <input
						type="checkbox" value='LIKE' id="cb3" /><label>평점순</label>
				</div>
			</div>
			<div class="btn-group">
				<label style="margin: 0; font-size: 12px; padding-right: 10px;"><input
					type="checkbox" name="SALE" value="SALE" /> SALE</label> <label
					style="margin: 0; font-size: 12px"><input type="checkbox"
					name="SALE" value="SALE" /> 한섬딜리버리</label>
			</div>
			<div class="btn-group" style="float: right;">
				<input type='reset' style="border: none; background-color: white;">
				<input type='submit' value='적용'
					style="border: none; background-color: white;">
				<text
					style="font-size: 12px; text-align: center; align-self: center;">전체
				100건</text>
			</div>
		</form>
	</div>
	<div class="container product-list">
		<div class="list">
			<ul class="row" id="product-list-wrapper">

			</ul>
		</div>
	</div>
	<script>
		let product_array;
		
		$(window).ready(function () {
			$.ajax({
				url: "${pageContext.request.contextPath}/getProductList?cLarge=" + urlParams.get("cLarge")
						+ "&cMedium=" + urlParams.get("cMedium")
						+ "&cSmall=" + urlParams.get("cSmall")
			}).done((data) => {
				product_array = data.products;
				let html_tmp = "";
				for (let i = 0; i < product_array.length; i++) {
					let product = product_array.at(i);
					let product_color = product.colors;
					let product_info = product.product;
					let tmp = "";
					tmp += "<li class='cell'><a id='product_link" + i + "' href='productdetail?pcode=" + product_array.at(i).product.pcode + "&cproductcolor=" + product_array.at(i).colors.at(product_array.at(i).state).cproductcolor + "'>";
					tmp += "	<div id='product_img" + i + "' class='img-box imgswap'>";
					tmp += "		<img src='" + product_color.at(product_array.at(i)["state"])["cimageproduct1"] + "' alt='' />";
					tmp += "		<img src='" + product_color.at(product_array.at(i)["state"])["cimageproduct2"] + "' alt='' />";
					tmp += "	</div>";
					tmp += "	<div class='brand-name'>" + product_info.bname + "</div>";
					tmp += "	<div class='product-name'>" + product_info.pname + "</div>";
					tmp += "	<div class='product-price'>" + product_info.pprice.toLocaleString() + "원</div></a>";
					tmp += "	<div class='product-color'>";
					for (let j = 0; j < product_color.length; j++) {
						tmp += "<a href='javascript:changeColor(" + i + ", " + j + ")'><img src='" + product_color.at(j)["ccolorchipimage"] + "'/></a>";
					}
					tmp += "	</div>";
					tmp += "</li>";
					html_tmp += tmp;
				}
				$("#product-list-wrapper").html(html_tmp);
			});
		});
		
		function changeColor(product_idx, color_idx) {
			product_array.at(product_idx)["state"] = color_idx;
			console.log(product_array.at(product_idx));
			console.log(product_array.at(product_idx).colors.at(product_array.at(product_idx).state).cproductcolor);
			
			let color_img = product_array.at(product_idx).colors.at(color_idx);
			let p_color_id = "#product_img" + product_idx;
			let p_link = "#product_link" + product_idx;
			
			let tmp = "";
				tmp += "<img src='" + color_img["cimageproduct1"] + "' alt='' />";
				tmp += "<img src='" + color_img["cimageproduct2"] + "' alt='' />";
			
			$(p_link).attr("href", "productdetail?pcode=" + product_array.at(product_idx).product.pcode + "&cproductcolor=" + product_array.at(product_idx).colors.at(product_array.at(product_idx).state).cproductcolor);
			$(p_color_id).html(tmp);
		}
	</script>

	<div class="container">
		<p style="text-align: center;">
			<a href=""> <span>«</span>
			</a> <a href="">1 &nbsp</a> <a href="">2 &nbsp</a> <a href="">3 &nbsp</a>
			<a href="">4 &nbsp</a> <a href="">5 &nbsp</a> <a href=""> <span>»</span>
			</a>
		</p>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>