#
# ECE356 - Lab 3
# Fall 2019

# Modify this file to achieve the requirements listed in Part 3-2 of the Lab 3
# specifications. Package it up with the other SQL files using the provided
# package.sh script, and submit the resulting tar.gz file.
#
# The entirety of this script will be run and the resulting databaes will be
# analyzed to determine the correctness of your implementation, and whether you
# performed the decomposition correctly.

/* Part 3-2
a) Write your query that lists the review count (review count) and average stars (avg starts) for this user in
the user table, as well as all the review ids (review ids), and business names (business names) assigned in each
review. You have to use User, Review, and Business tables in this query and use a join operation.
b) Write the explain command to output the query execution plan for your query.
c) Add one index for each query that can improve the running time of your query according to your query execution plan.
d) Write the explain command. */

use yelp_db_small;

DROP INDEX IF EXISTS user_id;

#part a)
select u.review_count, u.average_stars, r.review_id, b.name from User_data u, Review r,Business b where r.business_id=b.business_id AND r.user_id = u.user_id AND r.user_id = 'KGYM_D6JOkjwnzslWO0QHg';

#part b)
explain select u.review_count, u.average_stars, r.review_id, b.name from User_data u, Review r,Business b where r.business_id=b.business_id AND r.user_id = u.user_id AND r.user_id = 'KGYM_D6JOkjwnzslWO0QHg';

#part c)
CREATE INDEX user_id on Review (user_id);

#part d)
explain select u.review_count, u.average_stars, r.review_id, b.name from User_data u, Review r,Business b where r.business_id=b.business_id AND r.user_id = u.user_id AND r.user_id = 'KGYM_D6JOkjwnzslWO0QHg';
 
