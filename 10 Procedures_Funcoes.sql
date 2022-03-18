-- Procedures e Funções


O bloco PL/SQL deve term no mínimo, uma instrução RETURN.



CREATE TABLE vendedor(cod_vend smallint NOT NULL,nome_vend varchar(40) NOT NULL,
					  sal_fixo numeric(9,2) NOT NULL, faixa_comiss char(1) NOT NULL,
        			  PRIMARY KEY (cod_vend));



insert into vendedor (cod_vend, nome_vend, sal_fixo, faixa_comiss)
					values (11, 'Paulo Alberto' , 1500, 'b');  
insert into vendedor (cod_vend, nome_vend, sal_fixo, faixa_comiss)
  					values (12, 'Ana Cristina' , 2100, 'a');  
insert into vendedor (cod_vend, nome_vend, sal_fixo, faixa_comiss)
  					values (13, 'Cassia Andrade' , 900, 'c');  
insert into vendedor (cod_vend, nome_vend, sal_fixo, faixa_comiss)
  					values (14, 'Armando Pinto' , 2500, 'a');  
insert into vendedor (cod_vend, nome_vend, sal_fixo, faixa_comiss)
  					values (15, 'Maria Paula' , 900, 'c');  


  Select * from Vendedor;
  


CREATE OR REPLACE FUNCTION verifica_sal
  RETURN BOOLEAN
IS
  v_empno vendedor.cod_vend%TYPE;
  v_sal vendedor.sal_fixo%TYPE;
  v_avg_sal vendedor.sal_fixo%TYPE;
BEGIN
  v_empno:=12;
  SELECT sal_fixo INTO v_sal
      FROM vendedor WHERE cod_vend = v_empno;
  SELECT AVG(sal_fixo) INTO v_avg_sal
      FROM vendedor;
  IF v_sal  > v_avg_sal THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  RETURN NULL;
END;

