--직접 만들어서 join 연산을 해보자

--무엇을 만들지 생각 서비스 기능
--사원 부서  업무로파악 : ex>erp시스템
--엔터티 : 현실세계의 객체(사람,물건) 컴퓨터세계   ==>table
--                                            ==>column
--애트리뷰트(=속성) : 이름 사변 급여

--사원은 부서에 포함된다(관계)    vs    글      :게시판에 (포함된다) vs   고객     : 구매한다
--                                 작성자
--부서는 사원을 포함한다(관계)    vs    게시판   :        포한한다 vs  상품      :구매되어진다


--현실의 업무를 컴퓨터 상으로 옮기는 과정 <-->모델링
-- 시스템을 구동하는 프로그램을 제작, UI작성 :개발자


--글 엔터티 <--> post 테이블을 작성




create TABLE post(
        post_id NUMBER PRIMARY KEY,
        post_title VARCHAR2(30),
        post_writer NUMBER NOT NULL,
        post_date DATE DEFAULT SYSDATE
);        





CREATE TABLE WRITER(
        writer_id NUMBER PRIMARY KEY,
        writer_name VARCHAR2(30)NOT NULL,
        writer_date DATE DEFAULT SYSDATE,
        writer_email VARCHAR2(50)
);



ALTER TABLE post
ADD CONSTRAINT post_writer_fk FOREIGN KEY(post_writer) REFERENCES writer(writer_id); 




INSERT INTO writer
VALUES(1,'홍길동',SYSDATE,'school111@naver.com');
INSERT INTO writer
VALUES(2,'김길동',SYSDATE,'school222@naver.com');
INSERT INTO writer
VALUES(3,'박길동',SYSDATE,'school333@naver.com');


SELECT *
FROM   writer;







INSERT INTO post
VALUES(0001,'오라클 dbms에 학습하기',1,SYSDATE);

INSERT INTO post
VALUES(0002,'혼자공부하는 java심화',2,SYSDATE);

INSERT INTO post
VALUES(0003,'1인 개발자의 공부법',3,SYSDATE);




SELECT  p.post_id, p.post_title,
        w.writer_name
FROM   post p, writer w 
WHERE    p.post_writer =w.writer_id;
























