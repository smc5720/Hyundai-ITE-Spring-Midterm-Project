<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
.title_font {
	font-size: 16px;
	height: 30px;
	font-weight: bolder;
	margin: 40px 0px 15px 0px;
}

.table_head {
	background-color: #f5f5f5;
	padding: 7px 0px 7px 20px;
	width: 140px;
	height: 45px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

.table_body {
	border-top: 1px solid #666;
}

.table_detail {
	width: 525px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	padding: 7px 10px;
}

.mandatory_sign {
	color: #c69c6c;
	font-weight: bolder;
}

.no_mandatory_sign {
	color: #f5f5f5;
	font-weight: bolder;
}

.form_hyphen {
	padding-right: 5px;
	height: 32px;
	line-height: 32px;
	display: inline-block;
	text-align: center;
	color: #b0b0b0;
}

select {
	margin: 0px 5px 0 0;
	height: 30px;
	border: 1px solid #ccc;
	padding: 3px 8px 6px 8px;
	vertical-align: top;
}

input[type="text"], input[type="password"], input[type="email"] {
	margin-right: 5px;
	height: 30px;
	line-height: 30px;
	text-indent: 10px;
	border: 1px solid #ccc;
}

.btn_normal {
	margin-left: 5px;
	display: inline-block;
	color: #363636;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}

.btn_theme_white {
	padding: 6px 10px 7px;
	min-width: 50px;
	border: 1px solid #ccc;
	background: #fff;
	font-size: 11px;
	line-height: 11px;
}

.btn_theme_gray {
	padding: 7px 15px 9px;
	min-width: 90px;
	border: 1px solid #ccc;
	background: #f5f5f5;
	line-height: 12px;
}
</style>
<div class="container" style="font-size: 12px; color: #444444;">
	<div>
		<div style="text-align: center; font-size: 26px; margin: 30px 0px;">배송&결제
			정보 입력</div>
	</div>
	<div class="d-flex">
		<div style="margin-right: 10px">
			<div>
				<table>
					<thead style="border-top: 1px solid #666">
						<tr>
							<th scope="col" class="table_head"
								style="width: 441px; text-align: center; padding: 7px 0px; border-bottom: 1px solid #f5f5f5;">
								상품정보</th>
							<th scope="col" class="table_head"
								style="width: 66px; text-align: center; padding: 7px 0px; border-bottom: 1px solid #f5f5f5;">
								수량</th>
							<th scope="col" class="table_head"
								style="width: 158px; text-align: center; padding: 7px 0px; border-bottom: 1px solid #f5f5f5;">
								판매가/쿠폰 적용가</th>
						</tr>
					</thead>
					<tbody class="table_body">
						<c:forEach var="sb_product" items="${shoppingBags}">
							<tr>
								<td class="align-middle table_detail"
									style="width: 441px; padding: 15px">
									<div class="d-flex">
										<img style="width: 98px;"
											src="${sb_product.colors[sb_product.coloridx].cimageproduct1}" />
										<div style="margin-left: 20px">
											<div style="font-size: 11px">${sb_product.bname}</div>
											<div>${sb_product.pname}</div>
											<div
												style="margin-top: 10px; font-size: 11px; color: #999999;">
												color : ${sb_product.sbproductcolor} / size :
												${sb_product.sbproductsize}</div>
										</div>
									</div>
								</td>
								<td class="align-middle table_detail"
									style="width: 66px; text-align: center; border: 1px solid rgba(0, 0, 0, 0.1);">
									${sb_product.sbproductamount}</td>
								<td class="align-middle table_detail"
									style="width: 158px; text-align: center">₩ <fmt:formatNumber
										value="${sb_product.pprice * sb_product.sbproductamount}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<div class="m-1">
					<div class="title_font">주문자 정보</div>
					<table>
						<tbody class="table_body">
							<tr>
								<th scope="row" class="align-middle table_head"><span
									class="no_mandatory_sign">* </span>주문자</th>
								<td class="align-middle table_detail">${member.mname}</td>
							</tr>
							<tr>
								<th scope="row" class="align-middle table_head"><span
									class="no_mandatory_sign">* </span>휴대폰</th>
								<td class="align-middle table_detail">${member.mtel}</td>
							</tr>
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="no_mandatory_sign">* </span>E-mail</th>
								<td class="align-middle table_detail">${member.memail}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="m-1">
					<div class="title_font">결제 수단 선택</div>
					<table>
						<tbody class="table_body">
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="no_mandatory_sign">* </span>결제수단 선택</th>
								<td class="align-middle table_detail">
									<div>
										<div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio1"
													value="click_pay" onclick="selectPaymentType(this)" /> <label
													class="form-check-label mr-2 mb-1" for="inlineRadio1">CLICK
													결제</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio2"
													value="credit_card" onclick="selectPaymentType(this)" /> <label
													class="form-check-label mr-2 mb-1" for="inlineRadio2">신용카드</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio3"
													value="transfer" onclick="selectPaymentType(this)" /> <label
													class="form-check-label mr-2 mb-1" for="inlineRadio3">실시간
													계좌이체</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio4"
													value="virtual_account" onclick="selectPaymentType(this)" />
												<label class="form-check-label mr-2 mb-1" for="inlineRadio4">가상
													계좌</label>
											</div>
										</div>
										<div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio5"
													value="smile_pay" onclick="selectPaymentType(this)" /> <label
													class="form-check-label mr-2 mb-1" for="inlineRadio5">스마일
													페이</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio6"
													value="hyundai_card" onclick="selectPaymentType(this)" />
												<label class="form-check-label mr-2 mb-1" for="inlineRadio6">현대카드
													레드 쇼핑바우처</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="inlineRadioOptions" id="inlineRadio7" value="toss"
													onclick="selectPaymentType(this)" /> <label
													class="form-check-label mr-2 mb-1" for="inlineRadio7">토스</label>
											</div>
										</div>
									</div>
									<div>
										<div
											style="height: 100px; width: 160px; border-radius: 8px; background: gray; text-align: center; font-weight: bold; color: white; margin: 20px 30px;">
											카드 등록</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<div class="d-flex m-1">
					<div class="title_font">기본 배송지 정보</div>
					<div style="margin-top: 40px; margin-left: 20px">
						<button type="button" class="btn_normal btn_theme_white"
							onclick="getBaseAddress(${mno})">기본 배송지</button>
						<button type="button" class="btn_normal btn_theme_white"
							onclick="getAddresses(${mno})">최근 배송지 선택</button>
					</div>
					<script>
						let ano = 0;
						
						function getBaseAddress(mno) {
							$.ajax({
								url: "/order/getBaseAddress",
								data: {
									"mno" : mno
								}
							}).done((data) => {
								if (data.postcode === undefined) {
									alert("기본으로 설정된 배송지가 없습니다.");
								} else {
									$("#postcode").val(data.postcode);
									$("#address").val(data.address1);
									$("#detailAddress").val(data.address2);
									ano = data.ano;
								}
							});
						}
						
						function getAddresses(mno) {
							$.ajax({
								url: "/order/getAddresses",
								data: {
									"mno" : mno
								}
							}).done((data) => {
								tmp = '<div style="border: 1px solid rgba(0, 0, 0, 0.1); padding: 5px">';
								let addresses = data.addresses;
								for (let i = 0; i < addresses.length; i++) {
									let address = "(" + addresses.at(i).postcode + ") " + addresses.at(i).address1 + ", " + addresses.at(i).address2;
									tmp += '<div>';
									tmp += "<a id='address" + i + "' href='javascript:selectAddress(" + i + ", " + addresses.at(i).ano + ")'>" + address + "</a>";
									tmp += '</div>';
								}
								tmp += '</div>';
								$("#address-box").html(tmp);
							});
						}
					</script>
				</div>
				<div>
					<div id="address-box"></div>
					<script>					
						function selectAddress(id, adno) {
							let address = $("#address" + id).text();
							let tmp = address.split(', ');
							let address2 = tmp[1];
							tmp = tmp[0].split(') ');
							let address1 = tmp[1];
							tmp = tmp[0].split('(');
							let postcode = tmp[1];

							$("#postcode").val(postcode);
							$("#address").val(address1);
							$("#detailAddress").val(address2);
							
							ano = adno;
						}
					</script>
					<table>
						<tbody class="table_body">
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="mandatory_sign">* </span>배송지 주소</th>
								<td class="align-middle table_detail">
									<div>
										<div>
											<div class="d-flex">
												<input type="text" name="postcode" id="postcode" readonly
													style="width: 77px; margin-bottom: 5px" />
												<div>
													<button type="button" class="btn_normal btn_theme_gray"
														onclick="execDaumPostcode()">우편번호 조회</button>
												</div>
											</div>
										</div>
										<div>
											<input type="text" name="address" id="address" readonly
												style="width: 507px; margin-bottom: 5px" />
										</div>
										<div>
											<input type="text" name="detailAddress" id="detailAddress"
												placeholder="나머지 주소를 입력해주세요." required style="width: 507px" />
										</div>
									</div> <script
										src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
									<script>
									function execDaumPostcode() {
										daum.postcode.load(function() {
											new daum.Postcode({
												oncomplete : function(data) {
													$("#postcode").val(
															data.zonecode);
													$("#address").val(
															data.roadAddress);
												},
											}).open();
										});
									}
								</script>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="mandatory_sign">* </span>수령인</th>
								<td class="align-middle table_detail"><input type="text"
									id="oreceivername" /></td>
							</tr>
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="mandatory_sign">* </span>휴대폰 번호</th>
								<td class="align-middle table_detail">
									<div class="d-flex align-items-center">
										<form>
											<select name="phone_number" id="oreceivertel1_1">
												<option value="010" selected>010</option>
												<option value="011">011</option>
												<option value="012">012</option>
												<option value="013">013</option>
												<option value="014">014</option>
												<option value="015">015</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</form>
										<div class="form_hyphen">-</div>
										<div>
											<input type="text" size="4" maxlength="4"
												id="oreceivertel1_2" />
										</div>
										<div class="form_hyphen">-</div>
										<div>
											<input type="text" size="4" maxlength="4"
												id="oreceivertel1_3" />
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="no_mandatory_sign">* </span>연락처</th>
								<td class="align-middle table_detail">
									<div class="d-flex align-items-center">
										<form>
											<select name="phone_number" id="oreceivertel2_1">
												<option value="NaN" selected>---</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="012">012</option>
												<option value="013">013</option>
												<option value="014">014</option>
												<option value="015">015</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</form>
										<div class="form_hyphen">-</div>
										<div>
											<input type="text" size="4" maxlength="4"
												id="oreceivertel2_2" />
										</div>
										<div class="form_hyphen">-</div>
										<div>
											<input type="text" size="4" maxlength="4"
												id="oreceivertel2_3" />
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="table_head align-middle"><span
									class="no_mandatory_sign">* </span>배송요청사항</th>
								<td class="align-middle table_detail"><input type="text"
									maxlength="20" style="width: 507px" id="ocomment" /></td>
							</tr>
						</tbody>
					</table>
					<div>* 선택사항을 미입력하더라도 불이익은 발생하지 않습니다.</div>
					<div style="margin-bottom: 90px;"></div>
				</div>
			</div>

		</div>
		<div>
			<div
				style="border: 1px solid #414040; margin-bottom: 15px; width: 433px;">
				<div style="padding: 10px 20px 30px">
					<div
						style="font-size: 14px; font-weight: bolder; text-align: center">
						최종 결제 금액</div>
					<hr />
					<div class="d-flex">
						<div style="font-size: 11px; color: #555555">상품 합계</div>
						<div
							style="font-size: 11px; color: #555555; margin-left: auto; margin-bottom: 13px;">
							₩
							<fmt:formatNumber value="${total}" />
						</div>
					</div>
					<div class="d-flex">
						<div style="font-size: 11px; color: #555555">배송비</div>
						<div
							style="font-size: 11px; color: #555555; margin-left: auto; margin-bottom: 13px;">
							₩
							<fmt:formatNumber value="${post}" />
						</div>
					</div>
				</div>
				<div style="background-color: #f5f5f5; padding: 20px 10px 15px 20px">
					<div class="d-flex align-items-center">
						<div style="font-size: 14px; font-weight: bolder; color: #555555">
							합계</div>
						<div
							style="font-size: 18px; font-weight: bolder; color: #c69c6c; margin-left: auto;">
							₩
							<fmt:formatNumber value="${total + post}" />
						</div>
					</div>
				</div>
			</div>
			<div>
				<div>
					<button
						style="min-width: 140px; background: #4a4a4a; border: 1px solid #4a4a4a; color: #fff; font-size: 14px; margin-left: 0; width: 100%; padding: 13px 0 15px;"
						onclick="orderSubmit()">결제하기</button>
					<script>
						let ptype;
					
						function selectPaymentType(obj) {
							ptype = obj.value;
						}

						function orderSubmit() {
							let params = {
									"ptype" : ptype,
									"apostcode" : $("#postcode").val(),
									"aaddress1" : $("#address").val(),
									"aaddress2" : $("#detailAddress").val(),
									"oreceivername" : $("#oreceivername").val(),
									"oreceivertel1" : $("#oreceivertel1_1").val() + $("#oreceivertel1_2").val() + $("#oreceivertel1_3").val(),
									"oreceivertel2" : $("#oreceivertel2_1").val() + $("#oreceivertel2_2").val() + $("#oreceivertel2_3").val(),
									"ocomment" : $("#ocomment").val(),
									"ano" : ano,
							}
							
							let form = document.createElement('form');
							form.setAttribute('method', 'post');
							form.setAttribute('action', 'orderpayment');
							document.charset = "utf-8";
							
							for (let key in params) {
								let field = document.createElement('input');
								field.setAttribute('type', 'hidden');
								field.setAttribute('name', key);
								if (params[key] === "" && key !== "ocomment") {
									alert("필수 양식을 전부 기입해주세요.");
									return;
								}
								if (key === "oreceivertel1" && params[key].length < 10) {
									alert("휴대폰 번호가 올바르지 않습니다.");
									return;
								}
								field.setAttribute('value', params[key]);
								form.appendChild(field);
							}
							
							document.body.appendChild(form);
							form.submit();
						}
					</script>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>