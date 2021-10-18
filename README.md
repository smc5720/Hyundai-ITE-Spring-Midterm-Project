# Spring을 활용한 인터넷 쇼핑몰 개발

### 🗨️ **개요**

---

- 현대 IT&E 개발자 양성과정 도중 진행한 첫번째 프로젝트이다.
- 더 한섬(THE HANDSOME)에서 제공받은 상품 데이터를 활용하여 쇼핑몰 홈페이지를 제작한다.
<br/>

### 🗓️ 개발기간/인원

---

- 2021.09 ~ 2021.10 / 2주
- 4인 프로젝트
<br/>

### ⚙️ 개발환경

---

- Java
- JSP
- Spring
- Mybatis
- Oracle
<br/>

### 🗞️ 담당 역할

---

🍉 **서민철 (팀장)**

- 전체적인 API 로직 개발
- 이벤트 참여 시 DB Lock 방지 로직 개발
- 브랜드 및 상품 카테고리 기능 개발
- 브랜드 및 상품 카테고리 별 상품 목록 페이지 개발
- 상품별 상세보기 페이지 및 기능 개발
- 쇼핑백(장바구니) 페이지 및 기능 개발
- 주문 결제 페이지 및 기능 개발
- '기본 배송지로 설정', '최근 배송지로 설정' 기능 개발
<br/>

🍊 **변용혁**

- 전체적인 API 로직 개발
- 이벤트 목록 생성 및 불러오기 기능 개발
- 이벤트 상세정보 페이지 개발
- 이벤트 참여 시 DB Lock 방지 로직 개발
- 쿠폰 목록 생성 및 불러오기 기능 개발
- 상품별 상세보기 페이지 및 기능 개발
- 쇼핑백(장바구니) 페이지 및 기능 개발
- 동시 접속자 기능 개발
<br/>

🍋 **서회형**

- 브랜드 및 상품 카테고리 기능 개발
- Spring Security 기능 연동
- 권한별 접근 가능한 페이지 범위 설정
- 이벤트 참여 시 DB Lock 방지 로직 개발
- 상품별 상세보기 페이지 및 기능 개발
<br/>

**🍎 이수정**

- 이벤트 목록 생성 및 불러오기 기능 개발
- 이벤트 참여 시 DB Lock 방지 로직 개발
- 상품별 상세보기 페이지 및 기능 개발
- 쇼핑백(장바구니) 페이지 및 기능 개발
- 주문 내역 확인 페이지 및 필터 기능 개발
<br/>

### ⚡ 설명

---

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fdd196f5-55f7-4aa9-8ea0-180fc7063fc8/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T095227Z&X-Amz-Expires=86400&X-Amz-Signature=a030d72284200470f9e263ff02386e1ce2c870f9a2c943888c63e02cb1b31c83&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 과제를 해결하기 위해 한섬 페이지를 참고했습니다.
- 위 사진은 한섬 페이지를 분석하고 구현할 화면을 역할 별로 나누기 위해 작성한 와이어 프레임입니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/d9f744ab-f70d-489c-bb78-b01cb194a86b/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103545Z&X-Amz-Expires=86400&X-Amz-Signature=f2bcfeb6fba84d89562f6288be9bc7e3c0ec40756614e75d7034c6a24614f9b4&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 한섬에서 전달 받은 데이터를 관리하기 위해 설계한 ERD입니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/d6ffad05-b467-444c-9c63-bad9ed86c7ce/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103616Z&X-Amz-Expires=86400&X-Amz-Signature=6797da3156c059624916adf31b248edea4f3088c106ce8bc268a68a0646ffa96&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 약 2주 간의 개발 일정을 정리한 계획표입니다.
    - 초반 3일: DB 테이블 설계 및 화면 구현
    - 대부분: 필수 기능 구현
    - 마지막 2일: 간단한 편의기능 추가 및 버그 수정
- 프로젝트의 전체적인 형상 관리는 git을 사용했습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/20c53c58-8a37-4c5f-aa02-56cf3c8b4304/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103630Z&X-Amz-Expires=86400&X-Amz-Signature=d2320bd9e773ece8f5eb3cc773e90d1f829a7ed77093d9d6dc65afba91e0d159&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 헤더는 로그인 버튼과 로고, 상품 목록으로 이동할 수 있는 네비게이션 바를 포함합니다.
- 마우스를 올리면 드롭다운 형태로 하위 분류가 나타납니다.
    - 이때 하위 카테고리 정보는 ajax를 활용하여 비동기로 가져오도록 설계했습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/2b3582de-2cb4-4e12-81ab-05f90ad18c63/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103645Z&X-Amz-Expires=86400&X-Amz-Signature=0a9dd3aec551cf1bb27e660ce3b48ae2b4ff73b4d281b0163ae10f0307cf9deb&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 이벤트를 클릭하면 이벤트에 참여할 수 있는 화면이 나타납니다.
- 선착순 이벤트 특성상 짧은 시간 내에 많은 유저가 동시에 접속하기 때문에 DB Lock을 발생시킬 수 있습니다.
    - 이 점을 해결하기 위해 Thread Pool에 1개의 Thread를 설정해주고 접속하는 유저들에게 동기적으로 쿠폰을 발행해주도록 설계했습니다.
    - 또한 유저에게 쿠폰을 지급하고, DB에 저장된 쿠폰의 잔여량을 감소시켜주는 과정 전체를 트랜잭션으로 설정해줬습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b499af47-989a-4cae-83d6-fc5ac4adafaf/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103702Z&X-Amz-Expires=86400&X-Amz-Signature=8591d1a1811835722998373cda5e56caf1a67b772212986e5f652fcc3f9562bc&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- Spring Security를 사용해서 로그인을 구현했습니다.
