#
# ECE356 - Lab 3
# Fall 2019

# Modify this file to achieve the requirements listed in Part 1 of the Lab 3
# specifications. Package it up with the other SQL files using the provided
# package.sh script, and submit the resulting tar.gz file.
#
# The entirety of this script will be run and the resulting databaes will be
# analyzed to determine the correctness of your implementation.

DROP PROCEDURE IF EXISTS sp_pay_raise;

DELIMITER $$
CREATE PROCEDURE sp_pay_raise(IN inEmpId INT, IN inPercentageRaise DOUBLE(4,2), OUT errorCode INT)
BEGIN
	IF inPercentageRaise > 0.10 OR inPercentageRaise < 0.00 THEN SET errorCode = -1;
	ELSEIF NOT EXISTS (SELECT * FROM Employee WHERE empID = inEmpID) AND (inPercentageRaise < 0.10 AND inPercentageRaise > 0.00) THEN SET errorCode = -2;
	ELSEIF NOT EXISTS (SELECT * FROM Employee WHERE empID = inEmpID) AND NOT (inPercentageRaise < 0.10 OR inPercentageRaise > 0.00) THEN SET errorCode = -3;
	ELSE 
		UPDATE Employee SET salary = salary * (1 + inPercentageRaise) WHERE empID = inEmpID; 
		SET errorCode = 0;
	END IF;
	
END$$
DELIMITER ;
