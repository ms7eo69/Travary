

/* Create Sequences */

CREATE SEQUENCE seq_member_identifier INCREMENT BY 19 START WITH 1;



/* Create Tables */

CREATE TABLE member
(
	id nvarchar2(20) NOT NULL,
	pwd nvarchar2(30) NOT NULL,
	nickname nvarchar2(20) NOT NULL,
	gender nvarchar2(10) NOT NULL,
	birth nvarchar2(20) NOT NULL,
	phone nvarchar2(20) NOT NULL,
	regidate date DEFAULT SYSDATE,
	profile_link nvarchar2(200),
	key nvarchar2(50) NOT NULL,
	identifier number DEFAULT 0 NOT NULL,
	PRIMARY KEY (id)
);



