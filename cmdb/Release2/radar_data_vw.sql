--CREATE OR REPLACE VIEW public."RADAR_Data" AS 
select  st."Code",
		( SELECT "LookUp"."Description"
           FROM "LookUp"
           WHERE "LookUp"."Id" = st."RadarType") AS "RadarType",
		( SELECT "LookUp"."Description"
           FROM "LookUp"
           WHERE "LookUp"."Id" = st."RadarQuadrant") AS "RadarQuadrant",
		CASE
            WHEN st."New" IS NOT NULL THEN 'Yes'::text
            ELSE 'No'::text
        END AS "New",
		st."QuadrantDescription"
from public."SoftwareType" st
where st."Status"='A'