-- Cursores

/*

SQL%FOUND = Atributo booleano que será avaliado como true se a instrução
			SQL mais recente afetar pelo menos uma linha.

SQL%NOTFOUND = Atributo booleano que será avaliado como true se a instrução
			   SQL mais recente afetar nenhuma linha.

SQL%ROWCOUNT = Uma valor inteiro que representa o número de linhas afetadas
			   pela instrução SQL mais recente.

*/



DECLARE 
	V_CONTADOR NUMBER;
BEGIN
	DELETE FROM CLIENTE WHERE ID=215;
	V_CONTADOR := (SQL%ROWCOUNT);
	DBMS_OUTPUT.PUT_LINE('Número de linhas afatadas: ' || V_CONTADOR);
END;




CREATE TABLE cliente (id NUMBER(7), nome VARCHAR2(30), telefone VARCHAR2(20), sit_cred Char(5));

INSERT INTO cliente VALUES (201, 'Unisports', '55-2066101', 'Boa');
INSERT INTO cliente VALUES (202, 'OJ Atheletics', '81-20101', 'Boa');
INSERT INTO cliente VALUES (203, 'Delhi Sports', '91-10351', 'Ruim');
INSERT INTO cliente VALUES (204, 'Womansport', '1-206-104-0103', 'Boa');
INSERT INTO cliente VALUES (205, 'Kam''s Sporting GOODs', '852-3692888', 'Ruim');
INSERT INTO cliente VALUES (206, 'Sportique', '33-2257201', 'Ruim');
INSERT INTO cliente VALUES (207, 'Sweet Rock Sports', '234-6036201', 'Ruim');
INSERT INTO cliente VALUES (208, 'Muench Sports', '49-527454', 'Boa');
INSERT INTO cliente VALUES (209, 'Beisbol Si!', '809-352689', 'Ruim');
INSERT INTO cliente VALUES (210, 'Futbol Sonora', '52-404562', 'Boa');
INSERT INTO cliente VALUES (211, 'Kuhn''s Sports', '42-111292', 'Ruim');
INSERT INTO cliente VALUES (212, 'Hamada Sport', '20-1209211', 'Boa');
INSERT INTO cliente VALUES (213, 'Big John''s Sports Emporium', '1-415-555-6281', 'Ruim');
INSERT INTO cliente VALUES (214, 'Ojibway Retail', '1-716-555-7171', 'Boa');
INSERT INTO cliente VALUES (215, 'Sporta Russia', '7-3892456', 'Ruim');

SELECT id, nome FROM cliente  WHERE sit_cred = 'Boa';

SELECT * FROM cliente WHERE id >= 210;


DECLARE
  v_id cliente.id%type;
  v_nome cliente.nome%type;
								  CURSOR cliente_cursor
								    IS
								  SELECT id, nome FROM cliente WHERE sit_cred = 'Boa';
BEGIN
  											OPEN cliente_cursor;
  FETCH cliente_cursor INTO v_id, v_nome;
  -- lê o próximo e atribui
  DBMS_OUTPUT.PUT_LINE( v_id ||' '||v_nome);
  FETCH cliente_cursor INTO v_id, v_nome;
  -- lê o próximo e atribui
  DBMS_OUTPUT.PUT_LINE( v_id ||' '||v_nome);
  FETCH cliente_cursor INTO v_id, v_nome;
  -- lê o próximo e atribui
  DBMS_OUTPUT.PUT_LINE( v_id ||' '||v_nome);
 												 CLOSE  cliente_cursor; 
END;



-- CREATE TABLE cliente (id NUMBER(7), nome VARCHAR2(30), telefone VARCHAR2(20), sit_cred Char(5));

DECLARE
  v_id cliente.id%type;
  v_nome cliente.nome%type;
  CURSOR cliente_cursor
  IS
    SELECT id, nome FROM cliente WHERE sit_cred = 'Boa';
BEGIN
  OPEN cliente_cursor;
  Loop
    FETCH cliente_cursor INTO v_id, v_nome;
    EXIT WHEN cliente_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( v_id ||' '||v_nome);
  End Loop;
  CLOSE  cliente_cursor; 
