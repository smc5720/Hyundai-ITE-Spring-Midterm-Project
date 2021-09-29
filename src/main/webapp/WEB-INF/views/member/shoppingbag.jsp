<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
        <table class="table">
            <thead>
                <tr class="row bg-light">
                    <th class="col-1 text-center"><input type="checkbox" name="" id=""></th>
                    <th class="col text-center">상품정보</th>
                    <th class="col-1 text-center">수량</th>
                    <th class="col-1 text-center">판매가</th>
                    <th class="col-1 text-center">적립율</th>
                    <th class="col-1 text-center">선택</th>
                </tr>
            </thead>
            <tbody>
                <tr class="row">
                    <td class="col-1 text-center"><input type="checkbox" name="" id=""></td>
                    <td class="col">
                        <div class="card border-white" style="max-width: 540px;">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img class="img-thumbnail" src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B5TTO801CS_BR_S01.jpg" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <form action="changeOption">
                                        <div class="card-body">
                                            <p class="card-text">the CASHMERE</p>
                                            <h6 class="card-title">[KONGES SLOJD] 헨리넥 셔츠</h6>
                                
                                            <p class="card-text">
                                                <small class="text-muted">color :
                                                    <select class="custom-select col-4" name="cars" id="cars">
                                                        <option selected value="color">brown</option>
                                                        <option value="onum">주문번호</option>
                                                    </select>
                                                </small>
                                                <small class="text-muted">/ size :
                                                    <select class="custom-select col-4" name="cars" id="cars">
                                                        <option selected value="color">100</option>
                                                        <option value="onum">120</option>
                                                    </select>
                                                </small>
                                            </p>
                                            <p class="card-text text-right">
                                                <small class="text-muted">
                                                    <a href="" class="text-secondary">옵션변경</a>
                                                </small>
                                            </p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="col-1 text-center align-middle border-left col">
                        <input class="mb-2 text-center" type="number" size="1" style="width: inherit;" value="1"/>
                        <button class="btn btn-outline-secondary btn-sm" style="width: inherit;">변경</button>
                    </td>
                    <td class="col-1 text-center align-middle border-left">￦70,000</td>
                    <td class="col-1 text-center align-middle border-left">5%</td>
                    <td class="col-1 text-center align-middle border-left">
                        <a class="btn btn-outline-secondary btn-sm" name="" id="">삭제</a>
                    </td>
                    
                </tr>                
                <tr>
                    <td>
                        <div>
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
                                    <dd>총 0개 상품</dd>
                                    </dl>
                                </div>
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