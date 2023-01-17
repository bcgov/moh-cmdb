--------------------Variables----------------------------
DO $$
DECLARE
value_0 		INTEGER;
value_0_5		INTEGER;
value_1			INTEGER;
value_1_5		INTEGER;
value_2			INTEGER;
value_2_5		INTEGER;
value_3			INTEGER;
value_3_5		INTEGER;
value_4 		INTEGER;
value_4_5		INTEGER;
value_5			INTEGER;
value_5_5		INTEGER;
value_6			INTEGER;
value_6_5		INTEGER;
value_7			INTEGER;
value_7_5		INTEGER;
value_8			INTEGER;
value_8_5		INTEGER;
value_9			INTEGER;
value_9_5		INTEGER;
value_10		INTEGER;

AIMS			INTEGER;
ALR				INTEGER;
CHARTWEB 		INTEGER;
CONNECT 		INTEGER;
CONNECTIONS		INTEGER;
EACL 			INTEGER;
EMAAHR 			INTEGER;
EMACCS 			INTEGER;
EMAED 			INTEGER;
EMARS 			INTEGER;
FMDB			INTEGER;
FMR 			INTEGER;
FTE 			INTEGER;
GIS 			INTEGER;
HARS 			INTEGER;
HCR 			INTEGER;
HEALTHLINK 		INTEGER;
HHSLIBRARY 		INTEGER;
HIM				INTEGER;
HNI_JMB 		INTEGER;
HNLDAP 			INTEGER;
HNSECURE		INTEGER;
HNWEB 			INTEGER;
HOOPC 			INTEGER;
HSCIS 			INTEGER;
INTRANET 		INTEGER;
LANFAX 			INTEGER;
LEARN 			INTEGER;
MIWT			INTEGER;
MOHWEB 			INTEGER;
MSTR 			INTEGER;
PCBL 			INTEGER;
PES 			INTEGER;
POWERBI 		INTEGER;
RURAL 			INTEGER;
SAS 			INTEGER;
SFDS 			INTEGER;
STOPOD 			INTEGER;
SURVEY 			INTEGER;
SWT 			INTEGER;
TAP 			INTEGER;
TPL 			INTEGER;
WELL 			INTEGER;

FER				INTEGER;
PHSS			INTEGER;
SVMC 			INTEGER;
BA 				INTEGER;
UECS			INTEGER;
AASG 			INTEGER;
CU 				INTEGER;
II 				INTEGER;
Quality 		INTEGER;
TF 				INTEGER;
CIHC			INTEGER;
CSL 			INTEGER;
IDO 			INTEGER;
Supportability 	INTEGER;
TCS 			INTEGER;
UC 				INTEGER;
WT 				INTEGER;
FC 				INTEGER;


BEGIN

SELECT "Id" FROM public."LookUp"
INTO value_0
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='0';

SELECT "Id" FROM public."LookUp"
INTO value_0_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='0.5';

SELECT "Id" FROM public."LookUp"
INTO value_1
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='1';

SELECT "Id" FROM public."LookUp"
INTO value_1_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='1.5';

SELECT "Id" FROM public."LookUp"
INTO value_2
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='2';

SELECT "Id" FROM public."LookUp"
INTO value_2_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='2.5';

SELECT "Id" FROM public."LookUp"
INTO value_3
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='3';

SELECT "Id" FROM public."LookUp"
INTO value_3_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='3.5';

SELECT "Id" FROM public."LookUp"
INTO value_4
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='4';

SELECT "Id" FROM public."LookUp"
INTO value_4_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='4.5';

SELECT "Id" FROM public."LookUp"
INTO value_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='5';

SELECT "Id" FROM public."LookUp"
INTO value_5_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='5.5';

SELECT "Id" FROM public."LookUp"
INTO value_6
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='6';

SELECT "Id" FROM public."LookUp"
INTO value_6_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='6.5';

SELECT "Id" FROM public."LookUp"
INTO value_7
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='7';

SELECT "Id" FROM public."LookUp"
INTO value_7_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='7.5';

SELECT "Id" FROM public."LookUp"
INTO value_8
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='8';

SELECT "Id" FROM public."LookUp"
INTO value_8_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='8.5';

