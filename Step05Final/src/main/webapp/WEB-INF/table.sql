--사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate DATE
);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
	saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER NOT NULL, -- 파일의 크기
	regdate DATE
);

CREATE SEQUENCE board_file_seq;

--페이징 처리를 위한 셀렉트 문
SELECT *
FROM
	(SELECT result1.*, ROWNUM AS rnum
	FROM
		(SELECT num, writer, title, savefilename, regdate
		FROM board_file
		ORDER BY num DESC) result1)
WHERE rnum BETWEEN 1 AND 5;

--게시글을 저장할 테이블
CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY, -- 글번호
	writer VARCHAR2(100) NOT NULL, -- 작성자
	title VARCHAR2(100) NOT NULL, -- 글 제목
	content CLOB, -- 글 내용 / 자바에서 취급할 때는 동일한 기능을 하고, 용량이 VARCHAR2에 비해 더 클 뿐이다.
	viewCount NUMBER, -- 조회수
	regdate DATE 
);

-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_seq NOCACHE;