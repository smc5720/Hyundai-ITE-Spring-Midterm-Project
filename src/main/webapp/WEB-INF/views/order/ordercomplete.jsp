<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
        <div class="text-center p-4 border-bottom">
            <h3>주문완료</h3>
        </div>
        <div class="text-center p-4">
            <p>주문이 완료되었습니다.</p>
            <p><small>주문번호: 2109984984 (주문일시: 2021.10.01 11:11)</small></p>
            <p><small>배송포장: 쇼핑백 선택</small></p>
        </div>
        <table class="table">
            <thead>
                <tr class="row bg-light">
                    <td class="col text-center">상품정보</td>
                    <td class="col-1 text-center">수량</td>
                    <td class="col-1 text-center">판매가</td>
                </tr>
            </thead>
            <tbody>
                <tr class="row">
                    <td class="col">
                        <div class="card border-white" style="max-width: 540px;">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img class="img-thumbnail" src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B3ASZ886CS_GN_S01.jpg" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-1 ml-2">
                                        <p class="card-text">the CASHMERE</p>
                                        <p class="card-title font-weight-bolder">[KONGES SLOJD] 헨리넥 셔츠</p>
                                        <p class="card-text"><small class="text-muted">color : BROWN / size :
                                                130</small></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="col-1 text-center align-middle border-left">1</td>
                    <td class="col-1 text-center align-middle border-left">￦70,000</td>
                </tr>
                <tr>
                    <td class="border-bottom">
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
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>