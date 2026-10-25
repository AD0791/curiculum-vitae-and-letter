# Alexandro Disla

**Data Engineer & Spécialiste MEAL**

14, rue Saint-Louis Jeanty, Route de Frère, Port-au-Prince, Haïti
Tél : (+509) 4148-3700 | (+509) 4630-7530 | alexandrodisla@hotmail.com
Né le 10 juillet 1991 — Nationalité haïtienne — GitHub : https://github.com/AD0791

---

## Profil Professionnel

Ingénieur de données et spécialiste du suivi-évaluation (MEAL), plus de dix ans entre l'**administration publique haïtienne** (MPCE), les **programmes financés par des bailleurs internationaux** et le **développement logiciel**. Je construis des chaînes de données complètes pour les programmes de terrain : collecte numérique (**CommCare**, ODK, KoboToolbox, mWater), extraction par API ou par automatisation de navigateur, nettoyage et contrôle qualité en **Python** (Pandas, Polars), chargements idempotents dans **BigQuery** et MySQL, puis **tableaux de bord Looker Studio** et Power BI pour la décision — le tout déployé sans serveur sur **AWS Lambda** et S3, documenté et transmis aux équipes en créole comme en français.

## Compétences Clés

- **Ingénierie de données :** Pipelines ETL planifiés ; extraction par API REST (httpx, httpx2) ou par navigateur sans interface (Playwright) ; chargements incrémentaux et idempotents ; stockage S3 ; fonctions AWS Lambda.
- **Collecte numérique :** Formulaires **CommCare, ODK/XLSForm, KoboToolbox et mWater** — logiques de saut, contraintes, listes en cascade, collecte hors ligne — déployés sur plusieurs sites.
- **Qualité des données :** Dédoublonnage, contrôles automatisés de complétude, de cohérence et de géolocalisation ; protocoles de Data Quality Assessment et suivi des corrections jusqu'à clôture.
- **Restitution et transfert :** Tableaux de bord **Looker Studio** (cartes, entonnoirs, filtres de période et de territoire), Power BI et Quarto ; formation des équipes et documentation technique.

## Ingénierie de Données et Développement

### Ingénieur Logiciel (Fullstack) & Ingénieur de Données — Tekkod LLC
*Févr 2026 – Présent | Télétravail*

- **Rapport Looker Studio « EvolveMe » :** Conception du rapport trimestriel de Steam The Streets en sept pages — carte de localisation des accès, entonnoir d'utilisateurs et conversions, cycle de vie des défis, analyse d'usage des endpoints de l'API, comparaison des inscriptions par portail (EvolveMe et mobile), couverture géographique — avec filtres de période, pays, région et ville.
- **Performance des données :** Diagnostic et suppression d'un motif de requêtes N+1 en production, ramenant le chargement d'une page d'environ 36 secondes à moins d'une demi-seconde (jointure agrégée et chargement anticipé) ; index composites éliminant la contention de verrous sous écritures concurrentes.
- **Backend et intégration :** Backend **Laravel** adossé à **MySQL** sur Google Cloud Run (API, authentification multifacteur, administration, tests PHPUnit) ; service **Python/FastAPI** d'échange signé avec l'API d'un partenaire ; applications React Native et React publiées sur l'App Store et Google Play.

### Développeur Backend & Ingénieur de Données — Tekkod LLC
*Mars 2021 – Mai 2024 | Télétravail*

