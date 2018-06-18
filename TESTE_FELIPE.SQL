SET SERVEROUTPUT ON
DECLARE
	
	CURSOR meuCursor IS
		SELECT * FROM clientes WHERE codvendedor = &codvendedor;
	
	TYPE clientes_table IS TABLE OF
		meuCursor%ROWTYPE 
		INDEX BY PLS_INTEGER;
	
	meusClientes clientes_table;
	cont NUMBER:=1;
	
BEGIN	
	FOR i IN meuCursor LOOP		
		
		meusClientes(cont) := i;	
		cont:=cont+1;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('EXISTEM: ' || meusClientes.COUNT);	
	
	FOR a IN meusClientes.FIRST..meusClientes.LAST LOOP
		IF meusClientes.EXISTS(a) THEN
			DBMS_OUTPUT.PUT_LINE(a ||' ID: ' || meusClientes(a).codcliente || ' razao: '|| meusClientes(a).razao_social);	
		END IF;	
		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('COUNT: ' || meusClientes.COUNT);	
	DBMS_OUTPUT.PUT_LINE('PRIMEIRO: ' || meusClientes.FIRST  || ' - '|| meusClientes(meusClientes.FIRST).razao_social);
	DBMS_OUTPUT.PUT_LINE('ANTERIOR: ' || meusClientes.PRIOR(meusClientes.LAST)  || ' - '|| meusClientes(meusClientes.PRIOR(meusClientes.LAST)).razao_social);
	DBMS_OUTPUT.PUT_LINE('ULTIMO: ' || meusClientes.LAST || ' - '|| meusClientes(meusClientes.LAST).razao_social);
	
	meusClientes(meusClientes.FIRST).razao_social := 'razao social da Mili';
	
	DBMS_OUTPUT.PUT_LINE('PRIMEIRO: ' || meusClientes.FIRST  || ' - '|| meusClientes(meusClientes.FIRST).razao_social);
	
	IF (meusClientes.EXISTS(meusClientes.FIRST)) THEN
		RAISE_APPLICATION_ERROR(-20202,'EXISTE O PRIMEIRO CLIENTE !!!!!!!!!!!!!!1');
	END IF;	
END;	
/

--SELECT * FROM CLIENTES WHERE CODCLIENTE = 19143 ;