SELECT "Id" FROM public."LookUp"
INTO value_9
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='9';

SELECT "Id" FROM public."LookUp"
INTO value_9_5
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='9.5';

SELECT "Id" FROM public."LookUp"
INTO value_10
WHERE "Type"='SurveyAnswers'
AND "Status"='A'
AND "Code"='10';


---------------Application ID-----------------------
SELECT "Id" FROM public."Application"
INTO AIMS
WHERE "Acronym"='AIMS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO ALR
WHERE "Acronym"='ALR'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO CHARTWEB
WHERE "Acronym"='CHARTWEB'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO CONNECT
WHERE "Acronym"='CONNECT'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO CONNECTIONS
WHERE "Acronym"='CONNECTIONS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO EACL
WHERE "Acronym"='EACL'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO EMAAHR
WHERE "Acronym"='EMAAHR'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO EMACCS
WHERE "Acronym"='EMACCS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO EMAED
WHERE "Acronym"='EMAED'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO EMARS
WHERE "Acronym"='EMARS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO FMDB
WHERE "Acronym"='FMDB'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO FMR
WHERE "Acronym"='FMR'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO FTE
WHERE "Acronym"='FTE'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO GIS
WHERE "Acronym"='GIS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HARS
WHERE "Acronym"='HARS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HCR
WHERE "Acronym"='HCR'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HEALTHLINK
WHERE "Acronym"='HEALTHLINK'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HHSLIBRARY
WHERE "Acronym"='HHSLIBRARY'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HIM
WHERE "Acronym"='HIM'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HNI_JMB
WHERE "Acronym"='HNI_JMB'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HNLDAP
WHERE "Acronym"='HNLDAP'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HNSECURE
WHERE "Acronym"='HNSECURE'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HNWEB
WHERE "Acronym"='HNWEB'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HOOPC
WHERE "Acronym"='HOOPC'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO HSCIS
WHERE "Acronym"='HSCIS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO INTRANET
WHERE "Acronym"='INTRANET'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO LANFAX
WHERE "Acronym"='LANFAX'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO LEARN
WHERE "Acronym"='LEARN'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO MIWT
WHERE "Acronym"='MIWT'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO MOHWEB
WHERE "Acronym"='MOHWEB'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO MSTR
WHERE "Acronym"='MSTR'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO PCBL
WHERE "Acronym"='PCBL'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO PES
WHERE "Acronym"='PES'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO POWERBI
WHERE "Acronym"='POWERBI'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO RURAL
WHERE "Acronym"='RURAL'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO SAS
WHERE "Acronym"='SAS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO SFDS
WHERE "Acronym"='SFDS'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO STOPOD
WHERE "Acronym"='STOPOD'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO SURVEY
WHERE "Acronym"='SURVEY'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO SWT
WHERE "Acronym"='SWT'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO TAP
WHERE "Acronym"='TAP'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO TPL
WHERE "Acronym"='TPL'
AND "Status"='A'
AND "AMSContract"='true';

SELECT "Id" FROM public."Application"
INTO WELL
WHERE "Acronym"='WELL'
AND "Status"='A'
AND "AMSContract"='true';

---------------Questions ID-----------------------
SELECT "Id" FROM public."Questions"
INTO FER
WHERE "Description"='Financial Exposure Risk'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO PHSS
WHERE "Description"='Public Health, Safety and Security'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO SVMC
WHERE "Description"='Strategic Value / Mission Criticality'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO BA
WHERE "Description"='Business Agility'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO UECS
WHERE "Description"='User Experience / Client Satisfaction'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO AASG
WHERE "Description"='Alignment with Architecture Standards and Guidelines'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO CU
WHERE "Description"='Complexity and Uncertainty'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO II
WHERE "Description"='Interfaces and Interdependencies'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO Quality
WHERE "Description"='Quality'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO TF
WHERE "Description"='Technology Fit'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO CIHC
WHERE "Description"='Cost of Infrastructure / Hosting Costs'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO CSL
WHERE "Description"='Cost of Specialty (Non-Voted) Licenses'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO IDO
WHERE "Description"='Incidents, Defects and Outages'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO Supportability
WHERE "Description"='Supportability'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO TCS
WHERE "Description"='Total Cost of Support'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO UC
WHERE "Description"='User Count'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO WT
WHERE "Description"='Website Traffic'
AND "Status"='A';

