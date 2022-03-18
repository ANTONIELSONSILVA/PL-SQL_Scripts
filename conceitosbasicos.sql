-- Conceitos básicos
-- Aula 2 de BD3 

-- comentário
/* comentário */



CREATE TABLE cliente(

	id NUMBER(7),
	nome varchar2(30)

);


INSERT INTO cliente VALUES (201, 'Alan');
INSERT INTO cliente VALUES (202, 'Bob');
INSERT INTO cliente VALUES (203, 'Carlos');

select * from cliente;


-- Para usar DBMS_OUTPUT.PUT_LINE USE SET SERVEROUTPUT ON

Declare
	v_nome varchar2(30);
Begin
	-- Seleciona o campo nome na tabela clientes e colocar dentro da variável
	-- v_nome 
	Select nome INTO v_nome From cliente where id = 201;
	DBMS_OUTPUT.PUT_LINE('O nome do cliente é ' || v_nome);
End;



/*

DECLARE (OPCIONAL)
	- Variáveis, Cursore e exeções definidas pelo usuário

BEGIN (OBRIGATÓRIO)
	- Instruções SQL
	- Instruções PL-SQL

EXCEPTION (OPCIONAL)
	- Ações a serem executadas quando ocorrerem exceções

END; (OBRIGATÓRIO)

*/




Declare
	v_id number := 201;
	v_nome varchar2(30);
Begin
	Select nome INTO v_nome From cliente where id = v_id;
	DBMS_OUTPUT.PUT_LINE('O nome do cliente é ' || v_nome);
End;


-- Variáveis são declaradas e inicializadas (opcionalmente) na seção declarativa

Declare
	v_id number;
	v_nome varchar2(30);
Begin
	v_id := 201;
	Select nome INTO v_nome From cliente where id = 201;
	DBMS_OUTPUT.PUT_LINE('O nome do cliente é ' || v_nome);
End;



Declare 
	v_nome varchar2(30);
	v_idade integer := 22;
Begin 
	select nome INTO v_nome From cliente Where id = 203;
	DBMS_OUTPUT.PUT_LINE('O nome do cliente é ' || v_nome);
	DBMS_OUTPUT.PUT_LINE('A idade é de ' || v_idade);
End;


//===========================================================================================


-- Declaração de Variáveis

V_data DATE;
V_deptno;
V_location VARCHAR2(13) := 'Atlanta';


-- CONSTANTE

C_CONST CONSTANT NUMBER := 1400;




Declare
    v_myName VARCHAR2(20) := 'Steve';
BEGIN
    DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName);
    v_myName := 'John';
    DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName);
End;



Declare
    v_myName VARCHAR2(20) := 'Steve';
BEGIN
    v_myName := 'John';
    DBMS_OUTPUT.PUT_LINE('My name is: ' || v_myName);
End;






-- Delimitadores em Literais d e String


Declare
	v_event VARCHAR2(15);
BEGIN
	v_event := q'!Father's day!';
	DBMS_OUTPUT.PUT_LINE('3rd Sunday in june is: ' || v_event);
	v_event := q'[Mother's day]';
	DBMS_OUTPUT.PUT_LINE('2nd Sunday in may is: ' || v_event);
End;

/*
	SAIDA

Statement processed.
3rd Sunday in june is: Father's day
2nd Sunday in may is: Mother's day

*/


 -- TYPE

 V_BALANCE NUMBER(7, 2);
 V_MIN_BALANCE    V_BALANCE%TYPE := 1000;




 -- VARIÁVEIS BOOLEANAS

 -- Somente os valores TRUE, FALSE e NULL podem ser atribuídos a uma variável
 --	booleana.

 V_VALID BOOLEAN NOT NULL := TRUE;



-- Obter o tamanho de uma string

V_DESC_SIZE INTEGER(5);
V_PROD_DESCRIPTION VARCHAR2(70) := 'YOU CAN USE THIS ...'

V_DESC_SIZE := LENGTH(V_PROD_DESCRIPTION);



-- Blocos Aninhados
	-- FUNÇÃO DENTRO DE FUNÇÃO

	DECLARE
		V_OUTER_VARIABLE VARCHAR2(20) := 'GLOBAL VARIABLE';
	BEGIN

			DECLARE
				V_INNER_VARIABLE VARCHAR2(20) := 'LOCAL VARIABLE';
			BEGIN
				DBMS_OUTPUT.PUT_LINE(V_INNER_VARIABLE);
				DBMS_OUTPUT.PUT_LINE(V_OUTER_VARIABLE);
			END;

		DBMS_OUTPUT.PUT_LINE(V_OUTER_VARIABLE);

	END;
