//Les 1
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE(' Hello World ');
END; 

//Les 2
--a) today                                  Valid
--b) last_name                              Valid
--c) today’s_date                           Invalid – character "’” not allowed
--d) Number_of_days_in_February_this_year   Invalid – Too long
--e) Isleap$year                            Valid
--f) #number                                Invalid – Cannot start with “#”
--g) NUMBER#                                Valid
--h) number1to7                             Valid

--a) number_of_copies PLS_INTEGER;         Valid
--b) PRINTER_NAME constant VARCHAR2(10);   Invalid  The declaration in b is invalid because constant variables must be initialized during declaration
--c) deliver_to VARCHAR2(10):=Johnson;     Invalid  The declaration in c is invalid because string literals should be enclosed within single quotation marks
--d) by_when DATE:= CURRENT_DATE+1;        Valid

DECLARE
    v_fname VARCHAR2(20);
    v_lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_fname || ' ' || v_lname);
END;

DECLARE
    v_today DATE := SYSDATE; 
    v_tomorrow v_today%TYPE; 
BEGIN
    v_tomorrow := v_today + 1;
    DBMS_OUTPUT.PUT_LINE('Hello World');
    DBMS_OUTPUT.PUT_LINE('TODAY IS : ' || v_today);
    DBMS_OUTPUT.PUT_LINE('TOMORROW IS : ' || v_tomorrow);
END;
  
VARIABLE b_basic_percent NUMBER;
VARIABLE b_pf_percent NUMBER;

EXEC :b_basic_percent := 45;
EXEC :b_pf_percent := 12;

PRINT b_basic_percent;
PRINT b_pf_percent;

-- Les 3
SET SERVEROUTPUT ON;

DECLARE
    v_weight NUMBER(3) := 600;
    v_message VARCHAR2(255) := 'Product 10012';
BEGIN
    DECLARE
        v_weight NUMBER(3) := 1;
        v_message VARCHAR2(255) := 'Product 11001';
        v_new_locn VARCHAR2(50) := 'Europe';
    BEGIN
        v_weight := v_weight + 1;
        v_new_locn := 'Western ' || v_new_locn;

        DBMS_OUTPUT.PUT_LINE(v_weight);
        DBMS_OUTPUT.PUT_LINE(v_new_locn);
    END;

    v_weight := v_weight + 1;
    v_message := v_message || ' is in stock';

    DBMS_OUTPUT.PUT_LINE(v_weight);
    DBMS_OUTPUT.PUT_LINE(v_message);
END;

SET SERVEROUTPUT ON;

DECLARE
    v_customer VARCHAR2(50) := 'Womansport';
    v_credit_rating VARCHAR2(50) := 'EXCELLENT';
BEGIN
    DECLARE
        v_customer NUMBER(7) := 201;
        v_name VARCHAR2(25) := 'Unisports';
    BEGIN
        v_credit_rating := 'GOOD';

        DBMS_OUTPUT.PUT_LINE(v_customer);
        DBMS_OUTPUT.PUT_LINE(v_name);
        DBMS_OUTPUT.PUT_LINE(v_credit_rating);
    END;

    DBMS_OUTPUT.PUT_LINE(v_customer);
    DBMS_OUTPUT.PUT_LINE(v_credit_rating);
END;


-- Les 4
SET SERVEROUTPUT ON;

DECLARE
    v_max_deptno NUMBER;
    v_dept_name departments.department_name%TYPE := 'Education';
    v_dept_id NUMBER;
BEGIN
    SELECT MAX(department_id) INTO v_max_deptno FROM departments;
    
    v_dept_id := 10 + v_max_deptno;

    INSERT INTO departments (department_id, department_name, location_id)
    VALUES (v_dept_id, v_dept_name, NULL);

    DBMS_OUTPUT.PUT_LINE('The maximum department_id is : ' || v_max_deptno);
    DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT gives ' || SQL%ROWCOUNT);
END;


//Les 5
CREATE TABLE messages (
    testNumber NUMBER(7)
);

BEGIN
    FOR i IN 1..10 LOOP
        IF i <> 6 AND i <> 8 THEN
            INSERT INTO messages(testNumber)
            VALUES (i);
        END IF;
    END LOOP;
    COMMIT;
END;

SELECT * FROM messages; 

-- Les 6
SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    v_countryid VARCHAR2(20) := 'CA'; 
    v_country_record countries%ROWTYPE;
