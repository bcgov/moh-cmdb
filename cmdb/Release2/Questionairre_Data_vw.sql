public."Questionairre_Data" source

--CREATE OR REPLACE VIEW public."Questionairre_Data" AS 
SELECT a."Acronym" AS "Application",
    q."Category",
    q."SubCategory",
    q."Description" AS "Title",
    q."QuestionDescription" AS "Description",
    q."Rating",
        CASE
            WHEN a."PlannedInitiative" IS NOT NULL THEN 'Yes'::text
            ELSE 'No'::text
        END AS "Planned Initiatives",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = as2."Answers") AS "Score",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_AppInsight") AS app_insight,
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_ClientStatis") AS "Client_Satisfaction",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_TCO") AS "TCO",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_FinRisk") AS "Fin_Risk",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_Functional") AS "Functional",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_Complex") AS "Complexity",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_ArchRisk") AS "Arch_Risk",
    ( SELECT "LookUp"."Description"
           FROM "LookUp"
          WHERE "LookUp"."Id" = q."YN_Support") AS "Supportability",
    ( SELECT i."Description"
           FROM "Individual" i
          WHERE i."Id" = a."MOHSBC") AS "SBC",
    as2."Date",
    a."APODetails" AS "History"
   FROM "Application" a,
    "ApplicationSurvey" as2,
    "Questions" q
  WHERE as2."Status" = 'A'::bpchar AND a."Id" = as2."Application" AND q."Id" = as2."Questions";
