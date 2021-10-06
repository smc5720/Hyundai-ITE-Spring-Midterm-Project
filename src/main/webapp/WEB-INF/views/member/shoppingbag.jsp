<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<h3 class="text-center m-4 border-top p-4">
	<span>쇼핑백</span>
</h3>
<div class="container">
	<table class="table">
		<thead>
			<tr class="row bg-light">
				<th class="col-1 text-center"><input type="checkbox" name=""
					id="allchecked"></th>
				<th class="col text-center">상품정보</th>
				<th class="col-1 text-center">수량</th>
				<th class="col-1 text-center">판매가</th>
				<th class="col-1 text-center">적립율</th>
				<th class="col-1 text-center">선택</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="sb_product" items="${shoppingBags}">
				<tr class="row">
					<form method="post" action="changeProductOption">
					<td class="col-1 text-center"><input type="checkbox"
						name="${sb_product.sbno}" id="${sb_product.sbno}"></td>
					<td class="col">
						<div class="card border-white" style="max-width: 540px;">
							<div class="row no-gutters">
								<div class="col-md-4">
									<img class="img-thumbnail"
										src="${sb_product.colors[sb_product.coloridx].cimageproduct1}"
										alt="product-img">
								</div>
								<div class="col-md-8">
									<input type="hidden" value="${sb_product.sbno}"
										name="sbnoSelected" /> <input type="hidden"
										value="${sb_product.pcode}" name="pcodeSelected" />
									<div class="card-body">
										<p class="card-text">${sb_product.bname}</p>
										<h6 class="card-title">${sb_product.pname}</h6>

										<p class="card-text">
											<small class="text-muted">color : <select
												class="custom-select col-4" name="colorSelected"
												id="colorSelected">
													<c:forEach var="color" items="${sb_product.colors}">
														<option
															<c:if test="${color.cproductcolor eq sb_product.sbproductcolor}">
															selected</c:if>
															value="${color.cproductcolor}">${color.cproductcolor}</option>
													</c:forEach>
											</select>
											</small> <small class="text-muted">/ size : <select
												class="custom-select col-4" name="sizeSelected"
												id="sizeSelected">
													<c:forEach var="size" items="${sb_product.sizes}">
														<option
															<c:if test="${size.sproductsize eq sb_product.sbproductsize}">
															selected</c:if>
															value="${size.sproductsize}">${size.sproductsize}</option>
													</c:forEach>
											</select>
											</small>
										</p>
										<c:if test="${sb_product.sbno eq remainSbno}">
											<p class="card-text">
												<small class="text-muted"> <span class="text-danger">남은
														수량: ${remainStock}</span>
												</small>
											</p>
										</c:if>
										<p class="card-text">
											<small class="text-muted text-right">
												<button class="btn btn-light btn-sm">옵션변경</button>
											</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</td>
					<td class="col-1 text-center align-middle border-left"><input
						class="mb-2 text-center" type="number" size="1"
						style="width: inherit;" name="amountSelected"
						value="${sb_product.sbproductamount}" min="0" />
						<button class="btn btn-outline-secondary btn-sm"
							style="width: inherit;">변경</button></td>
					<td class="col-1 text-center align-middle border-left"><fmt:formatNumber
							value="${sb_product.sbproductamount * sb_product.pprice}" /></td>
					<td class="col-1 text-center align-middle border-left">5%</td>
					<td class="col-1 text-center align-middle border-left"><a
						class="btn btn-outline-secondary btn-sm"
						href="deleteshoppingbag?sbnoSelected=${sb_product.sbno}">삭제</a></td>
					</form>
				</tr>
			</c:forEach>
			<script>
			$("#allchecked").click(function(){
				if($("input:checkbox[id='allchecked']").prop("checked")){
					$("input[type=checkbox]").prop("checked", true);
				}else{
					$("input[type=checkbox]").prop("checked", false);		
				}
				});
			</script>
			<tr>
				<td>
					<div class="float-right">
						<dl class="row">
							<dt class="col-sm-6">상품합계</dt>
							<dd class="col-sm-6">￦0</dd>

							<dt class="col-sm-6">배송비</dt>
							<dd class="col-sm-6">￦0</dd>
						</dl>
						<div class="row">
							<dt class="col-sm-6">합계</dt>
							<dd class="col-sm-6">￦0</dd>
							</dl>
						</div>
					</div>
					<div class="float-right mr-5">
						<div>
							<dd>총 ${shoppingBags.size()}개 상품</dd>
							</dl>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="text-center">
						<button class="btn btn-light">선택상품 삭제</button>
						<button class="btn btn-secondary">선택상품 주문하기</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>