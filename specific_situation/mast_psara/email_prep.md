# UGP-MAST / PSARA — préparation de l'envoi

Projet de Protection Sociale Adaptative pour une Résilience Accrue (PSARA), financé par la
Banque mondiale, mis en œuvre par l'Unité de Gestion de Projet du Ministère des Affaires
Sociales et du Travail. Bureau central, Port-au-Prince, avec déplacements attendus vers la
Grand'Anse (Jérémie) et le Sud (Port-Salut).

## Deux postes, un seul CV

| Poste | Superviseur direct | Ce que le poste demande d'abord |
|---|---|---|
| **Data Analyste** | Expert en Système d'Information | Qualité des données de collecte, serveur ODK Aggregate, nettoyage et consolidation de bases, validation de l'algorithme de ciblage du SIMAST, rapports et formation des cadres du MAST |
| **Développeur d'Applications Web** | Expert en Système d'Information | Programmation du code **SIMAST V2**, maintenance de la cartographie interactive de la vulnérabilité, sauvegardes hebdomadaires base + code, documentation quotidienne sous contrôle de version, encadrement d'un développeur junior |

Les deux postes relèvent du même supérieur hiérarchique, dans la même unité, sur le même système.
Le CV est donc unique et volontairement hybride : il présente les deux blocs d'expérience à poids
égal. Seule la lettre de motivation change, parce qu'elle nomme le poste.

**Ne pas envoyer les deux candidatures dans le même courriel.** Un courriel par poste, un PDF
unique par courriel, l'objet nommant explicitement le poste visé.

## Logistique de dépôt

- **Échéance : lundi 22 septembre 2026.**
- **Par courriel :** `ugp.mast@gmail.com`
- **Ou en main propre**, sous pli cacheté : 4, Impasse Alexis, Delmas 60 (Musseau),
  du lundi au vendredi, de 09h00 à 15h00.
- **Format imposé :** lettre de motivation + curriculum vitae + copie des attestations et
  diplômes, réunis en **un (1) seul fichier PDF**. `build_psara.sh` produit exactement cela.

## Objet du courriel

- Data Analyste : `Candidature — Data Analyste, UGP-MAST / Projet PSARA — Alexandro Disla`
- Développeur : `Candidature — Développeur d'Applications Web, UGP-MAST / Projet PSARA — Alexandro Disla`

## L'argument central

Les deux annonces décrivent le même système vu de deux côtés : une application web qui reçoit des
données ODK, les stocke, les nettoie, les déduplique et en tire des indicateurs. C'est exactement
l'architecture du back-office M&E d'Anseye Pou Ayiti, que j'ai construit et que je maintiens :
formulaires XLSForm sur ODK/ONA.io, réception par webhook, base MySQL, dédoublonnage, audit des
enregistrements orphelins, export Excel, sauvegarde complète de la base en ZIP. La tâche
« copie de sauvegarde de la base de données chaque semaine » de l'annonce Développeur, et les
tâches « nettoyer les bases existantes », « consolider les anciens formats », « superviser
l'utilisation du serveur ODK » de l'annonce Data Analyste, portent sur des fonctions que j'ai
déjà écrites moi-même.

À cela s'ajoute la familiarité institutionnelle : près de huit ans au MPCE, ministère sous la
tutelle duquel se trouve le CTPEA, avec des réunions de cadrage conduites avec le MEF — le même
MEF dont le mémorandum d'harmonisation salariale fixe la rémunération de ce poste.

## Points à vérifier avant l'envoi

Trois points relèvent d'une décision personnelle et ne peuvent pas être tranchés depuis le dépôt.

**1. Le diplôme — à trancher avant tout envoi.** Les deux annonces exigent « au moins un master /
une maîtrise ». La pièce disponible est
`../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf`, une **attestation du
Secrétariat Général du CTPEA datée du 9 mai 2018**. Son texte est précis et il faut le lire
exactement : elle atteste que M. Disla, de la promotion 2010–2014, « a suivi tous les cours et
réussi avec succès les examens », et qu'ayant complété l'ensemble des exigences du programme,
il « **obtiendra** son diplôme d'Études Supérieures en Économie Appliquée, **après l'examen de
son mémoire de sortie devant un jury** constitué par le Centre ».

Autrement dit, en l'état de cette pièce, **le diplôme n'a pas encore été délivré** : il reste
suspendu à la soutenance du mémoire de sortie. Le CV a été aligné sur ce que le document
soutient — « Programme du Diplôme d'Études Supérieures en Économie Appliquée […] scolarité
complète et ensemble des examens réussis, attestés par le Secrétariat Général du CTPEA » — et
la mention « Lauréat » a été retirée, faute de pièce qui l'établisse. **La règle est simple : le
CV ne doit jamais affirmer plus que la pièce jointe au même PDF**, sans quoi la contradiction
est visible en deux pages d'écart.

