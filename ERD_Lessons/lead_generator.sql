-- find all the clients(first and last name) billing amounts and charged date

SELECT clients.first_name, clients.last_name, billing.amount, billing.charged_datetime
FROM clients
JOIN billing ON clients.id = billing.clients_id;

-- list all domain names and elads (first and last name) for each site
SELECT sites.domain_name, leads.first_name, leads.last_name
FROM sites
JOIN leads ON sites.id = leads.sites_id;

-- JOIN ON MULTIPLE TABLES
-- Get the nams of the clienst, their domain names and the first names of all the leads generated from those sites. 
SELECT clients.first_name AS client_first, clients.last_name, sites.domain_name, leads.first_name AS Leads_first
FROM clients
JOIN sites ON clients.id = sites.clients_id
JOIN leads ON sites.id = leads.sites_id;


-- LEFT & RIGHT JOIN
-- List all the clients, their domain names and the first names of all the leads generated from those sites. 
SELECT clients.first_name, clients.last_name, sites.domain_name
FROM clients
LEFT JOIN sites ON clients.id = sites.clients_id;

-- GROUP ROWS
-- GROUP BY
-- SUM,MIN, MAX, AVG
-- FIND ALL THE CLIENTS (first and last name) and their total billing amounts
SELECT clients.first_name, clients.last_name, SUM(billing.amount)
FROM clients
JOIN billing ON clients.id = billing.clients_id
GROUP BY clients_id;

-- GROUP CONCAT
-- LIST ALL the domain names associated with each client 
SELECT GROUP_CONCAT(sites.domain_name) AS domains, clients.first_name, clients.last_name
FROM clients
JOIN sites ON clients.id = sites.clients_id
GROUP BY clients.id;

-- COUNT
SELECT COUNT(leads.id), sites.domain_name
FROM sites
JOIN leads ON sites.id = leads.sites_id
GROUP BY sites.id;