SELECT "Id" FROM public."Questions"
INTO FC
WHERE "Description"='Functional Coverage'
AND "Status"='A';

--------------------AIMS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', AIMS, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', AIMS, PHSS, value_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', AIMS, SVMC, value_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', AIMS, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', AIMS, UECS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', AIMS, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', AIMS, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', AIMS, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', AIMS, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', AIMS, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', AIMS, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', AIMS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', AIMS, IDO, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', AIMS, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', AIMS, TCS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', AIMS, UC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', AIMS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', AIMS, FC, value_2);
	
--------------------ALR----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', ALR, FER, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', ALR, PHSS, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', ALR, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', ALR, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', ALR, UECS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', ALR, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', ALR, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', ALR, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', ALR, Quality, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', ALR, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', ALR, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', ALR, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', ALR, IDO, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', ALR, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', ALR, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', ALR, UC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', ALR, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', ALR, FC, value_10);
	
--------------------CHARTWEB----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', CHARTWEB, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', CHARTWEB, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', CHARTWEB, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', CHARTWEB, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', CHARTWEB, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', CHARTWEB, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', CHARTWEB, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', CHARTWEB, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', CHARTWEB, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', CHARTWEB, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', CHARTWEB, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', CHARTWEB, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', CHARTWEB, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', CHARTWEB, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', CHARTWEB, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', CHARTWEB, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', CHARTWEB, WT, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', CHARTWEB, FC, value_10);
	
--------------------CONNECT----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', CONNECT, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', CONNECT, PHSS, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', CONNECT, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', CONNECT, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', CONNECT, UECS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', CONNECT, AASG, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', CONNECT, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', CONNECT, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', CONNECT, Quality, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', CONNECT, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', CONNECT, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', CONNECT, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', CONNECT, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', CONNECT, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', CONNECT, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', CONNECT, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', CONNECT, WT, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', CONNECT, FC, value_10);

--------------------CONNECTIONS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', CONNECTIONS, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', CONNECTIONS, PHSS, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', CONNECTIONS, SVMC, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', CONNECTIONS, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', CONNECTIONS, UECS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', CONNECTIONS, AASG, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', CONNECTIONS, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', CONNECTIONS, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', CONNECTIONS, Quality, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', CONNECTIONS, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', CONNECTIONS, CIHC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', CONNECTIONS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', CONNECTIONS, IDO, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', CONNECTIONS, Supportability, value_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', CONNECTIONS, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', CONNECTIONS, UC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', CONNECTIONS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', CONNECTIONS, FC, value_6);
	
--------------------EACL----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', EACL, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', EACL, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', EACL, SVMC, value_9_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', EACL, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', EACL, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', EACL, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', EACL, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', EACL, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', EACL, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', EACL, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', EACL, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', EACL, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', EACL, IDO, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', EACL, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', EACL, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', EACL, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', EACL, WT, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', EACL, FC, value_10);
	
--------------------EMAAHR----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', EMAAHR, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', EMAAHR, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', EMAAHR, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', EMAAHR, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', EMAAHR, UECS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', EMAAHR, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', EMAAHR, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', EMAAHR, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', EMAAHR, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', EMAAHR, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', EMAAHR, CIHC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', EMAAHR, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', EMAAHR, IDO, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', EMAAHR, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', EMAAHR, TCS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', EMAAHR, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', EMAAHR, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', EMAAHR, FC, value_8);
	
--------------------EMACCS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', EMACCS, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', EMACCS, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', EMACCS, SVMC, value_9_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', EMACCS, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', EMACCS, UECS, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', EMACCS, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', EMACCS, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', EMACCS, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', EMACCS, Quality, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', EMACCS, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', EMACCS, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', EMACCS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', EMACCS, IDO, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', EMACCS, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', EMACCS, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', EMACCS, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', EMACCS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', EMACCS, FC, value_6);
	
--------------------EMAED----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', EMAED, FER, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', EMAED, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', EMAED, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', EMAED, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', EMAED, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', EMAED, AASG, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', EMAED, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', EMAED, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', EMAED, Quality, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', EMAED, TF, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', EMAED, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', EMAED, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', EMAED, IDO, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', EMAED, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', EMAED, TCS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', EMAED, UC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', EMAED, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', EMAED, FC, value_6);
	
