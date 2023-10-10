DECLARE
   c_id employees.EMPLOYEE_ID%TYPE;
   c_name employees.FIRST_NAME%TYPE;
   c_em employees.email%type;
   CURSOR c_employees is
      SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL FROM employees;
BEGIN
   OPEN c_employees;
   LOOP
   FETCH c_employees into c_id, c_name, c_em;
   dbms_output.put_line(c_id || ' ' || c_em);
   EXIT WHEN c_employees%notfound;
   END LOOP;
   CLOSE c_employees;
END;




DECLARE
  employees_rec employees%rowtype;
BEGIN
   SELECT * INTO employees_rec
   FROM employees
   WHERE employee_id= 150;
   
   dbms_output.put_line('employees_ID: ' || employees_rec.employee_id);
   dbms_output.put_line('employees_name: ' || employees_rec.first_name);
   dbms_output.put_line('employees_salary: ' || employees_rec.salary);
END;

DECLARE
  CURSOR employees_cur IS
      SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL
      FROM employees;
  employees_rec employees_cur%rowtype;
BEGIN
  OPEN employees_cur;
  LOOP
  FETCH employees_cur into employees_rec;
  EXIT WHEN employees_cur%notfound;
  dbms_output.put_line(employees_rec.EMPLOYEE_ID || ' ' || employees_rec.FIRST_NAME);
  END LOOP;
END;
    





DECLARE
  a number;
  b number;
  c NUMBER;
FUNCTION findSum(x IN number, z IN number )
RETURN NUMBER IS 
  c NUMBER(2) := 0;
BEGIN          
   c := x + z;
end;




BEGIN
  a := 5;
  b := 10;
  findSum (c);
  dbms_output.put_line('the total is : ' || c );
END;


create or replace FUNCTION g_goal(c_ID varchar2 )
RETURN number IS
    r_id number :=0;
BEGIN
     select REGION_ID INTO r_id
     FROM COUNTRIES
     WHERE COUNTRY_ID = c_ID;
EXCEPTION 
     WHEN no_data_found THEN
       RETURN 0;
       WHEN others THEN 
       RETURN 100;

RETURN r_id;
END;



SET SERVEROUTPUT ON

BEGIN
 dbms_output.put_line( g_goal('IT'));
END;











