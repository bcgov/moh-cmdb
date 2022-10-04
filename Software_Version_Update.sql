DO $$

DECLARE
rec_ty 			Record;

v_code					varchar;

cur_version CURSOR FOR
       select * from public."Software_Type"
		where "Status" = 'A';
		   
begin 

open cur_version;
loop
    -- fetch row into the organization record
      FETCH cur_version INTO rec_ty;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;


RAISE NOTICE '%', 'Code"-----------------------'||rec_ty."Code";
RAISE NOTICE '%', 'Id----------------'||rec_ty."Id";

v_code = rec_ty."Code"|| '-' || '0';

INSERT INTO public."Software_2"(
	"Code", "Description", "SoftwareType", "EndOfSupport", "Version")
	VALUES (v_code, v_code, rec_ty."Id", '2030-12-31', '0');


begin
EXCEPTION when others then
RAISE NOTICE '%', 'commit failure';
commit;
end;



end loop;
close cur_version;
end; $$