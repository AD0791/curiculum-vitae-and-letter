# Concern Worldwide Haïti — Chargé.e Gestion de l'Information (MEAL) : préparation du dépôt

Procédure, arbitrages et limites de ce qui peut être affirmé.
Le texte d'e-mail prêt à copier est dans [`emails.md`](emails.md) ; l'annonce intégrale dans
[`inputs/concern_cgi_jd.md`](inputs/concern_cgi_jd.md).

## Urgence

| | |
|---|---|
| **Publication** | 12 octobre 2026 |
| **Date limite** | **lundi 26 octobre 2026** |
| **Dossier créé le** | samedi 24 octobre 2026, deux jours avant la clôture |
| **Canal** | courriel à `recrutement.haiti@concern.net` |
| **Objet imposé** | `DP/CGI1210/2026- Alexandro Disla` (la référence, puis le nom complet) |

**Envoyer dès que possible, sans attendre lundi.** L'annonce prévient que Concern « peut faire une
offre de poste avant la date de clôture » : le recrutement est au fil de l'eau, et un dossier
arrivé le dernier jour peut trouver le poste déjà pourvu.

L'objet reprend la ponctuation publiée (`2026-` collé, puis une espace). Si sa carte d'identité
porte un second prénom, l'ajouter : l'annonce demande le « nom complet ».

## Les pièces

| Pièce | Statut | Dans le dossier |
|---|---|---|
| CV | Exigée | `cv_fr.tex` — 2 pages |
| Lettre de motivation | Exigée | `cover_letter_fr.tex` — 1 page |
| Attestation C.T.P.E.A | Non demandée, jointe exprès | `credentials/01_attestation_ctpea.pdf` — déjà déposée |

Tout est fusionné dans `outputs/Alexandro_Disla_Dossier_DP-CGI1210-2026.pdf` (lettre → CV →
attestation). L'attestation est jointe sans être demandée parce que le poste exige un **Bac+4**
et que le CV comme la lettre y renvoient pour dire où en est le diplôme. Ni pièce d'identité ni
références ne sont demandées. Concern vérifiera les références et les antécédents plus tard ;
la page de trois références du dossier Acted (`../acted_assistant_meal/references.tex`) est
prête si on la demande.

## Adéquation

C'est le poste le plus proche de son profil réel parmi les annonces humanitaires reçues jusqu'ici.
L'intitulé et la spécialité (« Sciences Informatiques — Base de données ») décrivent exactement
le double métier MEAL + ingénierie de données, et la section 1 de la fiche décrit le back-office
APA presque ligne pour ligne.

| Exigence Concern | Situation |
|---|---|
| **Bac+4** en statistique, informatique, économie… | **Écart.** Cycle C.T.P.E.A de quatre ans après le bac, scolarité complétée, DES en attente du mémoire. Assumé par écrit (CV, lettre, pièce jointe) |
| 3 ans en IM ou MEAL en ONG / ONU | Cinq ans en ONG (Caris, HANWASH, APA), plus le projet UNOPS via CassionSoft |
| Excel avancé (TCD, formules, **Power Query**) + Power BI | Excel avancé et Power BI revendiqués ; **Power Query n'est nommé nulle part** (voir les décisions ci-dessous) |
| KoboToolbox/ODK, XLSForm, gestion de bases | Point fort : XLSForm, ODK/ONA.io, Kobo, CommCare, mWater ; MySQL, PostgreSQL |
| SPSS, Stata **ou R**, échantillonnage | R et échantillonnage : l'exigence est remplie sans Stata ni SPSS |
| Protection des données, données sensibles | Trois ans de données VIH ; contrôle d'accès par rôle, sessions sécurisées, sauvegardes |
| **Supervision d'équipe** et formation d'adultes | Formation : oui (agents de collecte, partenaires). Supervision : **technique seulement**, jamais hiérarchique. **Écart** assumé dans la lettre |
| QGIS/ArcGIS, 3W/4W/5W, ActivityInfo *(atouts)* | Aucun. Non revendiqué, et pas mentionné dans la lettre puisque ce sont des atouts |
| Créole et français parfaits, anglais un atout | Les deux maternels, anglais courant |
| Déplacements Ouest et Centre | Le dossier ne prend **aucun engagement** (voir ci-dessous) |

## Ce qui ne doit PAS être affirmé

*   **Le C.T.P.E.A n'est pas un diplôme délivré.** Le CV écrit « cycle de quatre ans après le
    baccalauréat » et non « Bac+4 » ou « licence » : l'annonce exige un *diplôme* de niveau Bac+4,
    et la pièce jointe dit que le diplôme viendra après le mémoire.
