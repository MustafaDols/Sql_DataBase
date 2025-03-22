-- Les 1
SET SERVEROUTPUT ON;
DECLARE x VARCHAR2(20);  
BEGIN
    SELECT first_name INTO x 
    FROM employees 
    WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('First Name: ' || x);
END;


-- Les 2
SET SERVEROUTPUT ON
DECLARE Myname VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('My name is: ' || Myname);
    Myname := 'John';
    DBMS_OUTPUT.PUT_LINE('My name is: ' || Myname);
END;

SET SERVEROUTPUT ON
DECLARE Myname VARCHAR2(20) := 'John';
BEGIN
    Myname := 'Steven';
    DBMS_OUTPUT.PUT_LINE('My name is: ' || Myname);
END;

SET SERVEROUTPUT ON
DECLARE event VARCHAR2(15);
BEGIN
    event := q'!Father's day!';
    DBMS_OUTPUT.PUT_LINE('3rd Sunday in June is : ' || event);
    event := q'[Mother's day]';
    DBMS_OUTPUT.PUT_LINE('2nd Sunday in May is  : ' || event);
END;

SET SERVEROUTPUT ON
DECLARE fname employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO fname FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(fname);
END;

-- Run first
SET SERVEROUTPUT ON
VARIABLE emp_salary NUMBER
BEGIN
    SELECT salary INTO :emp_salary FROM employees WHERE employee_id = 178;
END;

-- Run second
PRINT :emp_salary

SET SERVEROUTPUT ON
VARIABLE emp_salary NUMBER
SET AUTOPRINT ON
BEGIN
    SELECT salary INTO :emp_salary FROM employees WHERE employee_id = 178;
END;

SET SERVEROUTPUT OFF
VARIABLE emp_salary NUMBER
SET AUTOPRINT ON
DECLARE
    empno NUMBER(6) := &empno;
BEGIN
    SELECT salary INTO :emp_salary FROM employees WHERE employee_id = empno;
END;

SET VERIFY OFF
VARIABLE emp_salary NUMBER
ACCEPT empno PROMPT 'Please enter a valid employee number: ';
SET AUTOPRINT ON
DECLARE
    empno NUMBER(6) := &empno;
BEGIN
    SELECT salary INTO :emp_salary FROM employees WHERE employee_id = empno;
END;

SET VERIFY OFF
DEFINE lname = Urman
DECLARE
    fname VARCHAR2(25);
BEGIN
    SELECT first_name INTO fname FROM employees WHERE last_name = '&lname';
END;


-- Les 3
SET SERVEROUTPUT ON
DECLARE
    outer_variable VARCHAR2(20) := 'GLOBAL VARIABLE';
BEGIN
    DECLARE
        inner_variable VARCHAR2(20) := 'LOCAL VARIABLE';
    BEGIN
        DBMS_OUTPUT.PUT_LINE(inner_variable);
        DBMS_OUTPUT.PUT_LINE(outer_variable);
    END;
    DBMS_OUTPUT.PUT_LINE(outer_variable);
END;

SET SERVEROUTPUT ON
DECLARE
    father_name VARCHAR2(20) := 'Patrick';
    date_of_birth DATE := '20-Apr-1972';
BEGIN
    DECLARE
        child_name VARCHAR2(20) := 'Mike';
        date_of_birth DATE := '12-Dec-2002';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || father_name);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || child_name);
    END;
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || date_of_birth);
END;

SET SERVEROUTPUT ON
<<outer>>
DECLARE
    father_name VARCHAR2(20) := 'Patrick';
    date_of_birth DATE := '20-Apr-1972';
BEGIN
    DECLARE
        child_name VARCHAR2(20) := 'Mike';
        date_of_birth DATE := '12-Dec-2002';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Father''s Name: ' || father_name);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || outer.date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Child''s Name: ' || child_name);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || date_of_birth);
    END;
END;

SET SERVEROUTPUT ON;
DECLARE
    sal NUMBER(7,2) := 60000;
    comm NUMBER(7,2) := sal * 0.20;
    message VARCHAR2(255) := ' eligible for commission';
