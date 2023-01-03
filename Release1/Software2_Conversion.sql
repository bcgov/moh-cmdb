DO $$

DECLARE
rec_ty 			Record;


v_software_id       	integer;

cur_version CURSOR FOR
       select  rtrim(upper(ve."Software")) sftware, ve."Vendor",ve."Id" from public."Software_2" ve
           where ve."Status"= 'A';
		   
begin 

open cur_version;
loop
    -- fetch row into the organization record
      FETCH cur_version INTO rec_ty;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;

  select ty."Id" 
  into v_software_id
  from public."Software_Type" ty
  where ty."Status"= 'A'
  and rec_ty."sftware" = ty."Code";

		
RAISE NOTICE '%', 'rec_ty."sftware"-----------------------'||rec_ty."sftware";
RAISE NOTICE '%', 'v_software_id----------------'||v_software_id;
RAISE NOTICE '%', 'Vendor---------------------'||rec_ty."Vendor";
RAISE NOTICE '%', 'Id---------------------'||rec_ty."Id";


update public."Software_2" 
set "SoftwareType" = v_software_id
where "Id" = rec_ty."Id" ;


begin
EXCEPTION when others then
RAISE NOTICE '%', 'commit failure';
commit;
end;



end loop;
close cur_version;
end; $$