- Pipelines ETL (Apache Beam) migrant des collections MongoDB vers **BigQuery**, rendus idempotents : une relance ne duplique aucune donnée.
- Services web REST sécurisés (FastAPI, JWT, contrôle d'accès par rôles), *repository pattern* et documentation OpenAPI complète ; administration de bases relationnelles en accès concurrent.
- Infrastructure conteneurisée (Docker), intégration continue et tableaux de bord analytiques sur Looker Studio.

### Consultant Logiciel & Spécialiste Intégration de Données — CassionSoft (Projet UNOPS)
*Nov 2015 – Mars 2021 | Haïti*

Intégration de données sur un projet des Nations Unies : conception de schémas relationnels, scripts de migration et validation de la logique d'intégration par tests unitaires ; systèmes d'authentification et d'autorisation par rôles (OAuth2/JWT) et services REST documentés.

## Suivi-Évaluation et Analyse de Données

### Consultant mWater & Analyste de Données — HANWASH
*Oct 2023 – Jan 2026 | Télétravail*

- **Enquêtes géospatiales :** Déploiement d'enquêtes complexes sur mWater avec relevé et validation de la **géolocalisation** des points de collecte, et résolution des anomalies remontées du terrain.
- **Dispositif de suivi :** Raffinement du plan de suivi-évaluation et du tableau de suivi des indicateurs (ITT) alignés sur les normes JMP.
- **Restitution et formation :** Tableaux de bord automatisés (mWater, Power BI) connectés aux API de collecte ; guides techniques et renforcement des capacités des équipes.

### Officier de Suivi & Évaluation — Impact Youth Project, Caris Foundation International
*Oct 2021 – Août 2024 | Haïti*

- **Collecte multi-sites sur CommCare :** Mise en place de formulaires numériques (**CommCare**, HIVHaiti) sur un programme de santé déployé sur plusieurs sites, avec standardisation des formulaires et des flux entre sites.
- **Automatisation et tableaux de bord :** Routines **Python et SQL** remplaçant des exports-imports manuels, réduisant le temps de traitement de 40 % ; tableaux de bord (Power BI, Quarto) pour le suivi hebdomadaire des indicateurs.
- **Assurance qualité (DQA) :** Protocoles de Data Quality Assessment sur des bases **MySQL** intégrées, avec remontée des chiffres rapportés aux registres sources et suivi des actions correctives.
- **Reporting vers bailleur :** Production et validation d'indicateurs rapportés à l'USAID via la plateforme nationale DATIM/DHIS2, en qualité de producteur de données.

### Économiste-Planificateur — Direction de Planification Économique et Sociale (DPES), Ministère de la Planification et de la Coopération Externe (MPCE)
*Nov 2015 – Août 2023 | Port-au-Prince*

- **Suivi de programmes publics :** Contribution aux rapports de suivi de l'exécution du Plan Triennal d'Investissement 2014–2016 — écarts entre programmation et réalisation, facteurs de retard.
- **Modélisation :** Participation à la construction du « Modèle de Planification du Développement », outil de prévision et d'analyse d'impact des politiques publiques.

## Formation

- **2010–2014 — Programme du Diplôme d'Études Supérieures en Économie Appliquée**, C.T.P.E.A (Centre de Techniques de Planification et d'Économie Appliquée), établissement sous tutelle du MPCE, Port-au-Prince. Cycle régulier de quatre ans en économie et statistique : scolarité complète et ensemble des examens réussis, attestés par le Secrétariat Général du CTPEA.
- **2009–2010 —** Baccalauréat, Philo section C, mention Bien — Institution Saint-Louis de Gonzague, Port-au-Prince
- **Formation continue —** Flatiron School (Software Engineering) ; formations spécialisées en développement web, bases de données et science des données.

## Compétences Techniques

- **Langages :** **Python**, **SQL** (GoogleSQL, MySQL, PostgreSQL), **PHP**, JavaScript, TypeScript, R ; Laravel, FastAPI, React
- **Données & automatisation :** Pandas, **Polars**, **httpx / httpx2**, **Playwright**, gspread, Apache Beam, NumPy
- **Cloud & méthodes :** **AWS (Lambda, S3)**, **Google Cloud (BigQuery, Cloud Run)**, Docker, Azure ; Git, Agile, tests (pytest, PHPUnit)
- **Bases de données :** **MySQL**, **PostgreSQL**, **MongoDB**, **BigQuery**, SQLite — schémas, migrations, optimisation de requêtes
- **Collecte de données :** **CommCare**, **ODK / XLSForm**, **KoboToolbox**, mWater, HIVHaiti
- **Visualisation :** **Looker Studio**, **Power BI**, Tableau, Quarto, RMarkdown
- **Langues :** Créole haïtien (maternel), Français (maternel), Anglais (excellent à l'écrit et à la lecture, professionnel à l'oral)
