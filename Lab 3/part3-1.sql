#
# ECE356 - Lab 3
# Fall 2019

# Modify this file to achieve the requirements listed in Part 3-1 of the Lab 3
# specifications. Package it up with the other SQL files using the provided
# package.sh script, and submit the resulting tar.gz file.
#
# The entirety of this script will be run and the resulting databaes will be
# analyzed to determine the correctness of your implementation, and whether you
# performed the decomposition correctly.

/* Part 3-1
a) Write your query to count the reviews written in May 2014. You should use the Review table and name the output column as count
b) Write the explain command to output the query execution plan for your query.
c) Add one index for each query that can improve the running time of your query according to your query execution plan.
d) Write the explain command.
*/

use yelp_db_small;

DROP INDEX IF EXISTS date;

#part a)
SELECT COUNT(*) as count from Review where date like '2014-05%';

#part b)
explain SELECT COUNT(*) as count from Review where date like '2014-05%';

#part c)
CREATE INDEX date on Review (date);

#part d)
explain SELECT COUNT(*) as count from Review where date like '2014-05%';


