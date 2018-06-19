/*
	alteracao 1 sem commit
	alteracao com edvald
*/
CREATE OR REPLACE PROCEDURE TESTE_FELIPE_3 (nNrCarga NUMBER, o_cursor OUT NUMBER) IS



BEGIN
	
	SELECT MAX(NREQUISICAO) + 1 INTO o_cursor FROM REQUISICAO_NF;
		
	DBMS_OUTPUT.PUT_LINE('PASSOU '|| o_cursor );
END;
/
