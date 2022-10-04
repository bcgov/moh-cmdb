INSERT INTO public."LookUp"(
	"Code", "Description", "Type", "Index", "Config")
	VALUES ('t7g.micro', 't7g.micro', "CloudInstanceClass", 3, '{"cm_dms_allowed_extensions": ""}');
	
	Select * from public."LookUp"
	where "Status" = 'A'
	and "Type" = 'CloudInstanceClass'