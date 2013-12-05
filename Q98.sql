SET FEEDBACK OFF
SET LINESIZE 200
SET PAGESIZE 1000

DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE emp CASCADE CONSTRAINTS;

CREATE TABLE dept (
	deptno NUMBER,
	dname VARCHAR2(10),
	CONSTRAINT pk_dept PRIMARY KEY (deptno)
);

CREATE TABLE emp (
	empno NUMBER,
	ename VARCHAR2(10),
	deptno NUMBER,
	CONSTRAINT pk_empno PRIMARY KEY (empno),
	CONSTRAINT ak_ename UNIQUE (ename),
	CONSTRAINT fk_deptno FOREIGN KEY (deptno) 
		REFERENCES dept (deptno)
);

INSERT INTO dept VALUES(10, 'IT');
INSERT INTO dept VALUES(20, 'HR');

INSERT INTO emp VALUES(1, 'KING', 10);
INSERT INTO emp VALUES(2, 'HARI', 20);

COMMIT;

col CONSTRAINT_NAME for a30
col R_CONSTRAINT_NAME for a10
col TABLE_NAME for a10
col INDEX_NAME for a30
col STATUS for a10

select CONSTRAINT_NAME,R_CONSTRAINT_NAME,TABLE_NAME,INDEX_NAME,CONSTRAINT_TYPE,STATUS   
	from user_constraints where table_name   
	in('EMP','DEPT');
	
drop table emp;

col OBJECT_NAME for a30
col ORIGINAL_NAME for a30
col OPERATION for a10
col TYPE for a10
col DROPTIME for a20

select OBJECT_NAME,ORIGINAL_NAME,OPERATION,TYPE ,DROPTIME from recyclebin;  

select CONSTRAINT_NAME,R_CONSTRAINT_NAME,TABLE_NAME,INDEX_NAME,CONSTRAINT_TYPE,STATUS   
	from user_constraints where table_name   
	in('EMP','DEPT');

flashback table emp to before drop;

select CONSTRAINT_NAME,R_CONSTRAINT_NAME,TABLE_NAME,INDEX_NAME,CONSTRAINT_TYPE,STATUS   
	from user_constraints where table_name   
	in('EMP','DEPT');

INSERT INTO emp VALUES(2, 'HARI', 20);
INSERT INTO emp VALUES(3, 'EDWIN', 55);

SELECT * FROM emp;