BEGIN
    DECLARE
        sal NUMBER(7,2) := 50000;
        comm NUMBER(7,2) := 0;
        total_comp NUMBER(7,2) := sal + comm;
    BEGIN
        message := 'CLERK not' || message;
        comm := sal * 0.30;
        DBMS_OUTPUT.PUT_LINE('Inner Block:');
        DBMS_OUTPUT.PUT_LINE('salary is  : ' || sal);
        DBMS_OUTPUT.PUT_LINE('message is  : ' || message);
        DBMS_OUTPUT.PUT_LINE('commission is  : ' || comm);
    END;
    message := 'SALESMAN ' || message;
    DBMS_OUTPUT.PUT_LINE('Outer Block:');
    DBMS_OUTPUT.PUT_LINE('salary is  : ' || sal);
    DBMS_OUTPUT.PUT_LINE('message is  : ' || message);
    DBMS_OUTPUT.PUT_LINE('commission is  : ' || comm);
END;


-- Les 4
SET SERVEROUTPUT ON
DECLARE
    fname VARCHAR2(25);
BEGIN
    SELECT first_name INTO fname
    FROM employees WHERE employee_id = 200;
    DBMS_OUTPUT.PUT_LINE(' First Name is : ' || fname);
END;

DECLARE
    emp_hiredate employees.hire_date%TYPE;
    emp_salary employees.salary%TYPE;
BEGIN
    SELECT hire_date, salary INTO emp_hiredate, emp_salary
    FROM employees
    WHERE employee_id = 100;
END;

SET SERVEROUTPUT ON
DECLARE
    sum_sal NUMBER(10,2);
    deptno NUMBER NOT NULL := 60;
BEGIN
    SELECT SUM(salary) INTO sum_sal FROM employees
    WHERE department_id = deptno;
    DBMS_OUTPUT.PUT_LINE('The sum of salary is ' || sum_sal);
END;

CREATE TABLE cs1 (
    student_id NUMBER(7),
    name VARCHAR2(14),
    department VARCHAR2(10),
    gpa NUMBER(3,2) 
);

BEGIN
    INSERT INTO cs1 (student_id, name, department, gpa) 
    VALUES (2227263, 'Mustafa', 'cs', 2.5);
    COMMIT; 
END;

BEGIN
    INSERT INTO cs1 (student_id, name, department, gpa) 
    VALUES (2227253, 'Mansy', 'cs', 1.5);
    COMMIT; 
END;

BEGIN
    INSERT INTO cs1 (student_id, name, department, gpa) 
    VALUES (2227235, 'Hassan', 'cs', 2);
    COMMIT; 
END;

BEGIN
    INSERT INTO cs1 (student_id, name, department, gpa) 
    VALUES (2227078, 'Body', 'cs', 3);
    COMMIT; 
END;

BEGIN
    INSERT INTO cs1 (student_id, name, department, gpa) 
    VALUES (2227000, 'mazen', 'biology', 4.5);
END;

ROLLBACK;

SELECT * FROM cs1;

BEGIN
    UPDATE cs1
    SET name = 'Abelrahman'
    WHERE student_id = 2227078;
END;

BEGIN
    DELETE FROM cs1
    WHERE gpa = 3;
END;

ROLLBACK;


-- Les 5
SET SERVEROUTPUT ON
DECLARE
    myage NUMBER := 31;
BEGIN
    IF myage < 11 THEN
        DBMS_OUTPUT.PUT_LINE(' I am a child ');
    END IF;
END;

SET SERVEROUTPUT ON
DECLARE
    myage NUMBER := 31;
BEGIN
    IF myage < 11 THEN
        DBMS_OUTPUT.PUT_LINE(' I am a child ');
    ELSE
        DBMS_OUTPUT.PUT_LINE(' I am not a child ');
    END IF;
END;

DECLARE
    myage NUMBER := 31;
BEGIN
    IF myage < 11 THEN
        DBMS_OUTPUT.PUT_LINE(' I am a child ');
    ELSIF myage < 20 THEN
        DBMS_OUTPUT.PUT_LINE(' I am young ');
    ELSIF myage < 30 THEN
        DBMS_OUTPUT.PUT_LINE(' I am in my twenties');
    ELSIF myage < 40 THEN
        DBMS_OUTPUT.PUT_LINE(' I am in my thirties');
    ELSE
        DBMS_OUTPUT.PUT_LINE(' I am always young ');
    END IF;
