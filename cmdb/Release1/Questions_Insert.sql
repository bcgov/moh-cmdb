DO $$
DECLARE
Yes 	INTEGER;
No 		INTEGER;
BEGIN
----------------------------------------------------------
--						Yes or No 						--
----------------------------------------------------------
SELECT "Id" FROM public."LookUp"
INTO Yes
WHERE "Description"='Yes'
AND "Status"='A';
SELECT "Id" FROM public."LookUp"
INTO No
WHERE "Description"='No'
AND "Status"='A';

INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('FER', 'Financial Exposure Risk', 'A', 'Level of risk of financial exposure', No, No, No, Yes, No, No, No, No, 'BUSINESS', 'Business', '0 - Lowest risk
2 - No significant harm
4 - Minor harm
6 - Serious harm
8 - Very serious harm
10 - Extremely serious harm');

INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('PHSS', 'Public Health, Safety and Security', 'A', 'Impact on:
- Public health
- Safety of citizens or employees
- Support for operations or infrastructure
- Legislative requirement', Yes, No, No, No, No, No, No, No, 'BUSINESS', 'Business', '0 - Does not support any of the criteria
2 - Lowest support (partial support for 1 of the criteria)
4 - Low to moderate support (1 of the criteria)
6 - Moderate support (2 of the criteria)
8 - Moderate to high support (3 of the criteria)
10 - Highest support (all 4 of the criteria)');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('SV/MC', 'Strategic Value / Mission Criticality', 'A', '- Overall importance of business value
- Strategic value to senior management
- Alignment with the Ministrys stated business vision and objectives', Yes, No, No, No, No, No, No, No, 'BUSINESS', 'Business', '0 - No business value
2 - Low business value
4 - Low to moderate value
6 - Moderate business value
8 - Moderate to high value 
10 - Highest business value');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('BA', 'Business Agility', 'A', 'Ability to quickly and cost-effectively adapt to support changes in business objectives and priorities, given the current support infrastructure and resources', No, No, No, No, No, No, No, No, 'BUSINESS', 'Sustainability', '0 - No agility (everything is hardcoded)
2 - Lowest agility (Minor updates can be made on the fly)
4 - Low to moderate agility (More minor updates can be made on the fly)
6 - Moderate agility (System uses some code tables or enables some changes via configurations)
8 - Moderate to high agility
10 - Highest agility (ability to implement all changes via configurations)');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('UE/CS', 'User Experience / Client Satisfaction', 'A', 'Ease of use and intuitiveness of the application from the perspective of the user. Is the interface easy to understand for the novice or does it require training? Is the navigation easy or painful? Do power users get bogged down with redundant steps aimed at novice users? Overall satisfaction rating from business clients (or citizens) with the applications availability, usability and functionality', No, Yes, No, No, No, No, No, No, 'BUSINESS', 'Sustainability', '0 - Lowest usability (users can barely use the interface without any training, lots of wasted time and energy)
2 - Low usability (lots of training required, lots of extra clicks)
4 - Low to moderate usability (training required, a few additional clicks)
6 - Moderate usability (minor training required, a few additional clicks)
8 - Higher than average usability (little or no training, efficient interface)
10 - Highest usability (no training required, very intuitive)');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('AASG', 'Alignment with Architecture Standards and Guidelines', 'A', 'How well does the applications architecture model and technology align with the OCIO and ministrys EA standards and guidelines? If no applicable enterprise architecture standard is identified, consider alignment with current industry standards and good practices', Yes, No, No, No, No, No, Yes, No, 'TECHNICAL', 'Architecture', '
0 - Lowest alignment
2 - Low alignment
4 - Low to average alignment
6 - Average alignment
8 - Above average alignment 
10 - Highest alignment');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('CU', 'Complexity and Uncertainty', 'A', 'Rate the overall complexity of the application in terms of design, code, interfaces/dependencies, or level of uncertainty regarding the code', No, No, No, No, No, Yes, No, Yes, 'TECHNICAL', 'Architecture', '
0 - Lowest complexity / uncertainty
2 - Low complexity / uncertainty 
4 - Low to average complexity / uncertainty 
6 - Average complexity / uncertainty 
8 - Avergage to high complexity / uncertainty 
10 - Highest complexity / uncertainty');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('II', 'Interfaces and Interdependencies', 'A', 'Identify the level of dependency with other applications where the interfaces are not well defined or managed', No, No, No, No, No, Yes, No, No, 'TECHNICAL', 'Architecture', '
0 - No interfaces / interdependencies
2 - 1 interface / interdependency
4 - 2 interfaces / interdependencies 
6 - 3 interfaces / interdependencies 
8 - 4 interfaces / interdependencies 
10 - > 4 interfaces / interdependencies');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('Quality', 'Quality', 'A', 'Rate the quality of the application with respect to defects and outages', Yes, No, No, No, No, No, Yes, No, 'TECHNICAL', 'Architecture', '
0 - Lowest quality
2 - Low quality
4 - Low to average quality
6 - Average quality
8 - Above average quality
10 - Highest quality');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('TF', 'Technology Fit', 'A', 'Does the application employ current mainstream technologies based on industry standards or does it involve some/mostly discontinued or fringe technologies?', Yes, No, No, No, No, No, Yes, Yes, 'TECHNICAL', 'Architecture', '
0 - Worst fit
2 - Low fit
4 - Low to average fit
6 - Average fit
8 - Above average fit
10 - Best fit');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('CI/HC', 'Cost of Infrastructure / Hosting Costs', 'A', 'Overall cost of the application in relation to infrastructure, data storage, etc', No, No, Yes, No, No, No, No, No, 'TECHNICAL', 'Operations', '
0 - No cost
2 - Lowest cost
4 - Low to moderate cost
6 - Moderate cost
8 - Moderate to high cost
10 - Highest cost');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('CSL', 'Cost of Specialty (Non-Voted) Licenses', 'A', 'Overall cost of the application in relation to the licensing (non-voted). Should not include any shared infrastructure licenses', No, No, Yes, No, No, No, No, No, 'TECHNICAL', 'Operations', '
0 - No licensing costs
2 - < $1,000 per year
4 - Between $1,000 and $2,500 per year
6 - Between $2,500 and $5,000 per year
8 - Between $5,000 and $10,000 per year
10 - > $10,000 per year');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('IDO', 'Incidents, Defects and Outages', 'A', 'Sum of hours for incidents, defects and outages', Yes, No, No, No, No, No, No, Yes, 'TECHNICAL', 'Operations', '
0 - No support hours per year
2 - < 20 support hours per year
4 - Between 20 and 40 hours per year
6 - Between 40 and 60 hours per year
8 - Between 60 and 80 hours per year
10 - > 80 hours per year');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('Supportability', 'Supportability', 'A', 'Availability of qualified support resources. Consider the level of training required to onboard new support staff. Consider requirement for 3rd party support that may be required', Yes, No, No, No, No, No, No, Yes, 'TECHNICAL', 'Operations', '
0 - Poorest availability (end of life > 10 years )
2 - Really poor availability (1 resource, expensive subcontractors )
4 - Poor availability (1-2 resources)
6 - Average availability (3-4 resources)
8 - Good availability (5-8 resources)
10 - Best availability (> 8 resources)');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('TCS', 'Total Cost of Support', 'A', 'Overall cost of the application in relation to the portfolio. Consider cost of support, licensing, infrastructure, training, upgrades, data storage, etc.', Yes, No, Yes, No, No, No, No, No, 'TECHNICAL', 'Operations', '
0 - No support hours per year
2 - Less than 40 support hours per year
4 - Between 40 and 100 support hours per year
6 - Between 100 and 200 support hours per year
8 - Between 200 and 400 support hours per year
10 - > 400 support hours per year');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('UC', 'User Count', 'A', 'Count of authenticated users', No, No, No, No, No, No, No, No, 'TECHNICAL', 'Operations', '
0 - 1 user
2 - 2-3 users
4 - 4-6 users
6 - 7-10 users
8 - 10-20 users
10 - > 20 users');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('WT', 'Website Traffic', 'A', 'Number of daily page views', No, No, No, No, No, No, No, No, 'TECHNICAL', 'Operations', '
0 - No website traffic
2 - Less than 1,000 page views per day
4 - Between 1,000 and 5,000 page views
6 - Between 5,000 and 10,000 page views
8 - Between 10,000 and 25,000 page views
10 - > 25,000 page views');
INSERT INTO public."Questions"(
	"Code", "Description", "Status", "QuestionDescription", "YN_AppInsight", "YN_ClientStatis", "YN_TCO", "YN_FinRisk", "YN_Functional", "YN_Complex", "YN_ArchRisk", "YN_Support", "Category", "SubCategory", "Rating")
	VALUES ('FC', 'Functional Coverage', 'A', 'Level of coverage of the target business functions. Are there gaps in the stated requirements? Have requested enhancements been deferred or discarded? Have the business functions evolved or is the application stale?', No, No, No, No, Yes, No, No, No, 'TECHNICAL', 'Sustainability', '
0 - Lowest coverage (10% coverage or less)
2 - Low coverage (20% or less)
4 - Low to moderate coverage (20%-30% coverage)
6 - Moderate coverage (30% to 50%)
8 - Moderate to high coverage (50% to 75%)
10 - Highest coverage (75%+)');

end;$$