*   **Pas de supervision hiérarchique.** Le poste encadre un.e Chargé.e Adjoint.e, évaluation des
    performances comprise. Il a dirigé techniquement des agents de collecte et servi de référent,
    sans jamais être leur supérieur. Même garde-fou que CRS SPO.
*   **Pas de SIG.** Les enquêtes mWater étaient géoréférencées, mais il n'a pas produit de cartes
    sous QGIS ni ArcGIS. Ne pas laisser « géospatial » se lire comme « cartographe ».
*   **Pas de 3W/4W/5W, ActivityInfo, IMWG ni réunions de clusters.**
*   **Pas d'enquêtes PDM, CAP, de baselines ni d'évaluations finales menées par lui.** La fiche
    demande de les *appuyer* ; le CV n'en documente aucune.
*   **Pas de protocoles VBG, protection ou plaintes rédigés**, pas de politique de protection des
    données rédigée, ni d'analyse d'impact (DPIA). Ce que le dossier affirme se limite à la
    confidentialité des données VIH et aux contrôles techniques (accès, sessions, sauvegardes).
*   **Pas d'inventaire ni de configuration de flotte de tablettes.**
*   **Pas de pseudonymisation revendiquée.** La clé APA contient les initiales, le sexe et l'année
    de naissance : c'est un identifiant de dédoublonnage, pas une pseudonymisation au sens strict.
    En entretien, ne pas la présenter comme une anonymisation.
*   **Pas d'administration DHIS2/DATIM** (producteur de données seulement), **pas de Stata ni de
    SPSS, pas de Projet Santé.**

## Décisions qu'il peut encore prendre avant l'envoi

1.  **Power Query.** L'annonce le cite nommément. Ses tableaux de bord Power BI connectés aux API
    mWater passent en pratique par l'éditeur Power Query, mais le dépôt ne le documente pas. S'il
    confirme s'en servir, ajouter « Power Query » à la ligne *Bureautique & viz* du CV (`.tex` et
    `.md`) et relancer le build. Sinon, ne rien ajouter.
2.  **Déplacements dans le Centre.** L'annonce exige de pouvoir se rendre dans l'Ouest et le
    Centre. Comme les dossiers CRS PO et Acted, celui-ci ne prend aucun engagement de mobilité ; la
    question se traite de vive voix. S'il veut s'engager par écrit, une phrase dans la lettre
    suffit (la lettre a la place).

## Points à préparer pour l'entretien

*   **Le back-office APA comme démonstration.** C'est la réponse à la section 1 entière : formulaire
    ODK, webhook, base de 31 tables, clé unique, doublons, orphelins, sauvegarde. Savoir le
    raconter en deux minutes, en créole comme en français.
*   **La protection des données selon la liste de Concern** : minimisation, consentement éclairé,
    pseudonymisation, accès, transfert, conservation, destruction. Préparer, pour chaque terme, ce
    qu'il ferait dans une base comme celle d'APA. Il doit le présenter comme une méthode, pas comme
    une expérience déjà vécue.
*   **La supervision d'un adjoint.** Préparer un exemple concret de direction technique à Caris
    (répartition du travail, contrôle qualité), et la manière dont il conduirait une évaluation
    de performance.
*   **Les secteurs de Concern Haïti** cités par l'annonce : nutrition, protection, SAME (sécurité
    alimentaire et moyens d'existence), EHA. HANWASH couvre l'EHA ; aucune expérience en nutrition
    ni en sécurité alimentaire. Les bailleurs et projets en cours de Concern Haïti n'ont pas été
    recherchés pour ce dossier.
*   **SIG et 3W.** Les deux atouts manquants : savoir dire ce que sont une matrice 3W/4W/5W et
    ActivityInfo, et dire honnêtement qu'il n'a pas encore fait de cartographie QGIS.

## Avant d'envoyer

1.  Lancer `./build_concern.sh` : le résumé doit afficher Lettre 1 page, CV 2 pages, et aucun
    avertissement sur l'attestation.
2.  Ouvrir `outputs/Alexandro_Disla_Dossier_DP-CGI1210-2026.pdf` et vérifier page par page :
    lettre, CV (2 pages), attestation lisible.
3.  Copier le courriel de `emails.md`, objet `DP/CGI1210/2026- Alexandro Disla`, joindre le PDF
    unique.
4.  Envoyer **dès que possible, au plus tard le lundi 26 octobre 2026**.
