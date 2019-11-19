#
# ECE356 - Lab 3
# Fall 2019

# Modify this file to achieve the requirements listed in Part 2 of the Lab 3
# specifications. Package it up with the other SQL files using the provided
# package.sh script, and submit the resulting tar.gz file.
#
# The entirety of this script will be run and the resulting databaes will be
# analyzed to determine the correctness of your implementation, and whether you
# performed the decomposition correctly.

DROP PROCEDURE IF EXISTS sp_pay_raise_kitchener;
DROP PROCEDURE IF EXISTS check_salary;
DELIMITER //

CREATE PROCEDURE check_salary()
BEGIN    
        IF (EXISTS(SELECT empID FROM Employee NATURAL JOIN Department WHERE Department.locID = 2 AND Employee.salary > 50000)) THEN ROLLBACK;  
        ELSE COMMIT;
        END IF;
END; //      
      
CREATE PROCEDURE sp_pay_raise_kitchener()
BEGIN
    SET autocommit = 0;
    UPDATE Employee SET Salary = Salary*1.03 WHERE empID IN (SELECT empID FROM (SELECT empID FROM Employee NATURAL JOIN Department WHERE locID = 2) as eID);
    CALL check_salary(); 
    SET autocommit = 1;
END; //
DELIMITER ;
