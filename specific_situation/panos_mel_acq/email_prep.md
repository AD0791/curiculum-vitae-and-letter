# Institut Panos — Responsable MEL/ACQ (AFGHS-PANOS) : préparation du dépôt

Coordonnées d'envoi, composition du dossier et limites de ce qui peut être affirmé.
Le texte d'e-mail prêt à copier est dans [`emails.md`](emails.md).

## ⚠️ À envoyer aujourd'hui

Les deux versions de l'annonce se contredisent :

| Source | Date limite annoncée |
|---|---|
| Fiche portail (tableau) | **10 septembre 2026** |
| Corps du texte, section « Comment postuler » | 15 septembre 2026 |
| Version longue en tête de page | « Expiré : 15 sept. 2026 » |

Nous sommes le **10 septembre 2026**. La date la plus courte est donc **aujourd'hui**. Il n'y a
aucune raison d'arbitrer entre les deux : le dossier ne demande que deux pièces, elles sont
construites, envoie dès maintenant. Un dépôt le 11 ou le 12 en pariant sur le 15 est un pari
gratuit contre le tri.

## Coordonnées

| | |
|---|---|
| **Destinataire** | `contact@institutpanos.org` |
| **Objet imposé** | `Responsable MEL/ACQ — AFGHS-PANOS` |
| **Lien de candidature (alternative)** | https://shorturl.at/wU0T4 |
| **Publication** | 27 août 2026 |
| **Poste** | Port-au-Prince — hybride ou à distance envisageable |
| **Durée** | 6 mois, renouvelable |
| **Rattachement** | Chief of Party |

L'annonce impose l'objet **« Responsable MEL/ACQ — AFGHS-PANOS »**. Reprends-le tel quel, tiret
cadratin compris.

## Pièces du dossier

L'annonce est explicite et courte : **« CV et brève lettre de motivation »**. Rien d'autre — ni
diplôme, ni certificat, ni pièce d'identité. Le dossier ne fabrique donc que ces deux pièces, en
**deux pièces jointes séparées** (pas de PDF fusionné, pas de répertoire `credentials/`).

1.  `[x]` `outputs/Alexandro_Disla_LettreMotivation_Panos_MEL_FR.pdf` — 1 page
2.  `[x]` `outputs/Alexandro_Disla_CV_Panos_MEL_FR.pdf` — 2 pages

**Français uniquement.** L'annonce est en français, Panos est une institution haïtienne, et
l'anglais n'est demandé qu'à hauteur de « niveau suffisant pour travailler et rédiger les
rapports ». Une paire anglaise n'ajouterait rien et encombrerait la boîte du trieur. Les `.docx`
sont produits par le build si un formulaire en réclame un.

La lettre est délibérément **brève** — quatre paragraphes, une page — parce que l'annonce le
demande explicitement.

## Ce qui ne doit PAS être affirmé

*   **Aucun master délivré.** Même réserve que pour le dossier ACF : le C.T.P.E.A n'a pas encore
    délivré le DES, en attente de la soutenance du mémoire de sortie. Le CV et la lettre le
    disent. Ne jamais écrire « master », « DES obtenu » ni « Lauréat ». Voir
    `../acf_responsable_meal/email_prep.md` pour la même décision.
