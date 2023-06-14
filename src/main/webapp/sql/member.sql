

/* Create Tables */

CREATE TABLE member
(
	id nvarchar2(20) NOT NULL,
	pwd nvarchar2(30) NOT NULL,
	nickname nvarchar2(20) NOT NULL,
	gender nvarchar2(10) NOT NULL,
	birth nvarchar2(20) NOT NULL,
	phone nvarchar2(20) NOT NULL,
	regdate date DEFAULT SYSDATE,
	PRIMARY KEY (id)
);



