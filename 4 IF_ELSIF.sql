-- IF E ELSIF



DECLARE
 	V_IDADE NUMBER:=31;

 BEGIN
 	IF V_IDADE < 11 THEN
 		DBMS_OUTPUT.PUT_LINE('Você é uma criança !');
 	ELSE
 		DBMS_OUTPUT.PUT_LINE('Você não é uma criança !');
 	END IF;

 END;




 DECLARE
    V_IDADE NUMBER:=41;
BEGIN
    IF V_IDADE < 11 THEN
        DBMS_OUTPUT.PUT_LINE('Você é uma criança ');
    ELSIF V_IDADE < 20 THEN
        DBMS_OUTPUT.PUT_LINE('Você é um jovem ');
    ELSIF V_IDADE < 30 THEN
        DBMS_OUTPUT.PUT_LINE('Você está na casa dos vinte ');
    ELSIF V_IDADE < 40 THEN
        DBMS_OUTPUT.PUT_LINE('Você está na casa dos trinta ');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Você é jovem para sempre ');
    END IF;
END;






CREATE TABLE T1(E INTEGER, F INTEGER);
INSERT INTO T1 VALUES(1, 3);
INSERT INTO T1 VALUES(2, 4);

DECLARE
    A NUMBER;
    B NUMBER:=2;
BEGIN
    DELETE T1;
    SELECT E,F INTO A,B FROM T1 WHERE E>2;
    
    IF B=1 THEN
        INSERT INTO T1 VALUES(B,A);
    ELSE
        INSERT INTO T1 VALUES(B+10, A+10);
    END IF;
    
END;

select * from T1;





CREATE TABLE MENSAGEM(MSG VARCHAR2(100));

DECLARE
    V_NR INTEGER := 1;
BEGIN

    DELETE MENSAGEM;
    IF V_NR <= 1 THEN
        INSERT INTO MENSAGEM VALUES('Menor ou igual a um');
    ELSIF V_NR <= 2 THEN   -- Repare nesse ERRO
        INSERT INTO MENSAGEM VALUES('Menor ou igual a dois');
    ELSE
        INSERT INTO MENSAGEM VALUES('Numero maior que dois');
    END IF;
    COMMIT;
END;




DECLARE
    V_NR INTEGER := 5;
BEGIN
    DELETE MENSAGEM;
    IF MOD(V_NR, 2) = 0 THEN
        INSERT INTO MENSAGEM VALUES(TO_CHAR(V_NR) || ' É par.');
    ELSE
        INSERT INTO MENSAGEM VALUES(TO_CHAR(V_NR) || ' É impar.');
    END IF;
END;

SELECT * FROM MENSAGEM;