END;

DECLARE
    myage NUMBER;
BEGIN
    IF myage < 11 THEN
        DBMS_OUTPUT.PUT_LINE(' I am a child ');
    ELSE
        DBMS_OUTPUT.PUT_LINE(' I am not a child ');
    END IF;
END;

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    grade CHAR(1) := UPPER('&grade');
    appraisal VARCHAR2(20);
BEGIN
    appraisal :=
        CASE grade
            WHEN 'A' THEN 'Excellent'
            WHEN 'B' THEN 'Very Good'
            WHEN 'C' THEN 'Good'
            ELSE 'No such grade'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade || '
    Appraisal ' || appraisal);
END;

DECLARE
    grade CHAR(1) := UPPER('&grade');
    appraisal VARCHAR2(20);
BEGIN
    appraisal :=
        CASE
            WHEN grade = 'A' THEN 'Excellent'
            WHEN grade IN ('B', 'C') THEN 'Good'
            ELSE 'No such grade'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade || '
    Appraisal ' || appraisal);
END;

DECLARE
    countryid locations.country_id%TYPE := 'CA';
    loc_id locations.location_id%TYPE;
    counter NUMBER(2) := 1;
    new_city locations.city%TYPE := 'Montreal';
BEGIN
    SELECT MAX(location_id) INTO loc_id FROM locations
    WHERE country_id = countryid;
    LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((loc_id + counter), new_city, countryid);
        counter := counter + 1;
        EXIT WHEN counter > 3;
    END LOOP;
END;

DECLARE
    countryid locations.country_id%TYPE := 'CA';
    loc_id locations.location_id%TYPE;
    new_city locations.city%TYPE := 'Montreal';
    counter NUMBER := 1;
BEGIN
    SELECT MAX(location_id) INTO loc_id FROM locations
    WHERE country_id = countryid;
    WHILE counter <= 3 LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((loc_id + counter), new_city, countryid);
        counter := counter + 1;
    END LOOP;
END;

DECLARE
    countryid locations.country_id%TYPE := 'CA';
    loc_id locations.location_id%TYPE;
    new_city locations.city%TYPE := 'Montreal';
BEGIN
    SELECT MAX(location_id) INTO loc_id
    FROM locations
    WHERE country_id = countryid;
    FOR i IN 1..3 LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((loc_id + i), new_city, countryid);
    END LOOP;
END;


-- Les 6
SET SERVEROUTPUT ON;
DECLARE 
    TYPE student IS RECORD ( 
        s_name VARCHAR(30),
        s_phone VARCHAR(11),
        address VARCHAR(50)  
    ); 
    student1 student;
BEGIN
    student1.s_name := 'Mustafa';
    student1.s_phone := '01030801871';
    student1.address := 'Shubra, Cairo'; 

    DBMS_OUTPUT.PUT_LINE(student1.s_name);  
END;

SET SERVEROUTPUT ON;
DECLARE
    TYPE students IS TABLE OF VARCHAR2(10) INDEX BY PLS_INTEGER;
    arr students;
BEGIN
    arr(1) := 'Mustafa';
    arr(2) := 'Ahmed';
    arr(3) := 'Ismail';
    arr(4) := 'Mohamed';

    FOR i IN 1..arr.count LOOP
        DBMS_OUTPUT.PUT_LINE(arr(i));
    END LOOP;
END;

SET SERVEROUTPUT ON;
DECLARE
    TYPE students IS TABLE OF VARCHAR2(10) INDEX BY PLS_INTEGER;
    arr students;
BEGIN
    arr(1) := 'A';
    arr(2) := 'B';
    arr(3) := 'C';
    arr(4) := 'D';

    FOR i IN 1..10 LOOP
        IF arr.exists(i) THEN
            DBMS_OUTPUT.PUT_LINE(arr(i));
        END IF;
    END LOOP;
END;

SET SERVEROUTPUT ON;
DECLARE
    TYPE students IS TABLE OF VARCHAR2(10) INDEX BY PLS_INTEGER;
    arr students;