--------------------EMARS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', EMARS, FER, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', EMARS, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', EMARS, SVMC, value_8_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', EMARS, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', EMARS, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', EMARS, AASG, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', EMARS, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', EMARS, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', EMARS, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', EMARS, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', EMARS, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', EMARS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', EMARS, IDO, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', EMARS, Supportability, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', EMARS, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', EMARS, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', EMARS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', EMARS, FC, value_8);
	
--------------------FMDB----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', FMDB, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', FMDB, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', FMDB, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', FMDB, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', FMDB, UECS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', FMDB, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', FMDB, CU, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', FMDB, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', FMDB, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', FMDB, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', FMDB, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', FMDB, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', FMDB, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', FMDB, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', FMDB, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', FMDB, UC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', FMDB, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', FMDB, FC, value_4);
	
--------------------FMR----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', FMR, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', FMR, PHSS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', FMR, SVMC, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', FMR, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', FMR, UECS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', FMR, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', FMR, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', FMR, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', FMR, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', FMR, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', FMR, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', FMR, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', FMR, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', FMR, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', FMR, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', FMR, UC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', FMR, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', FMR, FC, value_10);
	
--------------------FTE----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', FTE, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', FTE, PHSS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', FTE, SVMC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', FTE, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', FTE, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', FTE, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', FTE, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', FTE, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', FTE, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', FTE, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', FTE, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', FTE, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', FTE, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', FTE, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', FTE, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', FTE, UC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', FTE, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', FTE, FC, value_10);
	
--------------------GIS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', GIS, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', GIS, PHSS, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', GIS, SVMC, value_9_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', GIS, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', GIS, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', GIS, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', GIS, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', GIS, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', GIS, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', GIS, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', GIS, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', GIS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', GIS, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', GIS, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', GIS, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', GIS, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', GIS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', GIS, FC, value_8);
	
--------------------HARS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HARS, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HARS, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HARS, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HARS, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HARS, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HARS, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HARS, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HARS, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HARS, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HARS, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HARS, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HARS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HARS, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HARS, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HARS, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HARS, UC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HARS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HARS, FC, value_8);
	
--------------------HCR----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HCR, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HCR, PHSS, value_9_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HCR, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HCR, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HCR, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HCR, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HCR, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HCR, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HCR, Quality, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HCR, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HCR, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HCR, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HCR, IDO, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HCR, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HCR, TCS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HCR, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HCR, WT, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HCR, FC, value_8);
	
--------------------HEALTHLINK----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HEALTHLINK, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HEALTHLINK, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HEALTHLINK, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HEALTHLINK, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HEALTHLINK, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HEALTHLINK, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HEALTHLINK, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HEALTHLINK, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HEALTHLINK, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HEALTHLINK, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HEALTHLINK, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HEALTHLINK, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HEALTHLINK, IDO, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HEALTHLINK, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HEALTHLINK, TCS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HEALTHLINK, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HEALTHLINK, WT, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HEALTHLINK, FC, value_8);
	
--------------------HHSLIBRARY----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HHSLIBRARY, FER, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HHSLIBRARY, PHSS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HHSLIBRARY, SVMC, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HHSLIBRARY, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HHSLIBRARY, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HHSLIBRARY, AASG, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HHSLIBRARY, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HHSLIBRARY, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HHSLIBRARY, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HHSLIBRARY, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HHSLIBRARY, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HHSLIBRARY, CSL, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HHSLIBRARY, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HHSLIBRARY, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HHSLIBRARY, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HHSLIBRARY, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HHSLIBRARY, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HHSLIBRARY, FC, value_8);
	
--------------------HIM----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HIM, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HIM, PHSS, value_5_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HIM, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HIM, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HIM, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HIM, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HIM, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HIM, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HIM, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HIM, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HIM, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HIM, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HIM, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HIM, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HIM, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HIM, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HIM, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HIM, FC, value_8);
	