*   **Pas d'administration DHIS2/DATIM.** Le rôle à Caris était **producteur de données** :
    production, contrôle et soumission des indicateurs MER. La lettre l'écrit noir sur blanc
    (« j'ai produit des données pour DATIM sans en avoir été administrateur »). L'annonce demande
    la « maîtrise des systèmes et outils de données (DHIS2 ou plateformes comparables) » — ce qui
    est satisfait par l'usage, pas par l'administration.
*   **Aucun indicateur MER nommé.** Décision du 10 septembre 2026 : on reste sur le rapportage MER
    agrégé, sans citer de code d'indicateur. La lettre dit que la rétention sous traitement et la
    suppression virale *relèvent du jeu MER produit*, sans revendiquer d'avoir conçu ces
    indicateurs. **Si tu confirmes plus tard avoir traité TX_CURR / TX_ML / TX_PVLS, dis-le : le
    CV et la lettre se renforcent en deux minutes.**
*   **Pas de PTME.** L'annonce la cite explicitement. La lettre l'exclut nommément du périmètre.
    Ne pas laisser entendre le contraire en entretien.
*   **MESI, SISNU/DHIS2 et iSanté Plus : connaissance du paysage, pas expérience d'exploitation.**
    Ces systèmes n'ont jamais été opérés. La lettre en parle comme d'un problème de réconciliation
    à résoudre, appuyé sur une compétence d'ingénierie réelle (ETL, bases relationnelles,
    résolution d'identités) — jamais comme d'un antécédent. Ne pas dire « j'ai travaillé dans le
    SISNU ».
*   **Pas dix ans de MEL, et aucun poste de conseil technique principal.** L'annonce demande dix
    ans « incluant des rôles de conseil de haut niveau ». Le compte honnête : cinq ans en ONG dont
    trois sur le VIH, huit ans au MPCE. La lettre l'écrit et ajoute qu'aucun poste de CTP n'a été
    occupé.
*   **Ne pas revendiquer le Projet Santé.** Garde-fou hérité du dossier CMMB.
*   **Stata.** Le CV CMMB le liste, le dossier MAST/PSARA l'interdit. Il est **exclu ici** — voir
    « Incohérence à trancher » ci-dessous.

## Incohérence à trancher dans les autres dossiers

`cmmb_me_officer/resume_fr.tex` ligne 72 revendique **Stata** dans les compétences d'analyse,
alors que le dossier MAST/PSARA pose comme règle de ne jamais revendiquer Stata ni SPSS. L'un des
deux est faux. Le CV Panos ne le mentionne pas, par prudence. À trancher une fois pour toutes,
puis à propager.

## Ce qui rend cette candidature défendable malgré les écarts

Le poste est intitulé « Conseiller·ère Technique Principal·e en Information Stratégique » et
demande dix ans dont du conseil de haut niveau : le profil est en dessous sur l'ancienneté. Ce qui
compense est réel et rare :

*   **Le seul candidat probable qui a rapporté *dans* DATIM et sait aussi construire le système
    qui l'alimente.** La réconciliation MESI / SISNU / iSanté Plus est un travail d'ETL et de
    résolution d'identités — c'est littéralement son autre métier.
*   **La préparation aux vérifications indépendantes** est la même discipline que les DQA
    supervisés à Caris : remonter le chiffre au registre source, suivre l'action corrective
    jusqu'à clôture.
*   **Le profil linguistique est un match complet** : français et créole maternels, anglais de
    rédaction. L'annonce demande exactement cela.
*   **Référence sectorielle prête** : Davidson Adrien, ancien Directeur S&E de la Caris
    Foundation, (+509) 4460-6638 — déjà sur le CV.

## À savoir avant de s'engager

*   Le recrutement est **conditionné à l'obtention du financement** et à l'approbation du
    programme. Le poste peut ne jamais exister. Ce n'est pas une raison de ne pas postuler, c'en
    est une de ne pas démissionner d'ailleurs sur la foi d'une offre.
*   **Contrat de 6 mois**, renouvelable.
*   L'embauche est conditionnée à la signature du Code de conduite et des politiques de sauvegarde
    (PSEA, C-TIP), et à un **filtrage préalable incluant la vérification rigoureuse des
    références**. Prévenir Davidson Adrien qu'il peut être contacté.

## Avant d'envoyer

1.  Vérifier que l'objet est exactement « Responsable MEL/ACQ — AFGHS-PANOS ».
2.  Joindre les **deux** PDF depuis `outputs/`.
3.  Envoyer à `contact@institutpanos.org` — **aujourd'hui**.
