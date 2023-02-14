select  i2."Id",
		i2."Code",
		i2."Email",
		a."Description" as "Application",
		ai."Description" as "Application Instance",
		ad."Description",
		a."CGIBSL",
		a."MOHSME",
		a."MOHSBC",
		a."CGITL"
from public."Application" a
	 left outer join public."Individual" i2
		 on i2."Id"=a."CGIBSL"
		 or i2."Id"=a."MOHSME"
		 or i2."Id"=a."MOHSBC"
		 or i2."Id"=a."CGITL"
		 or i2."Status"='A',
	 public."AppInstance" ai,
	 public."AppDependency" ad
where 
       a."Id"=ai."Application"
and   ai."Id"=ad."PrimaryApplication"
and    a."Status"='A'
and   ai."Status"='A'
and   ad."Status"='A'
and    a."Acronym"='SWT'
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
									
select a."CGIBSL",
		a."MOHSME",
		a."MOHSBC",
		a."CGITL"
from public."Application" a
where a."Acronym"='SWT'