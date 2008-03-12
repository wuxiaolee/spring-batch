-- Autogenerated: do not edit this file
DROP TABLE  BATCH_STEP_EXECUTION_CONTEXT ;
DROP TABLE  BATCH_STEP_EXECUTION ;
DROP TABLE  BATCH_JOB_EXECUTION ;
DROP TABLE  BATCH_JOB_PARAMS ;
DROP TABLE  BATCH_JOB_INSTANCE ;

DROP SEQUENCE  BATCH_STEP_EXECUTION_SEQ ;
DROP SEQUENCE  BATCH_JOB_EXECUTION_SEQ ;
DROP SEQUENCE  BATCH_JOB_SEQ ;

-- Autogenerated: do not edit this file
CREATE TABLE BATCH_JOB_INSTANCE  (
	JOB_INSTANCE_ID NUMBER(38)  PRIMARY KEY ,  
	VERSION NUMBER(38),  
	JOB_NAME VARCHAR(100) NOT NULL , 
	JOB_KEY VARCHAR(2500)
);

CREATE TABLE BATCH_JOB_EXECUTION  (
	JOB_EXECUTION_ID NUMBER(38)  PRIMARY KEY ,
	VERSION NUMBER(38),  
	JOB_INSTANCE_ID NUMBER(38) NOT NULL,
	START_TIME TIMESTAMP, 
	END_TIME TIMESTAMP ,
	STATUS VARCHAR(10),
	CONTINUABLE CHAR(1),
	EXIT_CODE VARCHAR(20),
	EXIT_MESSAGE VARCHAR(2500),
	constraint JOB_INSTANCE_EXECUTION_FK foreign key (JOB_INSTANCE_ID)
	references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
);
	
CREATE TABLE BATCH_JOB_PARAMS  (
	JOB_INSTANCE_ID NUMBER(38) NOT NULL ,
    TYPE_CD VARCHAR(6) NOT NULL ,
	KEY_NAME VARCHAR(100) NOT NULL , 
	STRING_VAL VARCHAR(250) , 
	DATE_VAL TIMESTAMP ,
	LONG_VAL NUMBER(38) ,
	DOUBLE_VAL DOUBLE PRECISION,
	constraint JOB_INSTANCE_PARAMS_FK foreign key (JOB_INSTANCE_ID)
	references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
);
	
CREATE TABLE BATCH_STEP_EXECUTION  (
	STEP_EXECUTION_ID NUMBER(38)  PRIMARY KEY ,
	VERSION NUMBER(38) NOT NULL,  
	STEP_NAME VARCHAR(100) NOT NULL,
	JOB_EXECUTION_ID NUMBER(38) NOT NULL,
	START_TIME TIMESTAMP NOT NULL , 
	END_TIME TIMESTAMP ,  
	STATUS VARCHAR(10),
	COMMIT_COUNT NUMBER(38) , 
	ITEM_COUNT NUMBER(38) , 
	CONTINUABLE CHAR(1),
	EXIT_CODE VARCHAR(20),
	EXIT_MESSAGE VARCHAR(2500),
	constraint JOB_EXECUTION_STEP_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
);
	
CREATE TABLE BATCH_STEP_EXECUTION_CONTEXT  (
	STEP_EXECUTION_ID NUMBER(38) NOT NULL ,
    TYPE_CD VARCHAR(6) NOT NULL ,
	KEY_NAME VARCHAR(1000) NOT NULL , 
	STRING_VAL VARCHAR(1000) , 
	DATE_VAL TIMESTAMP ,
	LONG_VAL VARCHAR(10) ,
	DOUBLE_VAL DOUBLE PRECISION ,
    OBJECT_VAL BLOB,
	constraint STEP_EXECUTION_CONTEXT_FK foreign key (STEP_EXECUTION_ID)
	references BATCH_STEP_EXECUTION(STEP_EXECUTION_ID)
);

CREATE SEQUENCE BATCH_STEP_EXECUTION_SEQ;
CREATE SEQUENCE BATCH_JOB_EXECUTION_SEQ;
CREATE SEQUENCE BATCH_JOB_SEQ;
