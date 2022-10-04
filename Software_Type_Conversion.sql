DO $$

DECLARE
rec_version 			Record;

v_code       			varchar;
v_vendor_id       		integer;

cur_version CURSOR FOR
           select distinct rtrim(upper(ve."Software")) sftware, ve."Vendor" from public."Software_2" ve
           where ve."Status"= 'A'
		   ORDER BY sftware ASC ;
		   
begin 

open cur_version;
loop
    -- fetch row into the organization record
      FETCH cur_version INTO rec_version;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;


RAISE NOTICE '%', 'Code-----------------------'||rec_version."sftware";
RAISE NOTICE '%', 'Description----------------'||rec_version."sftware";
RAISE NOTICE '%', 'Vendor---------------------'||rec_version."Vendor";


INSERT INTO public."Software_Type"(
	 "Code", "Description", "Vendor")
	VALUES (rec_version."sftware", rec_version."sftware", rec_version."Vendor");

begin
EXCEPTION when others then
RAISE NOTICE '%', 'commit failure';
commit;
end;


end loop;
close cur_version;
end; $$