select distinct
		 a."Acronym",
		 a."Description",
		ai."Description" as "Environment",
		 o."Code" as "Organization",
--		 t."Code" as "Division",
		i2."Code",
		i2."Email"
from public."Application" a
	 left outer join public."Individual" i2
		 on i2."Id"=a."CGIBSL"
		 or i2."Id"=a."MOHSME"
		 or i2."Id"=a."MOHSBC"
		 or i2."Id"=a."CGITL"
		 and i2."Status"='A'
		 and a."Status"='A'
	 left outer join public."Organization" o 
	     on o."Id"=a."Organization"
	     and o."Status"='A'
	     and a."Status"='A',
	 public."AppInstance" ai,
	 public."AppDependency" ad,
--	 public."Organization" o,
	 public."Team" t
where a."Id"=ai."Application"
and   ai."Id"=ad."PrimaryApplication"
--and    o."Id"=a."Organization"
--and    t."Id"=a."Division"
and   ai."Status"='A'
and   ad."Status"='A'
and   ad."SecondaryApplication"= (select ai2."Id" 
									from  public."Application" a2, 
										  public."AppInstance" ai2
									where a2."Acronym"='Keycloak' 
									and	  ai2."Application"=a2."Id"
									and   ai2."EnvironmentType"=(select   "Id" 
																	from  public."LookUp" l
																	where l."Id"=ai2."EnvironmentType" 
																	and   l."Code"='Production')
									and   a2."Status" = 'A'
									and   ai2."Status" ='A')
/*union 									
select distinct
	ind."Code",
	ind."Email"
from public."Application" app
	left outer join public."Individual" ind
		 on ind."Id"=app."CGIBSL"
		 or ind."Id"=app."MOHSME"
		 or ind."Id"=app."MOHSBC"
		 or ind."Id"=app."CGITL"
		 and ind."Status"='A'
		 and app."Status"='A'
where app."Acronym"='Keycloak'
and app."Status"='A'
and ind."Status"='A'
*/