Deux cas de figure :

- **Le mémoire a été soutenu depuis 2018** → le diplôme existe. Le scanner, le déposer dans
  `../../attestation_diplomes/` sous un nom préfixé `01_`, et rétablir dans le CV la formulation
  pleine (« Diplôme d'Études Supérieures en Économie Appliquée »). C'est nettement la meilleure
  position et cela vaut la peine de chercher le document.
- **Le mémoire n'a pas été soutenu** → laisser le CV tel qu'il est. L'écart avec le master exigé
  est alors réel et double, et il doit être assumé sans maquillage : l'argument est
  l'expérience — l'annonce Data Analyste demande quatre ans à un poste similaire, l'annonce
  Développeur trois ans plus cinq ans de conception web, seuils tous largement dépassés — et le
  fait que le CTPEA soit un établissement sous tutelle du MPCE, connu du jury.

Dans les deux cas, envisager d'ajouter les attestations de travail (Caris, MPCE, Tekkod) au
dossier : l'annonce dit « attestations **et** diplômes », au pluriel, et elles renforcent
précisément le versant où la candidature est la plus forte.

**2. Les dates chez Anseye Pou Ayiti.** Le CV maître indique « Jan 2026 – Mars 2026 ». Or le
code de l'application APA porte la mention `vesyon_Avril_2026` et l'extraction du schéma de
production date du 3 avril 2026, ce qui suggère un engagement toujours en cours ou prolongé
au-delà de mars. Les dates du CV maître ont été reprises telles quelles. **À corriger avant
l'envoi si la mission se poursuit** — c'est l'expérience la plus directement pertinente des deux
annonces, et la dater au passé l'affaiblit inutilement.

**3. STATA et SPSS.** L'annonce Data Analyste exige « Maîtrise de STATA, SPSS ». Ni l'un ni
l'autre ne figure dans ce CV, conformément à ce qui a été confirmé : l'analyse repose sur R,
Python/Pandas, SQL et Excel avancé. À noter que le **CV FAES**
(`../faes_ha_j0005/cv_fr.tex`, ligne 75) revendique **Stata en gras**, ce qui contredit ce
dossier. L'un des deux doit être corrigé avant qu'ils ne circulent tous les deux.

## Ce qui n'a pas été revendiqué, et pourquoi

- **STATA, SPSS** — non maîtrisés (voir ci-dessus).
- **jQuery** — exigé par l'annonce Développeur aux côtés de Laravel et ReactJS, mais absent de
  toute expérience réelle. L'application APA n'en utilise nulle part ; le travail front-end
  repose sur Tailwind, Bootstrap et Chart.js. Ne pas l'inscrire.
- **Material Design** — cité par l'annonce, non revendiqué.
- **DHIS2 en administration** — le rôle chez Caris était **producteur de données** uniquement :
  préparation, validation et soumission d'indicateurs. Le CV dit « en qualité de producteur de
  données ». Ne jamais laisser entendre une administration de plateforme.
- **SIMAST** — aucun contact préalable. Ne pas le prétendre. L'argument est l'architecture
  équivalente déjà construite ailleurs, pas une connaissance du système lui-même.

## Construction du dossier

```bash
cd curiculum-vitae-and-letter/specific_situation/mast_psara
./build_psara.sh
```

Le script fusionne les pièces justificatives depuis le dossier central
`curiculum-vitae-and-letter/attestation_diplomes/`, **par ordre alphabétique de nom de fichier** :
les préfixes numériques (`01_`, `02_`…) commandent donc l'ordre d'apparition dans le PDF. Les
`.pdf` sont repris tels quels, les `.jpg`/`.png` convertis automatiquement. Si ce dossier est
vide, le script avertit que les PDF produits sont incomplets au regard des deux annonces.

Le script produit, dans `outputs/` :

| Fichier | Usage |
|---|---|
| `Alexandro_Disla_PSARA_Data_Analyste.pdf` | **À envoyer** — dossier complet, poste d'analyste |
| `Alexandro_Disla_PSARA_Developpeur_Application_Web.pdf` | **À envoyer** — dossier complet, poste de développeur |
| `Alexandro_Disla_CV_PSARA_FR.pdf` / `.docx` / `.md` | Le CV seul, si l'UGP le redemande séparément |
| `Alexandro_Disla_LettreMotivation_PSARA_*.pdf` / `.docx` | Les lettres seules |

Les textes des courriels d'accompagnement, prêts au copier-coller, sont dans
[`emails.md`](emails.md) — objet, corps, relance et mention d'enveloppe pour le dépôt en main
propre.