END;





Create Table T1( e Integer, f Integer);
insert into t1 values(3,4);
insert into t1 values(6,6);
insert into t1 values(5,7);
insert into t1 values(8,3);
insert into t1 values(8,10);
insert into t1 values(12,5);

Select * from T1;
SELECT e, f FROM T1 WHERE e < f;
delete t1;

DECLARE
/* Variáveis de saída para armazenar o resultado da consulta: */
  a T1.e%TYPE;
  b T1.f%TYPE;
  /* Declaração do cursor: */
  CURSOR T1Cursor IS
     SELECT e, f  FROM T1 WHERE e < f
        FOR UPDATE;
 BEGIN
  OPEN T1Cursor;
  LOOP
    /* Devolve cada linha do resultado da consulta acima  em variáveis PL/SQL: */
    FETCH T1Cursor INTO a, b;  /* Se não houver mais linhas para buscar, sai do laço: */
      EXIT WHEN T1Cursor%NOTFOUND;
      /* Apaga a tupla corrente: */
      DELETE FROM T1 WHERE CURRENT OF T1Cursor;
      /* Insere a tupla oposta: */
      INSERT INTO T1 VALUES(b, a);
  END LOOP;
  /* Libera o cursor usado pela consulta. */
  CLOSE T1Cursor;
END;









CREATE TABLE MENSAGEM( msg Varchar2(100) );

CREATE TABLE produto  (
    id                     NUMBER(7) CONSTRAINT c_produto_id NOT NULL,
    nome                   VARCHAR2(25) CONSTRAINT c_produto_nome NOT NULL,
    desc_resumida          VARCHAR2(50),
    preco_atacado_sugerido NUMBER(11, 2),
    unid_estoque           VARCHAR2(25),
    CONSTRAINT c_id_produto_pk PRIMARY KEY (id),
    CONSTRAINT c_produto_nome_uk UNIQUE (nome)
  ); 


INSERT INTO produto VALUES (10011, 'Bunny Boot','Beginner''s ski boot',150, NULL);   
INSERT INTO produto VALUES (10012, 'Ace Ski Boot','Intermediate ski boot',200, NULL);
INSERT INTO produto VALUES (10013, 'Pro Ski Boot','Advanced ski boot',410, NULL);
INSERT INTO produto VALUES (10021, 'Bunny Ski Pole','Beginner''s ski pole',16.25, NULL);
INSERT INTO produto VALUES (10022, 'Ace Ski Pole','Intermediate ski pole',21.95, NULL);
INSERT INTO produto VALUES (10023, 'Pro Ski Pole','Advanced ski pole',40.95, NULL);
INSERT INTO produto VALUES (20106, 'Junior Soccer Ball','Junior soccer ball',11, NULL);
INSERT INTO produto VALUES (20108, 'World Cup Soccer Ball','World cup soccer ball',28, NULL);
INSERT INTO produto VALUES (20201, 'World Cup Net','World cup net',123, NULL);
INSERT INTO produto VALUES (20510, 'Black Hawk Knee Pads','Knee pads, pair',9, NULL);
INSERT INTO produto VALUES (20512, 'Black Hawk Elbow Pads','Elbow pads, pair',8, NULL);
INSERT INTO produto VALUES (30321, 'Grand Prix Bicycle','Road bicycle',1669, NULL);

Select * from produto;
select id, nome, preco_atacado_sugerido from produto where preco_atacado_sugerido > (select avg(preco_atacado_sugerido) from produto);

Declare
  v_id produto.id%type;
  v_nome produto.nome%type;
  v_preco produto.preco_atacado_sugerido%type;
  cursor cur_produto is    
   select id, nome, preco_atacado_sugerido from produto 
		 where preco_atacado_sugerido > 
       (select avg(preco_atacado_sugerido) from produto);
Begin
  Open cur_produto;
  Delete MENSAGEM;
  Loop
    fetch cur_produto into v_id, v_nome, v_preco;
    Exit When cur_produto%notfound;
    insert into mensagem values (v_id || ' ' || v_nome || '-' || v_preco);
  End loop;
  Close cur_produto;
End; 

