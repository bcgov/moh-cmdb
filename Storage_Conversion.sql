DO $$

Declare
rec_server  			Record;

v_Tier2RAID10SAN        integer;
v_Tier2RAID5SAN         integer;
v_Tier3RAID5SAN         integer;
v_StorageAmountCD_id    integer;
v_counter      			integer;
v_code       			varchar;

cur_server CURSOR FOR
           select * from public."Server" se
           where se."Status"= 'A';
		   

begin

OPEN cur_server;
LOOP
    -- fetch row into the organization record
      FETCH cur_server INTO rec_server;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;

--Place the storage attributes from the server class in their own row in the Storage table
--Ignore the row when they are null
--Ignore the rows with value of zero
--the storage size are all in GB so default to this value (you will need to look this code value up from the lookup table and place it in a tempoaray variable) - StorageAnountCD

if v_StorageAmountCD_id is null then
		SELECT l."Id" 
		into v_StorageAmountCD_id
		FROM public."LookUp" l
		where l."Code" = 'GB'
		and l."Type" = 'StorageUnits'
		and l."Status" = 'A';
	end if;	
		
if v_Tier2RAID10SAN is null then		
		SELECT l."Id" 
		into v_Tier2RAID10SAN
		FROM public."LookUp" l
		where l."Code" = 'Tier2RAID10SAN'
		and l."Type" = 'StorageType'
		and l."Status" = 'A';
	end if;	
		
if v_Tier2RAID5SAN is null then	
		SELECT l."Id" 
		into v_Tier2RAID5SAN
		FROM public."LookUp" l
		where l."Code" = 'Tier2RAID5SAN'
		and l."Type" = 'StorageType'
		and l."Status" = 'A';
	end if;
		
if v_Tier3RAID5SAN is null then		
		SELECT l."Id" 
		into v_Tier3RAID5SAN 
		FROM public."LookUp" l
		where l."Code" = 'Tier3RAID5SAN'
		and l."Type" = 'StorageType'
		and l."Status" = 'A';
	end if;	

-- need to lookup the three StorageTypes from the lookup table - this will need three more queries and variables simialr to above

--how should we create the code and Description? lets use the server code concatenated with a counter.  for example Abacus-1,Abacus-2,Ancho-1,Berwick-1,Berwick-2,Berwick-3
v_counter = 0;


if rec_server."Tier2RAID10SAN" is not null or rec_server."Tier2RAID10SAN">0 then--do my insert

v_counter  = v_counter +1;
v_code = rec_server."Code"||'-'||v_counter;

RAISE NOTICE '%', 'Code-----------------------'||v_code;
RAISE NOTICE '%', 'Description----------------'||v_code;
RAISE NOTICE '%', 'StorageLink----------------'||rec_server."Id";
RAISE NOTICE '%', 'StorageType----------------'||v_Tier2RAID10SAN;
RAISE NOTICE '%', 'StorageAmount--------------'||rec_server."Tier2RAID10SAN";
RAISE NOTICE '%', 'StorageUnits--------'||v_StorageAmountCD_id;



INSERT INTO public."Storage"(
	 "Code", "Description", "ServerStorage","StorageType", "StorageAmount", "StorageUnits")
	VALUES (v_code, v_code, rec_server."Id", v_Tier2RAID10SAN, rec_server."Tier2RAID10SAN", v_StorageAmountCD_id);

end if;

if rec_server."Tier2RAID5SAN" is not null or rec_server."Tier2RAID5SAN">0 then--do my insert

v_counter  = v_counter +1;
v_code = rec_server."Code"||'-'||v_counter;

INSERT INTO public."Storage"(
	 "Code", "Description", "ServerStorage","StorageType", "StorageAmount", "StorageUnits")
	VALUES (v_code, v_code, rec_server."Id", v_Tier2RAID5SAN, rec_server."Tier2RAID5SAN", v_StorageAmountCD_id);

end if;


if rec_server."Tier3RAID5SAN" is not null or rec_server."Tier3RAID5SAN">0 then--do my insert

v_counter  = v_counter +1;
v_code = rec_server."Code"||'-'||v_counter;

INSERT INTO public."Storage"(
	 "Code", "Description", "ServerStorage","StorageType", "StorageAmount", "StorageUnits")
	VALUES (v_code, v_code, rec_server."Id", v_Tier3RAID5SAN, rec_server."Tier3RAID5SAN", v_StorageAmountCD_id);

end if;


v_counter				= 0;
v_StorageAmountCD_id 	= NULL;
v_Tier2RAID10SAN		= NULL;
v_Tier2RAID5SAN 		= NULL;
v_Tier3RAID5SAN 		= NULL;


begin
EXCEPTION when others then
RAISE NOTICE '%', 'commit failure';
commit;
end;


END LOOP;
--commit;
close cur_server;


end;$$
