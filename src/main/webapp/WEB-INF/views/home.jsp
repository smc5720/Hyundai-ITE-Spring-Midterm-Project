<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
li {
	list-style: none;
}
/* title */
.pageTitle {
	margin: 90px 0 28px;
	text-align: center;
	font: 36px/1.1 "notoM";
	color: #222;
}

.contWrap {
	min-width: 1024px;
	max-width: 1280px;
	margin: 0 auto;
}
/* 이벤트 */
.eventMidBanner {
	margin: 16px -8px 0;
}

.eventMidBanner:after {
	content: "";
	display: block;
	clear: both;
}

.eventMidBanner .banner {
	float: left;
	width: 50%;
}

.eventMidBanner .banner a {
	position: relative;
	display: block;
	margin: 0 8px;
	height: 260px;
}

.eventMidBanner .banner .img {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	overflow: hidden;
}

.eventMidBanner .banner .img img {
	float: right;
}
</style>
<hr />
<div>
	<section id="contents">
		<h2 class="pageTitle">이벤트</h2>
		<div class="contWrap">
			<div class="eventMidBanner" id="eventMidBanner"></div>
		</div>
		<script>
			$(window).ready(function () {
				$.ajax({
					url: "${pageContext.request.contextPath}/event/getEventList"
				}).done((data) => {
					if (data.result === "loadFail") {
						window.alert("이벤트를 찾을 수 없습니다.");						
						$('#eventMidBanner').html('<div class="spinner-border"></div>');
					} else {
						const events= data.events;
						let events_html ="";
						for(let i=0; i< events.length; i++){
							let event = events.at(i);
							let event_html = '<a href="/event/eventdetail?eno='+ event.eno +'"><div class="card banner p-3 border-0">';
							event_html += '<img class="card-img-top" id="event-img" src="${pageContext.request.contextPath}/resources/images/'+ event.eimage +'" alt="" />';
							event_html += '<div class="card-body">';
							event_html += '<h5 class="card-title text-secondary">'+ event.ename +'</h5>';
							event_html += '<p class="card-text"><span id="event-content text-secondary">'+ event.econtent +'</span></p>';
							event_html += '<p class="card-text"><small class="text-muted">이벤트기간 : ';
							event_html += '<span id="event-period">'+event.estartdate+' ~ '+event.eenddate+'</span></small>';
							event_html += '</p></div></div></a>';
							
							events_html += event_html
						}
						
						$('#eventMidBanner').html(events_html);
					}
				});
			});
		</script>
	</section>
	<section id="contents">
		<h2 class="pageTitle">About Team 5</h2>
		<div style="text-align: center;">
			<div style="display: inline-block; padding: 16px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img1.jpg"
					style="width: 606.5px" />
			</div>
			<div style="display: inline-block; padding: 16px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img2.jpg"
					style="width: 606.5px" />
			</div>
		</div>
		<div style="text-align: center;">
			<div style="display: inline-block; padding: 16px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img3.jpg"
					style="width: 606.5px" />
			</div>
			<div style="display: inline-block; padding: 16px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img4.jpg"
					style="width: 606.5px" />
			</div>
		</div>
		<div style="text-align: center;">
			<div style="display: inline-block; padding: 16px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img5.jpg"
					style="width: 606.5px" />
			</div>
			<div style="display: inline-block; padding: 16px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img6.jpg"
					style="width: 606.5px" />
			</div>
		</div>
		<div style="margin-top: 30px"></div>
	</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>