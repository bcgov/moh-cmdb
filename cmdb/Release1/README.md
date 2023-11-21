# moh-cmdb
The scripts that have been added are to do conversions between some of the classes or insert many vlaues into a table.
To import scripts you just need to download them and run them in a command prompt
Running Conversion Script in Postgres
•	Start windows command prompt
•	Navigate to bin folder of your installed PostgreSQL 
o	For example: C:\Program Files\PostgreSQL\10\bin
•	Enter the command to start the plSQL
o	Cd < C:\Program Files\PostgreSQL\10\bin >
o	psql -U postgres -h localhost -d <mydatabase>
•	execute the script you have written using a command similar to below
o	\i <path to my script>
o	Note you will have to use forward slashes in your path otherwise you will get a permission error
