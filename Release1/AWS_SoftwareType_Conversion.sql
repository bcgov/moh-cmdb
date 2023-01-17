DO $$
DECLARE
AWS		INTEGER;
BEGIN
SELECT * FROM public."LookUp"
INTO AWS
WHERE "Status"='A'
AND "Type"='Software Vendor'
AND "Description"='AWS';



INSERT INTO public."SoftwareType"(
	"Code", "Description", "Vendor")
	VALUES ('DocumentDB', 'DocumentDB', AWS);
INSERT INTO public."SoftwareType"(
	"Code", "Description", "Vendor")
	VALUES ('Batch', 'Batch', AWS);
INSERT INTO public."SoftwareType"(
	"Code", "Description", "Vendor")
	VALUES ('DynamoDB', 'DynamoDB', AWS);
INSERT INTO public."SoftwareType"(
	"Code", "Description", "Vendor")
	VALUES ('Detective', 'Detective', AWS); 
INSERT INTO public."SoftwareType"(
	"Code", "Description", "Vendor")
	VALUES ('Neptune', 'Neptune', AWS);
INSERT INTO public."SoftwareType"(
	"Code", "Description", "Vendor")
	VALUES ('Polly', 'Polly', AWS);


END; $$