--------------------HNI_JMB----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HNI_JMB, FER, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HNI_JMB, PHSS, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HNI_JMB, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HNI_JMB, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HNI_JMB, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HNI_JMB, AASG, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HNI_JMB, CU, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HNI_JMB, II, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HNI_JMB, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HNI_JMB, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HNI_JMB, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HNI_JMB, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HNI_JMB, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HNI_JMB, Supportability, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HNI_JMB, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HNI_JMB, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HNI_JMB, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HNI_JMB, FC, value_6);
	
--------------------HNLDAP----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HNLDAP, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HNLDAP, PHSS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HNLDAP, SVMC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HNLDAP, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HNLDAP, UECS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HNLDAP, AASG, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HNLDAP, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HNLDAP, II, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HNLDAP, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HNLDAP, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HNLDAP, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HNLDAP, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HNLDAP, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HNLDAP, Supportability, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HNLDAP, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HNLDAP, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HNLDAP, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HNLDAP, FC, value_4);
	
--------------------HNPORTAL----------------------------
/*INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HNLDAP, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HNLDAP, PHSS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HNLDAP, SVMC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HNLDAP, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HNLDAP, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HNLDAP, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HNLDAP, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HNLDAP, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HNLDAP, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HNLDAP, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HNLDAP, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HNLDAP, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HNLDAP, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HNLDAP, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HNLDAP, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HNLDAP, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HNLDAP, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HNLDAP, FC, value_8);
	*/
	
--------------------HNSECURE----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HNSECURE, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HNSECURE, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HNSECURE, SVMC, value_5_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HNSECURE, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HNSECURE, UECS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HNSECURE, AASG, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HNSECURE, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HNSECURE, II, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HNSECURE, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HNSECURE, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HNSECURE, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HNSECURE, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HNSECURE, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HNSECURE, Supportability, value_1_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HNSECURE, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HNSECURE, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HNSECURE, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HNSECURE, FC, value_8);
	
--------------------HNWEB----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HNWEB, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HNWEB, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HNWEB, SVMC, value_3);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HNWEB, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HNWEB, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HNWEB, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HNWEB, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HNWEB, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HNWEB, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HNWEB, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HNWEB, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HNWEB, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HNWEB, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HNWEB, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HNWEB, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HNWEB, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HNWEB, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HNWEB, FC, value_8);
	
--------------------HOOPC----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HOOPC, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HOOPC, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HOOPC, SVMC, value_9_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HOOPC, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HOOPC, UECS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HOOPC, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HOOPC, CU, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HOOPC, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HOOPC, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HOOPC, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HOOPC, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HOOPC, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HOOPC, IDO, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HOOPC, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HOOPC, TCS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HOOPC, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HOOPC, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HOOPC, FC, value_10);
	
--------------------HSCIS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', HSCIS, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', HSCIS, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', HSCIS, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', HSCIS, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', HSCIS, UECS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', HSCIS, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', HSCIS, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', HSCIS, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', HSCIS, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', HSCIS, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', HSCIS, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', HSCIS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', HSCIS, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', HSCIS, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', HSCIS, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', HSCIS, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', HSCIS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', HSCIS, FC, value_10);
	
--------------------INTRANET----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', INTRANET, FER, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', INTRANET, PHSS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', INTRANET, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', INTRANET, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', INTRANET, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', INTRANET, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', INTRANET, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', INTRANET, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', INTRANET, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', INTRANET, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', INTRANET, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', INTRANET, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', INTRANET, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', INTRANET, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', INTRANET, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', INTRANET, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', INTRANET, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', INTRANET, FC, value_8);
	
--------------------LANFAX----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', LANFAX, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', LANFAX, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', LANFAX, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', LANFAX, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', LANFAX, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', LANFAX, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', LANFAX, CU, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', LANFAX, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', LANFAX, Quality, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', LANFAX, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', LANFAX, CIHC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', LANFAX, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', LANFAX, IDO, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', LANFAX, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', LANFAX, TCS, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', LANFAX, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', LANFAX, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', LANFAX, FC, value_4);
	
--------------------LDAPADMIN----------------------------
/*INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', LANFAX, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', LANFAX, PHSS, value_3);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', LANFAX, SVMC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', LANFAX, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', LANFAX, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', LANFAX, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', LANFAX, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', LANFAX, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', LANFAX, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', LANFAX, TF, 26);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', LANFAX, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', LANFAX, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', LANFAX, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', LANFAX, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', LANFAX, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', LANFAX, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', LANFAX, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', LANFAX, FC, value_8);
	*/