- Security가 제공하는 기능이 추후 개발할 프로젝트까지 고려했을 때 확장성이 좋다고 판단되어 사용했습니다.
- 회원마다 회원번호를 추가적으로 부여해 회원의 ID 대신 회원번호를 참조하는 방식으로 설계하여 보안 이슈를 신경을 썼습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/5a1d192a-8b1d-4baf-a6d9-4112d2107857/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103716Z&X-Amz-Expires=86400&X-Amz-Signature=b798bd77bc015960cbd23335468dd68a7fc6900aceaf8aeeb7983e8fc65d03ab&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 네비게이션 바의 메뉴를 클릭하면 해당 카테고리에 해당하는 상품들이 쭉 보여집니다.
- 상품 목록은 ajax를 이용하여 비동기적으로 가져옵니다.
- 페이징 기능으로 한 페이지당 최대 12개의 상품만을 출력하여 상품 전시 로딩 시간을 감소시켜줬습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/617c1b38-e66f-4597-bb16-6c790f7dd769/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103729Z&X-Amz-Expires=86400&X-Amz-Signature=0d09a487392933b5d7b517e02e7f9c0f47112458cd2d59d32db7fecd170b00f8&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 상품을 클릭했을 때 보이는 상품 상세정보 페이지입니다.
- 상품이 보유하고 있는 색깔과 사이즈가 버튼으로 보여집니다.
    - 여기서 색깔과 사이즈를 선택할 경우 해당 상품의 잔여 수량이 보이게 됩니다.
- 이미지를 보시면 메세지 박스가 보이실텐데, 현재 같은 제품을 보고 있는 고객의 수가 출력됩니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f85a0487-07e1-40fd-a557-1c37f92f66e9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103743Z&X-Amz-Expires=86400&X-Amz-Signature=689797649acd023747fa3c2eddf03153b5289af6ab75f64d5cffd98d86c455ae&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 장바구니 역할을 하는 쇼핑백 페이지입니다.
- 이곳에서 상품의 수량, 사이즈, 컬러를 변경할 수 있고 삭제도 가능합니다.
- 왼쪽의 체크박스를 활용하여 구매할 아이템을 선택하여 결제화면으로 넘어갈 수 있습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b22708a6-2acf-4ad6-bf8f-e038850e24c2/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103756Z&X-Amz-Expires=86400&X-Amz-Signature=c832c68636157c53c702221205e66af080ba673b24ac274132c5593a99337e4e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 상품 주문이 가능한 결제 페이지입니다.
- 구매하려는 상품 목록을 화면에 보여줍니다.
- 배송지를 입력하는 폼은 다음에서 제공하는 우편번호 API를 활용해서 우편번호 조회가 가능하도록 설계했습니다.
- 배송지 테이블에 접근하여 사용자의 기본 배송지 또는 최근 배송지를 가져오는 기능을 개발했습니다.
- 상품을 결제하기 위해 DB에서 실행되는 일련의 과정들을 트랜잭션으로 묶어줬습니다.
- 결제가 완료되면 해당 항목은 쇼핑백 리스트에서 제거됩니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/688573d7-6f6f-4ca2-b303-bb5d48371384/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103806Z&X-Amz-Expires=86400&X-Amz-Signature=ed546976d1579d8055586b4c1a3a91fb0950791580bf34efdcc1de04d48bc88f&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 마지막으로 유저의 주문내역을 확인할 수 있는 주문 목록 페이지입니다.
- 상품 코드 또는 상품 이름으로 검색할 수 있는 필터 기능을 추가했습니다.
    - 페이징 기능을 사용할 수 있습니다.
<br/>
    

### 🎖️ 이슈 해결

---

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/717cb9a4-6c5c-4c46-8e02-8b34962713e9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103829Z&X-Amz-Expires=86400&X-Amz-Signature=19c4edb5dbf3ee06d34d9cd2a29a9e725df663b237fc0bca8313c079bbc85b3f&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 저희 팀이 개발한 웹 어플리케이션은 MPA 방식으로 작동합니다.
- 모든 페이지는 헤더를 포함하기 때문에 페이지 이동을 할때마다 브랜드/카테고리 정보를 매번 DB에서 가져와야 하는 문제가 있었습니다.
- 이 부분을 해결하기 위해 브랜드와 카테고리 정보를 첫 로딩 이후 세션에 저장하고 사용하도록 만들었습니다.
- 그러나 이 또한 사용자가 많아질수록 서버에 부하가 걸릴 수 있다는 단점이 있었습니다.
- 그래서 static 변수에 브랜드와 카테고리 값을 저장하는 방식을 사용해서 서버 부하를 감소시키도록 했습니다.
<br/>

![Untitled](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/917cf673-1820-4c4b-9990-b319d0986566/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211016T103840Z&X-Amz-Expires=86400&X-Amz-Signature=a91640490eaaaf517dc58e2ca06c89898350c9846df7cb328a5e1bcde3c66ffb&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- 브랜드 중에 특수기호를 포함한 브랜드명이 있었는데, 이 때문에 a 태그 내부에서 오류가 발생하는 문제가 있었습니다.
- 이 부분을 해결하기 위해서 서버 설정파일에 특수문자를 파라미터로 사용할 수 있게 만들어주는 설정을 추가했습니다.
