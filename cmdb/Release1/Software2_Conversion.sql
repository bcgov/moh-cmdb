DO $$

DECLARE
rec_ty 			Record;

v_software_id       	integer;
v_code					varchar;



cur_2 CURSOR FOR
       select * from public."SoftwareType"
		where "Status" = 'A';

cur_version CURSOR FOR
       select  rtrim(upper(ve."Software")) sftware, ve."Vendor",ve."Id" from public."Software_2" ve
           where ve."Status"= 'A';
		   
begin 

-------------------------------------------------------------------
open cur_2;
	loop
			-- fetch row into the organization record
			  FETCH cur_2 INTO rec_ty;
			-- exit when no more row to fetch
			  EXIT WHEN NOT FOUND;


		RAISE NOTICE '%', 'Code"-----------------------'||rec_ty."Code";
		RAISE NOTICE '%', 'Id----------------'||rec_ty."Id";

		v_code = rec_ty."Code"|| '-' || '0';

		INSERT INTO public."Software_2"("Code", "Description", "SoftwareType", "EndOfSupport", "Version")
								 VALUES (v_code, v_code, rec_ty."Id", '2030-12-31', '0');


		begin
		EXCEPTION when others then
		RAISE NOTICE '%', 'commit failure';
		commit;
		end;


	end loop;
close cur_2;



-----------------------------------------------------------


open cur_version;
	loop
			-- fetch row into the organization record
			  FETCH cur_version INTO rec_ty;
			-- exit when no more row to fetch
			  EXIT WHEN NOT FOUND;

		  select ty."Id" 
		  into v_software_id
		  from public."SoftwareType" ty
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
