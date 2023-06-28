DROP TABLE tbl_memo;

CREATE TABLE tbl_memo (
    m_seq	NUMBER	NOT NULL	PRIMARY KEY,
    m_writer	nVARCHAR2(20),
    m_date	VARCHAR2(10),
    m_subject	nVARCHAR2(20)	NOT NULL,
    m_content	nVARCHAR2(400)		
);

CREATE SEQUENCE seq_memoList
START WITH 1 INCREMENT BY 1;