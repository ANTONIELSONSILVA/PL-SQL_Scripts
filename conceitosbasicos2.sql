-- TIPO DE USO DE VARIÁVEIS

CREATE TABLE cliente(id NUMBER(7), nome varchar2(30) );

INSERT INTO cliente VALUES (201, 'Alan');
INSERT INTO cliente VALUES (202, 'Bob');
INSERT INTO cliente VALUES (203, 'Carlos');

DECLARE
	v_registro cliente%ROWTYPE;  -- VARIAVEL DO TIPO CLIENTE
BEGIN
	select * INTO v_registro from cliente Where id=202;
	DBMS_OUTPUT.PUT_LINE('ID: ' || v_registro.id);
	DBMS_OUTPUT.PUT_LINE('Nome: ' || v_registro.nome);
END;






create table T1(e Integer, f Integer);
insert into T1 values(1, 3);
insert into T1 values(2, 4);

DECLARE 
	a NUMBER;
	b NUMBER;
BEGIN
	select e,f into a,b from T1 where e>1;
	DBMS_OUTPUT.PUT_LINE('A = ' || a);
	DBMS_OUTPUT.PUT_LINE('B = ' || b);
	INSERT INTO T1 values(b,a);
END;

select * from T1;








CREATE TABLE MENSAGEM(msg Varchar2(100));

Declare
	V_NR INTEGER; --Declarando a variável
Begin
	Delete mensagem;  -- 
	V_NR := 100; -- atribuindo um valor a variável
	Insert into mensagem values
		('Número: ' || TO_CHAR(V_NR)); -- Inserido na tabela mensagem
	commit;
End;


Declare
	V_NR INTEGER; --Declarando a variável
Begin
	Delete mensagem;    -- comentar
	V_NR := 130; -- atribuindo um valor a variável
	Insert into mensagem values
		('Número: ' || TO_CHAR(V_NR)); -- Inserido na tabela mensagem
	commit;
End;

select * from mensagem;








-- MINHA
DECLARE 
	x number;
	y number;
BEGIN
    x := 10;
	y := 20;
	Delete mensagem;
	INSERT INTO mensagem VALUES('Primeiro valor é '|| TO_CHAR(x) || ' e o segundo é '
	|| TO_CHAR(y) || ' e a soma dos dois é ' || TO_CHAR(x+y));
	commit;
END;
select * from mensagem;



-- PROFESSOR
DECLARE
	v_nr1 integer := 15;
	v_nr2 integer := 25;
	v_msg mensagem.msg%type;
	v_soma integer;
BEGIN
	delete mensagem;
	v_soma := v_nr1 + v_nr2;
	v_msg := 'O número um é ' || v_nr1 || ', o número 2 é ' || v_nr2 || 
	' e a soma dos dois é ' || v_soma;
    insert into mensagem values (v_msg);
    commit;
END;