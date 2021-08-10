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

CompanyDatabase> SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'True';
+----------------+------------------+
| FullName       | PhoneExtension   |
|----------------+------------------|
| Sally Turnbole | 2212             |
| Gerry Sizemore | 5102             |
| Coco Jenkins   | 2850             |
| Ursa LaMore    | 1151             |
| Anita Shotz    | 2112             |
+----------------+------------------+

Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.

CompanyDatabase> INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
................ VALUES ('Lily McNally', 450, 'Software Developer', 2100, 'True');

Update all employees that are cooks to have a salary of 500.

UPDATE "Employees"
SET "Salary" = 500
WHERE "JobPosition" = 'Cook'

Delete all employees that have the full name of "Lazy Larry".



Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.