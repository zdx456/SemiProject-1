# 코딩해조    <img src="img/LOGO.PNG" width="150" height="75">

### 역할

```
● 유성현 : 형상관리 - 코드승인 , 저장소,관리 

● 이기주 : 이슈 및 리스크 관리 - 프로젝트의 예상 위험요소, 오류 상황       
 
● 민유경 : 데이터 베이스 관리 - ERD 수정/관리, 테이블 생성 / 변경/ 관리   

● 이유나 : UI 관리 - 홈페이지 화면에 대한 설계, flow, 예상기능 등에 대한 관리  
 
● 천지연 : UI 관리 - 홈페이지 화면에 대한 설계, flow, 예상기능 등에 대한 관리  

● 송현도 : 일정 및 회의 관리 (프로젝트 매니저) - 전체 진행일정 조율, 관리 담당
```

### 개발 당담

```
● 유성현 : 컨텐츠 리뷰 CRUD , ott CRUD , 통계(가입일, ott컨텐츠 개수)

● 이기주 :  템플릿(해더, 푸터, 햄버거 버튼) , 회원목록 관리 CRUD
 
● 민유경 : 컨텐츠 CRUD (포스터,ott 등록), 통계 (연령별,성별,장르별, ott별)

● 이유나 : 컨텐츠 상세(관심컨텐츠), 리뷰(등록 조회), 컨텐츠 검색(비동기통신 정렬)
 
● 천지연 : 게시판 CRUD(고객센터,1:1문의), 메인페이지(슬라이더, 정렬), 컨텐츠검색(비동기통신 정렬)

● 송현도 : 회원 CRUD (중복검사), Id/Pw 찾기, 마이페이지
```



## 주제

***
### 선택한 콘텐츠를 제공하는 OTT의 종류와 OTT 월별 가격을 비교하는 사이트
***


## 설계

+ 롤모델 사이트 : <https://www.justwatch.com/kr>

+ ERD주소 : <https://www.erdcloud.com/d/jxvri2DP6RiyLcoXe>
 <img src="img/erd.PNG" width="700" height="400">

+ Flow Chart : https://app.diagrams.net/#Hzdx456%2FSemiProject-1%2Fmain%2Fsemi-1.drawio





## 디자인, 초안과 비교


<img src="img/mainDraft.PNG" width="250" height="400">　　　　　<img src="img/main.PNG" width="400" height="400">

<img src="img/searchDraft.PNG" width="250" height="500">　　　　　<img src="img/search.PNG" width="400" height="500">

+ 폰트 : Noto Sans Korean - https://fonts.google.com/noto/specimen/Noto+Sans+KR

+ 모든 초안 디자인 : https://www.figma.com/file/ui61FPwGa3Nb15vadIXM3X/%EC%BD%94%EB%94%A9%ED%95%B4%EC%A1%B0-team-library?node-id=414%3A2


## 주요 기능 구현


| 기능 | 구현 | 기능 내용 |
| ------ | ------ | ----------- |
| 관심콘텐츠 | ☑️ | 하트를 눌러 관심콘텐츠 등록 |
| 포스터 출력 | ☑️ | 콘텐츠 등록시 첨부파일 업로드,다운로드 관리 |
| 검색 | ☑️ | 검색시 비동기통신을 이용한 정렬 |
| 회원정보관리 | ☑️ | 선택한 장르, 가입한Ott 수정과 등록가능 |
| 메인페이지 | ☑️ | 별점순, 관심순, 내가 관심을 선택한 콘텐츠 목록 출력|
| 통계 | ☑️ | 가입일, 성별, 연령별, Ott별 콘텐츠 |
| 리뷰 | ☑️ | 별점 부여, 등록, 수정, 삭제 |
| 게시판 | ☑️ | 1:1문의, 공지, 답변  |
| 콘텐츠 | ☑️ | 콘텐츠 정보, 배우, 제공Ott, 장르, 상세보기(별점,관심컨텐츠,리뷰) |
| Ott | ☑️ | 로고 첨부, 수정, 삭제, 등록  |
| 예고편 | 🔺 | 콘텐츠 상세보기에서 동영상 삽입  |
| 영화 월드컵 | 🔺 | 월드컵 기능을 이용하여 선호 콘텐츠 제공  |


***
## ○참고문서

<https://gist.github.com/ihoneymon/652be052a0727ad59601>

<https://mini-min-dev.tistory.com/56>
