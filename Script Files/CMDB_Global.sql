SELECT app."Acronym" ApplicationName,
       srv."Description",
	   app."AMSContract",
       app."Description" ApplicationDesc,
       app."About" About,
       hostProvider."Code" HostProvider, 
       hostType."Code" HostType,
    (select "Description" from public."LookUp" AppType where AppType."Id" = app."Type") as applicationType, 
	(select "Description" from public."Organization" org where org."Id" = app."Organization") as organization,
	(select "Description" from public."Team" org where org."Id" = app."Division") as division,
	(select "Description" from public."Account" acct where acct."Id" = cld."CloudAccount") as account,
	(select "Description" from public."LookUp" where "Id" = env."EnvironmentType") as environment,
	(select "Description" from public."LookUp" where public."LookUp"."Id"=app."AppStatus") as "Application Status",
	(select "Description" from public."LookUp" where public."LookUp"."Id"=env."InstStatus" ) as "App Instance Status",
	(select "Description" from public."Party" where public."Party"."Id"=app."MOHSBC" ) as "SBC",
	(select "Description" from public."Party" where public."Party"."Id"=app."CGISupTeamPrimary" ) as "CGISupTeamPrimary",
	(select "Description" from public."Party" where public."Party"."Id"=app."MOHSME" ) as "MOHSME",
	(select "Description" from public."LookUp" vendor where vendor."Id" = sftype."Vendor" and vendor."Status" = 'A' ) as "SoftwareVendor",
	(select "StorageAmount" from  public."LookUp" l	 where sftstorage."StorageType"=l."Id"  and l."Status"='A' AND l."Code"='Tier2RAID10SAN') as "Tier2RAID10SAN",
	  env."Description",
	  softin."Description" as softinDesc,
	  softver."Version",
	  sftype."Description" as sfTypeDesc,
	  auth."Description"
FROM  public."LookUp" hostProvider
INNER JOIN public."LookUp" hostType ON hostProvider."ParentId" = hostType."Id" AND hostType."Type" = 'HostingTypes' AND hostType."Status" = 'A'
INNER JOIN public."Application" app ON hostProvider."Id" = ANY (app."HostingProvider") AND app."Status" = 'A'
INNER JOIN public."LookUp" auth ON auth."Id" = ANY (app."ApplicationIDP") AND app."Status" = 'A'
LEFT OUTER JOIN public."AppInstance" env ON app."Id" = env."Application" AND env."Status" = 'A'
LEFT OUTER join public."Map_APPINS_TO_INFRA" apin on apin."IdObj1" = env."Id" and apin."Status" = 'A'
LEFT OUTER join public."Software_Infra" softin on apin."IdObj2" = softin."Id" and apin."Status" = 'A'
LEFT OUTER JOIN public."Software_2" softver on softver."Id"  = softin."Software" and softver."Status" = 'A'
LEFT OUTER JOIN public."SoftwareType" sftype on sftype."Id" = softver."SoftwareType" and sftype."Status" = 'A'
LEFT OUTER JOIN public."Server" srv on srv."Id" = softin."Server" and srv."Status" = 'A'
LEFT OUTER JOIN public."Cloud" cld on srv."Id" = cld."Id" and cld."Status" = 'A'
LEFT OUTER JOIN public."Storage" sftstorage on sftstorage."ServerStorage" = softin."Id" and sftstorage."Status" = 'A'
WHERE hostProvider."Type" = 'HostingProvider'  AND hostProvider."Status" = 'A'
