CREATE TRIGGER _cm3_copy_code_to_decription
    BEFORE INSERT OR UPDATE 
    ON public."Account"
    FOR EACH ROW
    EXECUTE FUNCTION public._cm3_trigger_general_code_to_description();
	
CREATE TRIGGER _cm3_copy_code_to_decription
    BEFORE INSERT OR UPDATE 
    ON public."Cloud"
    FOR EACH ROW
    EXECUTE FUNCTION public._cm3_trigger_general_code_to_description();
	
	
	--I think this is the code to "Update" the software global trigger-- 
CREATE OR REPLACE FUNCTION public._cm3_trigger_software_description()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
Declare
v_software	 varchar;

BEGIN

SELECT "Code" 
        into v_software
        FROM public."SoftwareType"
        where "Id" = NEW."SoftwareType";
     NEW."Description" = v_software||'-'|| NEW."Version";
     RETURN NEW;
END 
$BODY$;

ALTER FUNCTION public._cm3_trigger_software_description()
    OWNER TO cmdbprd;
