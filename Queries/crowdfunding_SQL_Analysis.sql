-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backers_count in descending order for each `cf_id` for the "live" campaigns. 
SELECT ca.cf_id, ca.backers_count
INTO backers_live
FROM campaign as ca
WHERE (ca.outcome = 'live')
ORDER BY backers_count DESC;

SELECT * FROM backers_live;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT ca.cf_id,
		ca.contact_id,
		ca.goal - ca.pledged AS "Remaining Goal Amount"
INTO live_campaigns
FROM campaign as ca
WHERE (ca.outcome = 'live')
ORDER BY "Remaining Goal Amount" DESC;

SELECT	co.first_name,
		co.last_name,
		co.email,
		lc."Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as co
	INNER JOIN live_campaigns as lc
		ON (co.contact_id = lc.contact_id)
ORDER BY "Remaining Goal Amount" DESC;	

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT ba.email,
		ba.first_name,
		ba.last_name,
		ba.cf_id,
		ca.company_name,
		ca.description,
		ca.end_date,
		ca.goal - ca.pledged AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS ba
	INNER JOIN campaign AS ca
		on(ca.cf_id = ba.cf_id)
WHERE (ca.outcome = 'live')
ORDER BY email DESC;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;