--------------------LEARN----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', LEARN, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', LEARN, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', LEARN, SVMC, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', LEARN, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', LEARN, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', LEARN, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', LEARN, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', LEARN, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', LEARN, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', LEARN, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', LEARN, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', LEARN, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', LEARN, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', LEARN, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', LEARN, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', LEARN, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', LEARN, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', LEARN, FC, value_8);
	
--------------------MIWT----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', MIWT, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', MIWT, PHSS, value_9_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', MIWT, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', MIWT, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', MIWT, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', MIWT, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', MIWT, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', MIWT, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', MIWT, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', MIWT, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', MIWT, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', MIWT, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', MIWT, IDO, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', MIWT, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', MIWT, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', MIWT, UC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', MIWT, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', MIWT, FC, value_6);
	
--------------------MOHWEB----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', MOHWEB, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', MOHWEB, PHSS, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', MOHWEB, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', MOHWEB, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', MOHWEB, UECS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', MOHWEB, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', MOHWEB, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', MOHWEB, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', MOHWEB, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', MOHWEB, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', MOHWEB, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', MOHWEB, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', MOHWEB, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', MOHWEB, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', MOHWEB, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', MOHWEB, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', MOHWEB, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', MOHWEB, FC, value_10);
	
--------------------MSTR----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', MSTR, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', MSTR, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', MSTR, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', MSTR, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', MSTR, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', MSTR, AASG, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', MSTR, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', MSTR, Quality, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', MSTR, TF, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', MSTR, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', MSTR, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', MSTR, IDO, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', MSTR, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', MSTR, TCS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', MSTR, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', MSTR, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', MSTR, FC, value_8);
	
--------------------PCBL----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', PCBL, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', PCBL, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', PCBL, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', PCBL, BA, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', PCBL, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', PCBL, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', PCBL, CU, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', PCBL, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', PCBL, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', PCBL, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', PCBL, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', PCBL, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', PCBL, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', PCBL, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', PCBL, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', PCBL, UC, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', PCBL, WT, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', PCBL, FC, value_8);
	
--------------------PES----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', PES, FER, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', PES, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', PES, SVMC, value_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', PES, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', PES, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', PES, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', PES, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', PES, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', PES, CIHC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', PES, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', PES, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', PES, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', PES, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', PES, UC, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', PES, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', PES, FC, value_10);
	
--------------------POWERBI----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', POWERBI, FER, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', POWERBI, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', POWERBI, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', POWERBI, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', POWERBI, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', POWERBI, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', POWERBI, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', POWERBI, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', POWERBI, Quality, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', POWERBI, TF, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', POWERBI, CIHC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', POWERBI, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', POWERBI, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', POWERBI, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', POWERBI, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', POWERBI, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', POWERBI, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', POWERBI, FC, value_8);
	
--------------------RURAL----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', RURAL, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', RURAL, PHSS, value_7_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', RURAL, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', RURAL, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', RURAL, UECS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', RURAL, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', RURAL, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', RURAL, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', RURAL, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', RURAL, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', RURAL, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', RURAL, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', RURAL, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', RURAL, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', RURAL, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', RURAL, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', RURAL, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', RURAL, FC, value_8);
	
--------------------SAS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', SAS, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', SAS, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', SAS, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', SAS, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', SAS, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', SAS, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', SAS, II, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', SAS, Quality, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', SAS, TF, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', SAS, CIHC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', SAS, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', SAS, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', SAS, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', SAS, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', SAS, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', SAS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', SAS, FC, value_6);
	
--------------------SERVICENOW----------------------------
/*INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', RURAL, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', RURAL, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', RURAL, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', RURAL, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', RURAL, UECS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', RURAL, AASG, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', RURAL, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', RURAL, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', RURAL, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', RURAL, TF, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', RURAL, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', RURAL, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', RURAL, IDO, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', RURAL, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', RURAL, TCS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', RURAL, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', RURAL, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', RURAL, FC, value_6);
	*/