BEGIN
    arr(1) := 'A';
    arr(2) := 'B';
    arr(3) := 'C';
    arr(4) := 'D';

    arr.delete(2);

    DBMS_OUTPUT.PUT_LINE(arr.next(2));
    
    FOR i IN arr.first .. arr.last LOOP
        IF arr.exists(i) THEN
            DBMS_OUTPUT.PUT_LINE(arr(i));
        END IF;
    END LOOP;
END;

DECLARE
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    my_table num_table;
    v_index PLS_INTEGER;
BEGIN
    my_table(1) := 100;
    my_table(2) := 200;
    my_table(3) := 300;
    my_table(5) := 500;

    DBMS_OUTPUT.PUT_LINE('Count: ' || my_table.COUNT);
    DBMS_OUTPUT.PUT_LINE('First Index: ' || my_table.FIRST);
    DBMS_OUTPUT.PUT_LINE('Last Index: ' || my_table.LAST);

    IF my_table.EXISTS(3) THEN
        DBMS_OUTPUT.PUT_LINE('Element at index 3 exists: ' || my_table(3));
    END IF;

    v_index := my_table.FIRST;
    WHILE v_index IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Element at index ' || v_index || ' is ' || my_table(v_index));
        v_index := my_table.NEXT(v_index);
    END LOOP;

    my_table.DELETE(2);
    
    IF NOT my_table.EXISTS(2) THEN
        DBMS_OUTPUT.PUT_LINE('Element at index 2 deleted.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('After TRIM, count: ' || my_table.COUNT);
END;

DECLARE
    TYPE num_table IS TABLE OF NUMBER;
    my_table num_table := num_table(100, 200, 300, 400, 500);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Count: ' || my_table.COUNT);
    DBMS_OUTPUT.PUT_LINE('First Index: ' || my_table.FIRST);
    DBMS_OUTPUT.PUT_LINE('Last Index: ' || my_table.LAST);

    my_table.DELETE(2);
    DBMS_OUTPUT.PUT_LINE('After DELETE, count: ' || my_table.COUNT);

    my_table.TRIM;
    DBMS_OUTPUT.PUT_LINE('After TRIM, count: ' || my_table.COUNT);
END;


-- Les 7
DECLARE
    CURSOR cur IS SELECT first_name FROM employees;
    f_name VARCHAR2(100);
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO f_name;
        DBMS_OUTPUT.PUT_LINE(f_name);
        EXIT WHEN cur%NOTFOUND;
    END LOOP;
    CLOSE cur;
END;

DECLARE
    CURSOR cur IS SELECT * FROM employees;
    rec cur%ROWTYPE;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO rec;
        DBMS_OUTPUT.PUT_LINE(rec.salary);
        EXIT WHEN cur%NOTFOUND;
    END LOOP;
    CLOSE cur;
END;

DECLARE
    CURSOR cur IS SELECT * FROM employees;
    rec cur%ROWTYPE;
BEGIN
    FOR rec IN cur LOOP
        DBMS_OUTPUT.PUT_LINE(rec.salary);
    END LOOP;
END;

DECLARE
BEGIN
    FOR rec IN (SELECT * FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.salary);
    END LOOP;
END;

DECLARE 
    CURSOR cur(emp_id NUMBER) IS 
        SELECT * FROM employees WHERE employee_id = emp_id FOR UPDATE;
BEGIN
    FOR rec IN (SELECT * FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.salary);
    END LOOP;
END;

DECLARE
    CURSOR my_cursor IS
        SELECT t1.department_id, t1.department_name, t2.staff
        FROM departments t1
        JOIN (SELECT department_id, COUNT(*) AS staff
              FROM employees
              GROUP BY department_id) t2
        ON t1.department_id = t2.department_id
        WHERE t2.staff >= 3;

    v_department_id   departments.department_id%TYPE;
    v_department_name departments.department_name%TYPE;
    v_staff_count     NUMBER;
    
BEGIN
    OPEN my_cursor;
    
    LOOP
        FETCH my_cursor INTO v_department_id, v_department_name, v_staff_count;
        EXIT WHEN my_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_department_id || 
                             ', Name: ' || v_department_name || 
                             ', Staff Count: ' || v_staff_count);
    END LOOP;
    
    CLOSE my_cursor;
