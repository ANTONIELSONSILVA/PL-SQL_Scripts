-- CASE


-- Variável recebe o resultado

DECLARE
    V_GRADE CHAR(1) := UPPER('A');
    V_APPRAISAL VARCHAR2(20);
BEGIN
    V_APPRAISAL := CASE V_GRADE
            WHEN 'A' THEN 'Excelente'
            WHEN 'B' THEN 'Muito bom'
            WHEN 'C' THEN 'Bom'
            ELSE 'Não foi bom'
        END;
    DBMS_OUTPUT.PUT_LINE('Grau: ' || V_GRADE || ' Situação ' || V_APPRAISAL);
END;





Video 4



DECLARE
	V_GRADE CHAR(1);
	V_APPRAISAL VARCHAR2(20);
BEGIN
	V_GRADE := UPPER('A');
	V_APPRAISAL :=
		CASE
			WHEN V_GRADE = 'A' THEN 'Excellent'
			WHEN V_GRADE IN ('B', 'C') THEN 'Good'
			ELSE 'No such grade'
		END;
		DBMS_OUTPUT.PUTLINE('Grade: ' || V_GRADE || 'Appraisal' ||
					   V_APPRAISAL);
END;


=============================================================================


DECLARE
	_deptid NUMBER; v_deptname VARCHAR2(20);
	_emps NUMBER;
	_mngid NUMBER:= 108;
BEGIN
	CASE v_mngid
		WHEN 108 THEN
		SELECT department_id, department_name
		INTO v_deptid, v_deptname FROM departments
		WHERE manager_id=108;
		SELECT count(*) INTO v_emps FROM employees WHERE department_id=v_deptid;
	WHEN 200 THEN
--...
	END CASE;

	DBMS_OUTPUT.PUT_LINE ('You are working in the '|| v_deptname|| ' department. There are '||v_emps ||' employees in this department');
END;