BEGIN
    SELECT * INTO v_country_record
    FROM countries
    WHERE country_id = UPPER(v_countryid);

    DBMS_OUTPUT.PUT_LINE('Country Id: ' || v_country_record.country_id ||
                         ' Country Name: ' || v_country_record.country_name ||
                         ' Region: ' || v_country_record.region_id);
END;



SET SERVEROUTPUT ON;
DECLARE
    TYPE dept_table_type IS TABLE OF departments.department_name%TYPE 
    INDEX BY PLS_INTEGER;
    
    my_dept_table dept_table_type; 
    loop_count NUMBER(2) := 10;
    deptno NUMBER(4) := 0;
BEGIN
    -- Fetch department names
    FOR i IN 1..loop_count LOOP
        deptno := deptno + 10;
        
        BEGIN
            SELECT department_name
            INTO my_dept_table(i)
            FROM departments
            WHERE department_id = deptno;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                my_dept_table(i) := 'No Department';
        END;
    END LOOP;

    -- Output the department names
    FOR i IN 1..loop_count LOOP
        DBMS_OUTPUT.PUT_LINE(my_dept_table(i));
    END LOOP;
END;


SET SERVEROUTPUT ON;
DECLARE
    TYPE dept_table_type IS TABLE OF departments%ROWTYPE 
    INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    f_loop_count NUMBER(2) := 10;
    v_deptno NUMBER(4) := 0;
BEGIN
    FOR i IN 1..f_loop_count LOOP
        v_deptno := v_deptno + 10;
        SELECT * 
        INTO my_dept_table(i) 
        FROM departments 
        WHERE department_id = v_deptno;
    END LOOP;

    FOR i IN 1..f_loop_count LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Department Number: ' || my_dept_table(i).department_id ||
            ' Department Name: ' || my_dept_table(i).department_name ||
            ' Manager Id: ' || my_dept_table(i).manager_id ||
            ' Location Id: ' || my_dept_table(i).location_id
        );
    END LOOP;
END;

//Les 7

SET SERVEROUTPUT ON;
DECLARE
    v_deptno NUMBER := 10; 
    
    CURSOR c_emp_cursor ISSELECT last_name, salary, manager_id FROM employees
        WHERE department_id = v_deptno; 
BEGIN
    FOR emp_record IN c_emp_cursor LOOP
        IF emp_record.salary < 5000 
           AND (emp_record.manager_id = 101 OR emp_record.manager_id = 124) THEN
            DBMS_OUTPUT.PUT_LINE(emp_record.last_name || ' Due for a raise');
        ELSE
            DBMS_OUTPUT.PUT_LINE(emp_record.last_name || ' Not Due for a raise');
        END IF;
    END LOOP;
END;


SET SERVEROUTPUT ON;
DECLARE
    
    CURSOR c_dept_cursor IS SELECT department_id, department_name FROM departments
        WHERE department_id < 100
        ORDER BY department_id; 
    
    CURSOR c_emp_cursor(v_deptno NUMBER) IS SELECT last_name, job_id, hire_date, salary FROM employees
        WHERE department_id = v_deptno AND employee_id < 120; 
    
    v_current_deptno departments.department_id%TYPE;
    v_current_dname departments.department_name%TYPE;
    v_ename employees.last_name%TYPE;
    v_job employees.job_id%TYPE;
    v_hiredate employees.hire_date%TYPE;
    v_sal employees.salary%TYPE; 

BEGIN
    OPEN c_dept_cursor;
    LOOP
        FETCH c_dept_cursor INTO v_current_deptno, v_current_dname;
        EXIT WHEN c_dept_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Department Number : ' || v_current_deptno || 
            ' Department Name : ' || v_current_dname
        ); 
        IF c_emp_cursor%ISOPEN THEN
            CLOSE c_emp_cursor;
        END IF;

    
        OPEN c_emp_cursor(v_current_deptno);
        LOOP
            FETCH c_emp_cursor INTO v_ename, v_job, v_hiredate, v_sal;
            EXIT WHEN c_emp_cursor%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(
                v_ename || ' ' || v_job || ' ' || v_hiredate || ' ' || v_sal
            );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(
            '--------------------------------------------------------------'
        );
        CLOSE c_emp_cursor; 
    END LOOP;
    
    CLOSE c_dept_cursor;
END;