--------------------SFDS----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', SFDS, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', SFDS, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', SFDS, SVMC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', SFDS, BA, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', SFDS, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', SFDS, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', SFDS, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', SFDS, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', SFDS, Quality, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', SFDS, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', SFDS, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', SFDS, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', SFDS, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', SFDS, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', SFDS, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', SFDS, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', SFDS, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', SFDS, FC, value_8);
	
--------------------STOPOD----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', STOPOD, FER, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', STOPOD, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', STOPOD, SVMC, value_7);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', STOPOD, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', STOPOD, UECS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', STOPOD, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', STOPOD, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', STOPOD, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', STOPOD, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', STOPOD, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', STOPOD, CIHC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', STOPOD, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', STOPOD, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', STOPOD, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', STOPOD, TCS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', STOPOD, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', STOPOD, WT, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', STOPOD, FC, value_10);
	
--------------------SURVEY----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', SURVEY, FER, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', SURVEY, PHSS, value_5);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', SURVEY, SVMC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', SURVEY, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', SURVEY, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', SURVEY, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', SURVEY, CU, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', SURVEY, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', SURVEY, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', SURVEY, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', SURVEY, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', SURVEY, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', SURVEY, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', SURVEY, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', SURVEY, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', SURVEY, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', SURVEY, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', SURVEY, FC, value_8);
	
--------------------SWT----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', SWT, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', SWT, PHSS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', SWT, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', SWT, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', SWT, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', SWT, AASG, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', SWT, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', SWT, II, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', SWT, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', SWT, TF, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', SWT, CIHC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', SWT, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', SWT, IDO, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', SWT, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', SWT, TCS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', SWT, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', SWT, WT, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', SWT, FC, value_6);
	
--------------------TAP----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', TAP, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', TAP, PHSS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', TAP, SVMC, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', TAP, BA, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', TAP, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', TAP, AASG, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', TAP, CU, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', TAP, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', TAP, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', TAP, TF, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', TAP, CIHC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', TAP, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', TAP, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', TAP, Supportability, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', TAP, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', TAP, UC, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', TAP, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', TAP, FC, value_6);
	
--------------------TPL----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', TPL, FER, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', TPL, PHSS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', TPL, SVMC, value_9);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', TPL, BA, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', TPL, UECS, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', TPL, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', TPL, CU, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', TPL, II, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', TPL, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', TPL, TF, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', TPL, CIHC, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', TPL, CSL, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', TPL, IDO, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', TPL, Supportability, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', TPL, TCS, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', TPL, UC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', TPL, WT, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', TPL, FC, value_10);
	
--------------------WELL----------------------------
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Financial Exposure Risk', 'Financial Exposure Risk', WELL, FER, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Public Health, Safety and Security', 'Public Health, Safety and Security', WELL, PHSS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Strategic Value / Mission Criticality', 'Strategic Value / Mission Criticality', WELL, SVMC, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Business Agility', 'Business Agility', WELL, BA, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Experience / Client Satisfaction', 'User Experience / Client Satisfaction', WELL, UECS, value_10);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Alignment with Architecture Standards and Guidelines', 'Alignment with Architecture Standards and Guidelines', WELL, AASG, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Complexity and Uncertainty', 'Complexity and Uncertainty', WELL, CU, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Interfaces and Interdependencies', 'Interfaces and Interdependencies', WELL, II, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Quality', 'Quality', WELL, Quality, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Technology Fit', 'Technology Fit', WELL, TF, value_6);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Infrastructure / Hosting Costs', 'Cost of Infrastructure / Hosting Costs', WELL, CIHC, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Cost of Specialty (Non-Voted) Licenses', 'Cost of Specialty (Non-Voted) Licenses', WELL, CSL, value_0);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Incidents, Defects and Outages', 'Incidents, Defects and Outages', WELL, IDO, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Supportability', 'Supportability', WELL, Supportability, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Total Cost of Support', 'Total Cost of Support', WELL, TCS, value_8);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('User Count', 'User Count', WELL, UC, value_4);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Website Traffic', 'Website Traffic', WELL, WT, value_2);
INSERT INTO public."ApplicationSurvey"(
	"Code", "Description", "Application", "Questions", "Answers")
	VALUES ('Functional Coverage', 'Functional Coverage', WELL, FC, value_8);
	
end; $$