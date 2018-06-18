CREATE OR REPLACE PROCEDURE TESTE_FELIPE_2 (o_cursor IN OUT SYS_REFCURSOR) IS
BEGIN
	OPEN o_cursor FOR
		SELECT 
			A.ESCC_PRAZO_PGTO , 
			A.ESCC_COD_BANCO , 
			A.ESCC_COD_AGENCIA, 
			A.ESCC_DIGITO_AGENCIA , 
			A.ESCC_NUMERO_CC , 
			A.ESCC_DIGITO_CC , 
			A.ESCC_VALOR_FRETE,  
			A.ESCC_ORDEM, 
			A.ESCC_FORMA_PAGAMENTO, 
			A.ESCC_FRETE, 
			A.ESCC_TIPO_PRECO,	
			A.ESCC_VALIDADE, 
			A.ESCC_OBS, 
			A.CTFOR_CODIGO, 
			A.ESCC_STATUS, 
			E.CTFUN_CODIGO, 
			D.CTFUN_NOME, 
			D.EMAIL, 
			C.RAZAO_SOCIAL, 
			C.EMAIL EMAILFORN, 
			C.CTFOR_CGCCPF, 
			B.IDSETOR, 
			B.CODAREA, 
			B.CODLINHA, 
			B.CODPRODUTO, 
			B.ESPC_VLR_UNITARIO, 							
			B.ESPC_IPI, 
			B.ESPC_ICMS, 
			B.ESPC_MARCA, 
			B.ESPC_PRAZO_ENTREGA, 
			decode(G.descricao_produto, NULL, F.descricao, G.descricao_produto )  || ' - ' || F.UNIDADE  AS DESCRICAO_PRODUTO, 
			B.UNIDADE, 
			NVL(B.ESPC_QTDE,0) AS QTDE, 
			E.ESSC_GRAU_URGENCIA, 
			B.ESSC_ORDEM, 	
			B.ESPC_ORDEM, 
			B.ESPC_COMPRA_CONSERTO,
			NVL(B.ESPC_STATUS,0) STATUS_PRODUTO, 
			H.GERA_CREDITO_ICMS, 
			H.GERA_CREDITO_IPI 
		FROM 
			MASTER.ES_COTACAO_COMPRA A, 
			MASTER.ES_PRODUTO_COTACAO B, 
			MASTER.CT_FORNECEDOR C, 
			MASTER.CT_FUNCIONARIO D, 
			MASTER.ES_SOLICITACAO_COMPRA E, 
			MASTER.Produtos F, 
			MASTER.ES_PRODUTO_SOLICITACAO G, 
			MASTER.CT_PRODUTO_SERVICO_TIPO_ITEM H 
		WHERE 
			A.ESCC_ORDEM = B.ESCC_ORDEM 
		AND 
			B.IDSETOR = F.IDSETOR(+) 
		AND 
			B.CODAREA = F.CODAREA(+) 
		AND 
			B.CODLINHA = F.CODLINHA(+) 
		AND 
			B.CODPRODUTO = F.CODPRODUTO(+) 
		AND 
			A.CTFOR_CODIGO = C.CTFOR_CODIGO 
		AND 
			E.CTFUN_CODIGO = D.CTFUN_CODIGO (+) 
		AND 
			E.IDSETOR = D.IDSETOR (+) 
		AND 
			B.ESSC_ORDEM = E.ESSC_ORDEM 
		AND 
			A.ESCC_ORDEM = 88481
		AND 
			A.CTFOR_CODIGO =  10619
		AND 
			B.IDSETOR = G.IDSETOR 
		AND 
			 B.CODAREA = G.CODAREA 
		AND 
			B.CODLINHA = G.CODLINHA 
		AND 
			B.CODPRODUTO = G.CODPRODUTO 
		AND 
			B.ESSC_ORDEM = G.ESSC_ORDEM 
		AND 	F.CODIGO_TIPO_ITEM = H.CODIGO_TIPO_ITEM	
		AND 
			NVL(B.ESPC_STATUS,0) NOT IN (3,4);
		
	DBMS_OUTPUT.PUT_LINE('PASSOU');
END;
/
