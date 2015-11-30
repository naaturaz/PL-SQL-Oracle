--A4
--MANUEL LOPEZ



SET SERVEROUTPUT ON SIZE 10000;
SET LINESIZE 5000;
SPOOL C:/TEMP/ML3.out REPLACE;
--CALLER
BEGIN
  --1
  DBMS_OUTPUT.PUT_LINE('1.	the addition of a new student for a faculty member that does not currently have any students');
  PRINT_SCREEN();
  INSERT INTO STUDENT VALUES
  ('KK100', 'Lola', 'Lulu', 'R', '1817 Eagleridge Circle', 'Tallahassee', 
  'FL', '32811', '7155559876', 'SR', TO_DATE('07/14/1985', 'MM/DD/YYYY'), 8891, 5, TO_YMINTERVAL('3-2'));
  PRINT_SCREEN();
  
  --2
  DBMS_OUTPUT.PUT_LINE('2.	the addition of a new student for a faculty member that already has students');
  PRINT_SCREEN();
  INSERT INTO STUDENT VALUES
  ('KK103', 'Kraig', 'Kroger', 'R', '1817 Eagleridge Circle', 'Tallahassee', 
  'FL', '32811', '7155559876', 'SR', TO_DATE('07/14/1985', 'MM/DD/YYYY'), 8891, 2, TO_YMINTERVAL('3-2'));
  PRINT_SCREEN();
  
  --3
  DBMS_OUTPUT.PUT_LINE('3.	the addition of a new faculty member');
  PRINT_SCREEN();
  INSERT INTO FACULTY VALUES(6, 'Luis', 'Perez', 'A', 9, 4014014011, 'Full', 1,
    6060, NULL);
  PRINT_SCREEN();
  
  --4
  DBMS_OUTPUT.PUT_LINE('4.	the change of a student’s advisor from one faculty member to another');
  PRINT_SCREEN();
  UPDATE STUDENT SET F_ID = 4 WHERE S_ID = 'JO100';
  PRINT_SCREEN();
  
  --5
  DBMS_OUTPUT.PUT_LINE('5.	the update of a student’s information for various columns');
  PRINT_SCREEN();
  UPDATE STUDENT SET S_FIRST = 'Tammie', S_LAST = 'Diaz' WHERE S_ID = 'JO100';
  PRINT_SCREEN();
  
  --6  
  DBMS_OUTPUT.PUT_LINE('6.	the update of a faculty member’s information for various columns');
  PRINT_SCREEN();
  UPDATE FACULTY SET F_FIRST = 'Theresa', F_LAST = 'Marks' WHERE F_ID = 1;
  PRINT_SCREEN();
    
  --6A
  DBMS_OUTPUT.PUT_LINE('6A.	the addition of a new student for a faculty member that already has students');
  PRINT_SCREEN();
  INSERT INTO STUDENT VALUES
  ('KK101', 'Jose', 'Berto', 'R', '1817 Eagleridge Circle', 'Tallahassee', 
  'FL', '32811', '7155559876', 'SR', TO_DATE('07/14/1985', 'MM/DD/YYYY'), 8891, 5, TO_YMINTERVAL('3-2'));
  PRINT_SCREEN();
    
  --7
  DBMS_OUTPUT.PUT_LINE('7.	the deletion of all of the students for a specific faculty member so that the materialized view table will contain a null-supplied student row for that faculty member.');
  PRINT_SCREEN();
  DELETE FROM STUDENT WHERE S_ID = 'KK100'; 
  DELETE FROM STUDENT WHERE S_ID = 'KK101';
  PRINT_SCREEN();
    
  ROLLBACK;  
    
END;