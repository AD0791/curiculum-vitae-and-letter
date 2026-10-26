# Brief — consultation APA (texte de l'utilisateur, verbatim, 25 octobre 2026)

Il n'y a pas d'avis de recrutement pour cette mission : ce brief en tient lieu. Les quatre captures
du rapport Looker Studio « Steam The Streets — EvolveMe quarterly report » jointes au brief sont dans
`sts_looker_orijinal/` (1 = Access Location, 2 = Endpoint usage analysis, 3 = Direct vs Evolveme
Onboarding I, 4 = Direct vs Evolveme Onboarding II).

---

We are going to pitch for a consulting job for the `Anseye Pou Ayiti` (APA).

From the jump, you must know that the APA organization in Haiti. Their documentation, their codebase and surveys are in creole/Haitian Creole.

> create a special directory for this project.

++++++

I need to send them the best survey that will expose my best version. Please remove the APA job in the current CV before you build the new cv for me.

I need to send them a technical proposal 2-3 pages maximum. Their logo is on the subdir APA_root in our Desktop directory.

+++++++++++

Beside the cv, you will write the 3 technical proposal with the apa logo,theme and in Haitian creole. It's will be 3 version of the proposal where I will pick one.

++++++++

Here is the main goal.

They are collecting part of the program PLDL with commcare. In their commcare plan, they have access to the API features and we must account for the non access of the API feature. And they want to take theses data, perform EDA and build a dashboard with it.

APA uses hostinger for their php app. the php app get his data from ONA.io (webhook). the production db is a mysql on hostinger.

But they already have a dashboard that uses this. AWS, GSpread, lookser studio on gcp. two python script on aws that prepare the data (gather, eda). and at the end of the EDA script we push with gspread the data a google spreadsheet. And this spreadsheet is used as a source of truth to build the dashboard on looker studio.

PS: a scheduler run the scripts on aws at midnight every day. And the meal specialist can run  the scripts on aws lambda.

+++++++++

What I think that I will do for the project. I want to cover the commcare situation with both scenario.  But the python scripts will be added each on aws lambda.

scenario 1:

I think playwright can do a headless browser automation where we will download the cases (surveys).
playwright will get the cases and store them in a s3 bucket as an xlsx files, that is one script.

another scriopt, that will retrieve, the xlsx files turn them into polars or pandas dataframes, we will conduct the EDA to prepare the data. the clean data will be store again on the s3 bucket.

I will add a third script that will use bigquery, gspread and access the production mysql database where we will store the clean data that will used for the creation of the dashboard. gspread will create a google spreadsheet for the meal officer to review, on his google drive, quickly in data inconsistencies, the bigquery db on gcp that will store the clean data where we will take theses data to build the dashboard with gsql query scripts as data source for each elements of the looker studio dashboard. And a backup of this clean data will be added in a new standalone table in the mysql apa database. As a side note this data, can be used in php app to build the dashboard in the same php app if the apa leadership wants to in the future.

scenario 2:

we will get the data with httpx2 as our main framework. In commcare we will need to set secure endpoints for each surveys. So basically the first python aws scripts from the first scenario, we won't need playwright or browser automation anymore. but we will still store these files in a new dedicated s3 bucket.

and the rest is the same.

++++++++

You must mention that it's cost efficient. we will build it with upsert capabilities in mind. And we will reuse the existing cloud infrastructure of the Organization.

---

Décisions prises ensuite avec l'utilisateur (même séance) : CV en français, poste APA retiré du
seul CV de ce dossier ; trois versions par public (Direksyon, Teknik, Faz pa faz) ; captures STS
présentées comme preuve de travail (Looker Studio, ingénieur de données chez Tekkod) ; coût
d'infrastructure seulement, sans honoraires ; palette du logo APA ; pas de calendrier détaillé,
une fenêtre de 2 à 3 mois (3 si nécessaire), remplacée le même jour par une durée ferme de 3 mois
avec ses six justifications ; schémas faciles à lire, construits avec les logos
de chaque élément.
