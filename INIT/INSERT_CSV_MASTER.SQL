DECLARE
v_ExistCount NUMBER := 0;
BEGIN

--DELETE RECORDS IF EXIST

	SELECT COUNT(*) INTO v_ExistCount FROM user_tables
	WHERE TABLE_NAME = 'CSV_MASTER';
	
	IF (v_ExistCount = 1 ) THEN
		EXECUTE IMMEDIATE 'DELETE FROM CSV_MASTER';
	END IF;

--STEP-2--START-INSERT DATA TO CSV_MASTER
INSERT INTO CSV_MASTER VALUES(1,'NPA MASTER','');
INSERT INTO CSV_MASTER VALUES(2,'AGENTMST','AGENTM');
INSERT INTO CSV_MASTER VALUES(3,'CUSTOMER','');
INSERT INTO CSV_MASTER VALUES(4,'KYCMAST','');
INSERT INTO CSV_MASTER VALUES(5,'ACCOUNT MASTER','ACCTMAST');
INSERT INTO CSV_MASTER VALUES(6,'CUSTOMER SIGNATURE','');
INSERT INTO CSV_MASTER VALUES(7,'CUSTOMER PHOTO','');
INSERT INTO CSV_MASTER VALUES(8,'CASH_SCR','TRAN');
INSERT INTO CSV_MASTER VALUES(9,'TRNF_SCR','TRAN');
INSERT INTO CSV_MASTER VALUES(10,'TRANSACTION','TRAN');
INSERT INTO CSV_MASTER VALUES(11,'CHEQUE BOOK','');
INSERT INTO CSV_MASTER VALUES(12,'DEPOSIT','DEPOSIT');
INSERT INTO CSV_MASTER VALUES(13,'LOAN DETAILS','LOANMAST');
INSERT INTO CSV_MASTER VALUES(14,'SECURITY DETAILS','');
INSERT INTO CSV_MASTER VALUES(15,'PASS BOOK','');
INSERT INTO CSV_MASTER VALUES(16,'DEPOSIT INTEREST TABLE','');
INSERT INTO CSV_MASTER VALUES(17,'LOAN INTEREST TABLE','');
INSERT INTO CSV_MASTER VALUES(18,'DEMAND DRAFT','');
INSERT INTO CSV_MASTER VALUES(19,'OCC','');
INSERT INTO CSV_MASTER VALUES(20,'ICC','');
INSERT INTO CSV_MASTER VALUES(21,'AREA','CITYMAST');
INSERT INTO CSV_MASTER VALUES(22,'SHARES','SHAREMAST');
INSERT INTO CSV_MASTER VALUES(23,'LOAN GUARANTOR','LOANMAST');
INSERT INTO CSV_MASTER VALUES(24,'BANKMAST','');
INSERT INTO CSV_MASTER VALUES(25,'LOCKER','');
INSERT INTO CSV_MASTER VALUES(26,'SMSMAST','CLIENT CUSTOMER');
INSERT INTO CSV_MASTER VALUES(27,'EMPLOYEE','');
INSERT INTO CSV_MASTER VALUES(28,'VALUER','');
INSERT INTO CSV_MASTER VALUES(29,'COMMODITY','');
INSERT INTO CSV_MASTER VALUES(30,'USERS','');
INSERT INTO CSV_MASTER VALUES(31,'ADDRESS_PROOF','');
INSERT INTO CSV_MASTER VALUES(32,'ID_PROOF','');
INSERT INTO CSV_MASTER VALUES(33,'INTHIST','');
INSERT INTO CSV_MASTER VALUES(34,'SI','');
INSERT INTO CSV_MASTER VALUES(35,'IVST_DET','');
INSERT INTO CSV_MASTER VALUES(36,'INSU_DET','');
INSERT INTO CSV_MASTER VALUES(37,'DEAFFUND','');
INSERT INTO CSV_MASTER VALUES(38,'IW_NTRT','');
INSERT INTO CSV_MASTER VALUES(39,'OW_NTRT','');
INSERT INTO CSV_MASTER VALUES(40,'STCKSTMT','');
INSERT INTO CSV_MASTER VALUES(41,'BILLTRAN','');
INSERT INTO CSV_MASTER VALUES(42,'ATTACH','');
INSERT INTO CSV_MASTER VALUES(43,'OTWD_SCR','');
INSERT INTO CSV_MASTER VALUES(44,'INWD_SCR','');
INSERT INTO CSV_MASTER VALUES(45,'TDSRECOV','');
INSERT INTO CSV_MASTER VALUES(46,'TDSMAST','');
INSERT INTO CSV_MASTER VALUES(47,'LOAN_RECEIPT','');
INSERT INTO CSV_MASTER VALUES(99,'UPDATES','');

COMMIT;
DBMS_OUTPUT.PUT_LINE ('....built CSV_MASTER with default records.....');
DBMS_OUTPUT.PUT_LINE ('....NOTE - If required, you need to modify CSV_MASTER before calling the conversion process.....');
--STEP-2--END-INSERT DATA TO CSV_MASTER
DBMS_OUTPUT.PUT_LINE ('....END...constructing CSV_MASTER.....');
END;
/