END;


-- Les 8
SET SERVEROUTPUT ON;
DECLARE
    lname VARCHAR2(15);
BEGIN
    SELECT last_name INTO lname FROM employees WHERE first_name = 'John';
    DBMS_OUTPUT.PUT_LINE('John''s last name is: ' || lname);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Your select statement retrieved multiple rows. Consider using a cursor.');
END;

SET SERVEROUTPUT ON;
DECLARE
    insert_excep EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_excep, -01400);
BEGIN
    INSERT INTO departments(department_id, department_name) VALUES (280, NULL);
EXCEPTION
    WHEN insert_excep THEN
        DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

DECLARE
    error_code NUMBER;
    error_message VARCHAR2(255);
BEGIN
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        error_code := SQLCODE;
        error_message := SQLERRM;
        DECLARE
            PRAGMA AUTONOMOUS_TRANSACTION;
        BEGIN
            INSERT INTO errors (e_user, e_date, error_code, error_message) 
            VALUES (USER, SYSDATE, error_code, error_message);
            COMMIT;
        END;
END;

SET SERVEROUTPUT ON;
ACCEPT deptno NUMBER PROMPT 'Please enter the department number: ';
ACCEPT name CHAR PROMPT 'Please enter the department name: ';
DECLARE
    invalid_department EXCEPTION;
    v_name VARCHAR2(20) := '&name';
    v_deptno NUMBER := &deptno;
BEGIN
    UPDATE departments
    SET department_name = v_name
    WHERE department_id = v_deptno;
    
    IF SQL%NOTFOUND THEN
        RAISE invalid_department;
    END IF;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Department updated successfully.');
EXCEPTION
    WHEN invalid_department THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: No such department ID.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

SET SERVEROUTPUT ON;
DECLARE
    x NUMBER := 2;
    y NUMBER := 0;
    ZERO_DIV EXCEPTION;
BEGIN
    IF y = 0 THEN
        RAISE ZERO_DIV;
    END IF;

    DBMS_OUTPUT.PUT_LINE(x / y);
EXCEPTION
    WHEN ZERO_DIV THEN
        DBMS_OUTPUT.PUT_LINE('Custom Error: Division by zero is not allowed');
END;



-- Les 9
CREATE TABLE dept AS SELECT * FROM departments WHERE 1=0;

CREATE OR REPLACE PROCEDURE add_dept IS
    dept_id dept.department_id%TYPE;
    dept_name dept.department_name%TYPE;
BEGIN
    dept_id := 280;
    dept_name := 'ST-Curriculum';

    INSERT INTO dept(department_id, department_name)
    VALUES (dept_id, dept_name);

    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row.');
    COMMIT;
END;

BEGIN
    add_dept;
END;

SELECT department_id, department_name FROM dept WHERE department_id = 280;

CREATE FUNCTION check_sal RETURN BOOLEAN IS
    dept_id employees.department_id%TYPE;
    empno employees.employee_id%TYPE;
    sal employees.salary%TYPE;
    avg_sal employees.salary%TYPE;
BEGIN
    empno := 205;

    SELECT salary, department_id INTO sal, dept_id
    FROM employees WHERE employee_id = empno;

    SELECT AVG(salary) INTO avg_sal 
    FROM employees WHERE department_id = dept_id;

    IF sal > avg_sal THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;

SET SERVEROUTPUT ON;
BEGIN
    IF (check_sal IS NULL) THEN
        DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
    ELSIF (check_sal) THEN
        DBMS_OUTPUT.PUT_LINE('Salary > average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary < average');
    END IF;
END;

DROP FUNCTION check_sal;

SET SERVEROUTPUT ON;
BEGIN
    DECLARE
        result NUMBER;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Checking for employee with ID 205');
        result := check_sal(205);

        IF result IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
        ELSIF result = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Salary > average');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Salary < average');
        END IF;

        DBMS_OUTPUT.PUT_LINE('Checking for employee with ID 70');
        result := check_sal(70);

        IF result IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
        ELSIF result = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Salary > average');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Salary < average');
        END IF;
    END;
END;











