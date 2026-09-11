# CRS Haïti — Senior Project Officer MEAL (RAPID) : préparation du dépôt

Coordonnées, procédure et limites de ce qui peut être affirmé.
Le texte d'e-mail prêt à copier est dans [`emails.md`](emails.md).

## ⚠️ La procédure comporte DEUX étapes — l'e-mail seul est rejeté

> « SI VOUS NE COMPLÉTEZ PAS LES 2 ÉTAPES CI-DESSOUS, VOTRE DOSSIER NE SERA PAS CONSIDÉRÉ. »

1.  **Remplir le formulaire en ligne** — via le lien de la publication.
2.  **Puis** envoyer CV, lettre de motivation et copies de diplômes à
    `HAITI.RECRUITMENT@CRS.ORG`.

**Le lien du formulaire ne figure pas dans le texte qui m'a été transmis.** Il faut le récupérer
sur l'annonce d'origine (portail d'emploi ou page carrières de CRS Haïti) avant tout envoi.
L'étape 2 sans l'étape 1 est une candidature nulle : c'est le risque principal de ce dossier, plus
que son contenu.

## Urgence

| | |
|---|---|
| **Publication** | 7 septembre 2026 |
| **Date limite** | 17 septembre 2026 |
| **Mais** | recrutement **accéléré** : les candidatures sont évaluées **au fil de l'eau** et le processus « pourra être finalisé dès qu'un profil correspondant aura été identifié » |

Autrement dit, la date limite n'est pas la vraie contrainte : le poste peut être pourvu avant.
Envoyer dans les jours qui viennent, pas le 16.

## Coordonnées

| | |
|---|---|
| **Destinataire (étape 2)** | `HAITI.RECRUITMENT@CRS.ORG` |
| **Objet proposé** | `Candidature - Senior Project Officer MEAL - Projet RAPID - Alexandro Disla` |
| **Lieu** | Port-au-Prince, **ou Les Cayes, ou Fort-Liberté** |
| **Déplacements** | jusqu'à 40 % |
| **Rattachement** | Project Manager-MEAL |
| **Bailleur** | Département d'État américain — programme d'urgence de 12 mois |

L'annonce n'impose pas de formule d'objet. Celle proposée nomme le poste et le projet, ce qui suffit
au tri.

## Pièces du dossier

L'annonce est explicite : **lettre de motivation, CV détaillé, copies de diplômes** — trois pièces
jointes distinctes, pas de PDF fusionné de dossier.

1.  `[x]` `outputs/Alexandro_Disla_LettreMotivation_CRS_MEAL_FR.pdf` — 1 page
2.  `[x]` `outputs/Alexandro_Disla_CV_CRS_MEAL_FR.pdf` — 2 pages
3.  `[ ]` `outputs/Alexandro_Disla_Diplomes_CRS.pdf` — **à produire** : déposer l'attestation
    C.T.P.E.A dans `credentials/`, voir [`credentials/README.md`](credentials/README.md), puis
    relancer `./build_crs.sh`

**Français uniquement.** L'annonce est en français et exige « maîtrise du français et du créole
haïtien », l'anglais n'étant qu'un atout. Une paire anglaise n'apporterait rien au tri. Les `.docx`
sont produits par le build si le formulaire en ligne en réclame un.

## Pourquoi ce dossier est différent des trois autres

**C'est le premier poste dont il remplit les qualifications de base.** Aucune réserve sur le
diplôme n'est nécessaire ici :

| Exigence CRS | Situation |
|---|---|
| **Licence** en sociologie, statistiques, informatique ou domaine connexe | Cycle C.T.P.E.A de quatre ans en économie et statistique appliquées — au niveau demandé, et « domaine connexe » sans discussion |
| **5 ans** de MEAL terrain sur projets complexes, de préférence ONG internationale | Cinq ans : Caris Foundation International, HANWASH, Anseye Pou Ayiti |
| Élaboration d'indicateurs, outils, méthodologies, analyse et présentation | Cœur du CV |
| SPSS, **Stata ou R** | **R** — réel, et suffisant : la condition est alternative |
| Français **et créole haïtien** requis | Les deux maternels ; anglais en atout, également acquis |
| ICT4D | ODK, KoboToolbox, CommCare, mWater — c'est sa pratique quotidienne |

La lettre est donc écrite sur un ton affirmatif, pas défensif : c'est le seul des quatre dossiers en
cours où il ne demande pas une dérogation.

## Ce qui ne doit PAS être affirmé

*   **Pas de supervision hiérarchique.** Décision du 10 septembre 2026 : l'encadrement à Caris était
    **technique** — répartition du travail, contrôle qualité, formation — sans évaluations de
    performance, ni plans de développement individuel, ni participation au recrutement. CRS exige
    « 2 ans de supervision d'équipes » et décrit de la gestion RH complète. La lettre l'annonce
    explicitement comme un premier exercice. **C'est le seul écart réel du dossier ; ne pas le
    masquer en entretien.**
*   **Aucune expérience de réponse d'urgence humanitaire.** RAPID couvre assistance alimentaire,
    nutrition, santé, EAH et résilience aux catastrophes. Le vécu est santé/VIH, EAH et éducation —
    en développement, pas en urgence. La lettre le dit en une demi-phrase.
*   **Rien sur le cash.** L'annonce cite le « Groupe de travail cash » dans les relations externes.
    Aucune expérience de transferts monétaires. Ne pas l'évoquer.
*   **Pas de mécanisme de plainte mis en œuvre.** L'expérience en redevabilité communautaire est
    conceptuelle, pas opérationnelle. Ne pas revendiquer avoir déployé un CRM.
*   **Pas d'administration DHIS2/DATIM** — producteur de données seulement.
*   **Stata et SPSS : ne pas revendiquer.** Le CV s'appuie sur **R**, ce que l'annonce accepte
    explicitement. (Note : `cmmb_me_officer/resume_fr.tex` revendique Stata alors que le dossier
    MAST/PSARA l'interdit — incohérence toujours non tranchée.)
*   **Ne pas revendiquer le Projet Santé** — garde-fou hérité du dossier CMMB.

## Points à préparer pour l'entretien

*   **La question de la supervision viendra.** Réponse honnête et préparée : trois ans de conduite
    technique d'agents de collecte multi-sites, plus le fait d'avoir formé et outillé ces équipes ;
    la gestion de la performance est le volet à apprendre, et il est apprenable.
*   **L'approche convergente de RAPID** — les mêmes ménages suivis à travers plusieurs services —
    est le meilleur angle du dossier : c'est un problème d'identification et de dédoublonnage, donc
    exactement son métier d'ingénieur de données. La lettre s'y termine.
*   **Bailleur du gouvernement américain :** l'expérience PEPFAR/MER via DATIM porte directement,
    même si le bailleur diffère (Département d'État plutôt qu'USAID).
*   **Référence :** Davidson Adrien, ancien Directeur S&E Caris, (+509) 4460-6638 — prévenir qu'il
    peut être contacté.

## À savoir avant de s'engager

Le poste est publié **sous réserve du financement**, sur un projet d'urgence de 12 mois. La durée
affichée est « indéterminée », mais le projet, lui, est borné.

## Avant d'envoyer

1.  **Récupérer le lien du formulaire en ligne et le remplir.** Sans cette étape, le reste ne
    compte pas.
2.  Déposer l'attestation C.T.P.E.A dans `credentials/`, relancer `./build_crs.sh`.
3.  Ouvrir le PDF des diplômes et vérifier qu'il contient bien l'attestation.
4.  Envoyer les **trois** pièces jointes à `HAITI.RECRUITMENT@CRS.ORG`, en mentionnant dans le
    corps du courriel que le formulaire en ligne a été complété.