select * from mensagem;





































-- DESCONSIDERAR




CREATE TABLE cliente (
  id NUMBER(7), 
  nome VARCHAR2(30) CONSTRAINT c_cliente_nome_nn NOT NULL, 
  telefone VARCHAR2(20), 
  ender VARCHAR2(50), 
  cidade VARCHAR2(20), 
  estado VARCHAR2(20), 
  pais VARCHAR2(20), 
  cep VARCHAR2(15), 
  sit_cred VARCHAR2(9), 
  id_repr_vendas NUMBER(7), 
  id_regiao NUMBER(7), 
  comentarios VARCHAR2(255), 
  CONSTRAINT c_cliente_id_pk PRIMARY KEY (id), 
  CONSTRAINT c_cliente_sit_cred_ck 
  CHECK (sit_cred IN ('OTIMA', 'BOA', 'RUIM'))
);


INSERT INTO cliente VALUES (
   201, 'Unisports', '55-2066101',
   '72 Via Bahia', 'Sao Paulo', NULL, 'Brazil', NULL,
   'OTIMA', 12, 2, NULL);
INSERT INTO cliente VALUES (
   202, 'OJ Atheletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japan', NULL,
   'RUIM', 14, 4, NULL);
INSERT INTO cliente VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'BOA', 14, 4, NULL);
INSERT INTO cliente VALUES (
   204, 'Womansport', '1-206-104-0103',
   '281 King Street', 'Seattle', 'Washington', 'USA', NULL,
   'OTIMA', 11, 1, NULL);
INSERT INTO cliente VALUES (
   205, 'Kam''s Sporting GOODs', '852-3692888',
   '15 Henessey Road', 'Hong Kong', NULL, NULL, NULL,
   'OTIMA', 15, 4, NULL);
INSERT INTO cliente VALUES (
   206, 'Sportique', '33-2257201',
   '172 Rue de Rivoli', 'Cannes', NULL, 'France', NULL,
   'OTIMA', 15, 5, NULL);
INSERT INTO cliente VALUES (
   207, 'Sweet Rock Sports', '234-6036201',
   '6 Saint Antoine', 'Lagos', NULL, 'Nigeria', NULL,
   'BOA', NULL, 3, NULL);
INSERT INTO cliente VALUES (
   208, 'Muench Sports', '49-527454',
   '435 Gruenestrasse', 'Stuttgart', NULL, 'Germany', NULL,
   'BOA', 15, 5, NULL);
INSERT INTO cliente VALUES (
   209, 'Beisbol Si!', '809-352689',
   '792 Playa Del Mar', 'San Pedro de Macon s', NULL, 'Dominican Republic', 
   NULL, 'OTIMA', 11, 1, NULL);
INSERT INTO cliente VALUES (
   210, 'Futbol Sonora', '52-404562',
   '3 Via Saguaro', 'Nogales', NULL, 'Mexico', NULL,
   'OTIMA', 12, 2, NULL);   
INSERT INTO cliente VALUES (
   211, 'Kuhn''s Sports', '42-111292',
   '7 Modrany', 'Prague', NULL, 'Czechoslovakia', NULL,
   'OTIMA', 15, 5, NULL);
INSERT INTO cliente VALUES (
   212, 'Hamada Sport', '20-1209211',
   '57A Corniche', 'Alexandria', NULL, 'Egypt', NULL,
   'OTIMA', 13, 3, NULL);
INSERT INTO cliente VALUES (
   213, 'Big John''s Sports Emporium', '1-415-555-6281',
   '4783 18th Street', 'San Francisco', 'CA', 'USA', NULL,
   'OTIMA', 11, 1, NULL);
INSERT INTO cliente VALUES (
   214, 'Ojibway Retail', '1-716-555-7171',
   '415 Main Street', 'Buffalo', 'NY', 'USA', NULL,
   'RUIM', 11, 1, NULL);
INSERT INTO cliente VALUES (
   215, 'Sporta Russia', '7-3892456',
   '6000 Yekatamina', 'Saint Petersburg', NULL, 'Russia', NULL,
   'RUIM', 15, 5, NULL);
COMMIT;	




