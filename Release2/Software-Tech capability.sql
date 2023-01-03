create view "Software-Tech capability" as
select 
	 (select "Description" from public."LookUp" where public."LookUp"."Id"=st."Vendor" ) ||'-'|| st."Code"  as "Software",
	 pc."Code" as "Primary Capability",
	 sc."Code" as "Secondary Capability",
	 (select "Description" from public."LookUp" where public."LookUp"."Id"=st."RadarType") as "Maturity"
from public."Software_Infra" si,
	 public."SoftwareType" st,
	 public."Software_2" sv,
	 public."PrimaryCapability" pc,
	 public."SecondaryCapability" sc
where si."Status"='A'
and   sv."Id"=si."Software"
and   st."Id"=sv."SoftwareType"
and   sc."Id"=st."SecondaryCapability"
and   pc."Id"=sc."PrimaryCapability"