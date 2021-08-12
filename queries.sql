Select all columns for all employees.

SELECT * FROM "Employees"

+-----------------+----------+--------------------------+------------------+--------------+
| FullName        | Salary   | JobPosition              | PhoneExtension   | IsPartTime   |
|-----------------+----------+--------------------------+------------------+--------------|
| Jim Smith       | 200      | Cook                     | 3582             | False        |
| Sally Turnbole  | 450      | Dishwasher               | 2212             | True         |
| Lazy Larry      | 200      | Cook                     | 7781             | False        |
| Sally Jesse     | 1000     | CFO                      | 1134             | False        |
| Gerry Sizemore  | 140      | Administrative Assistant | 5102             | True         |
| Coco Jenkins    | 100      | Cook                     | 2850             | True         |
| Ursa LaMore     | 125      | Dishwasher               | 1151             | True         |
| Danny Highwater | 100      | Host                     | 2019             | False        |
| Anita Shotz     | 179      | Hostess                  | 2112             | True         |
| Harry Truman    | 789      | CEO                      | 7820             | False        |
+-----------------+----------+--------------------------+------------------+--------------+

Select only the full names and phone extensions for only full-time employees.

CompanyDatabase> SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'False';
+-----------------+------------------+
| FullName        | PhoneExtension   |
|-----------------+------------------|
| Sally Jesse     | 1134             |
| Danny Highwater | 2019             |
| Harry Truman    | 7820             |
| Jim Smith       | 3582             |
+-----------------+------------------+

Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.

CompanyDatabase> INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
................ VALUES ('Lily McNally', 450, 'Software Developer', 2100, 'True');

Update all employees that are cooks to have a salary of 500.

UPDATE "Employees"
SET "Salary" = 500
WHERE "JobPosition" = 'Cook';

Delete all employees that have the full name of "Lazy Larry".

DELETE
FROM "Employees"
WHERE "FullName" = 'Lazy Larry';

Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.

ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

******WEDNESDAY HOMEWORK******

In your CompanyDatabase, add a table named Departments with the following columns:
Id as a primary key
DepartmentName as text
Building as text

CREATE TABLE "Departments" ("Id" Serial Primary Key, "DepartmentName" TEXT);

Forgot the Builing column so Altered Table:

ALTER TABLE "Departments" ADD COLUMN "Building" TEXT;

Add a Foreign key DepartmentId to your Employees Table. If you have trouble, remove the existing employees by running truncate table "Employees".

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

Add tables named Products and Orders.
Products should have the columns
Id as a primary key
Price as a data type that can store a number with decimal places (e.g. 45.12)
Name as textual data
Description as textual data
QuantityInStock as a data type that can store a number WITHOUT decimal places (e.g. 42)

CREATE TABLE "Products" ("Id" Serial Primary Key,"Price" DECIMAL,"Name" TEXT,"Description" TEXT,"QuantityInStock" INT);

Orders should have the columns
Id as a primary key
OrderNumber as textual data
DatePlaced as a data type that can store a date (with Year, Month, and Day) -- or one with hours, minutes, and seconds. Student's choice.
Email as textual data

CREATE TABLE "Orders" ("Id" Serial Primary Key,"OrderNumber" TEXT,"DatePlaced" DATE,"Email" TEXT);

In our company, one Order can have many Products and one Product can have many Orders. This will be a Many-to-Many relationship. Create the necessary table ProductOrders, foreign keys, and the OrderQuantity field needed for this to happen.
[ ] Create queries that can do the following:

CREATE TABLE "ProductOrders" ("Id" Serial Primary Key,"OrderQuantity" INTEGER,"OrderId" INTEGER NULL REFERENCES "Orders" ("Id"), "ProductID" INTEGER NULL REFERENCES "Products" ("Id"));

Insert the following Departments
Department Name	Building
Development	Main
Marketing	North

INSERT INTO "Departments" ("DepartmentName","Building") VALUES ('Development','Main');
INSERT INTO "Departments" ("DepartmentName","Building") VALUES ('Marketing','North');

Insert the following Employees
FullName	Salary	JobPosition	PhoneExtension	IsPartTime	Department Id
Tim Smith	40000	Programmer	123	false	1
Barbara Ramsey	80000	Manager	234	false	1
Tom Jones	32000	Admin	456	true	2

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Barbara Ramsey', 80000, 'Programmer', 123, 'false', 1);
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Tim Smith', 40000, 'Programmer', 123, 'false', 1);
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId") VALUES ('Tom Jones', 32000, 'Admin', 456, 'true', 2);

Insert the following Products

Price	Name	Description	QuantityInStock
12.45	Widget	The Original Widget	100
99.99	Flowbee	Perfect for haircuts	3

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES (12.45, 'Widget', 'The Original Widget', 100);
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock") VALUES (99.99, 'Flowbee', 'Perfect for Haircuts', 3);

[ ] Insert a new order with order number X529, placed on Jan 1st, 2020 at 4:55PM, by someone with the email address "person@example.com"

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email") VALUES ('X529', DATE '2020-01-01', 'person@example.com');

[ ] Add an order quantity of 3 for the product named Widget to the order X529

INSERT INTO "Product Orders" ("OrderQuantity", "OrderId", "ProductID") VALUES (3, 1, 1);

[ ] Add an order quantity of 2 for the product named Flowbee to the order X529

INSERT INTO "ProductOrders" ("OrderQuantity", "OrderId", "ProductID") VALUES (2, 1, 2);

[ ] Given a building, return all employees that work in that building. 
Show this query for buildings named North Side, East Side, and finally a building 
that you actually have in your data -- even if your data doesn't have any departments 
in those buildings. NOTE this means you cant manually look up Ids and use them, you 
have to let SQL do that work. (Hint: JOIN)

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'North';

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'East';

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'Main';

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"

[ ] Find all orders that contain the product id of 2.

SELECT *
FROM "Product Orders"
WHERE "ProductID" = (2);


[ ] Find the quantity of the Flowbee product from order with order number X529. 
You may not write the value of an Id in your query, let SQL do the work (HINT: JOIN)

FROM SELECT "ProductOrders"."OrderQuantity"
FROM "ProductOrders"
JOIN "Orders" ON "ProductOrders"."OrderId" = "Orders"."Id"
JOIN "Products" ON "ProductOrders"."ProductID" = "Products"."Id";





