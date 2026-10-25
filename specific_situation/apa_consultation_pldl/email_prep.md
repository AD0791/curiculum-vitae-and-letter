# Anseye Pou Ayiti (APA) — Consultation données PLDL : préparation de l'envoi

Procédure, arbitrages et limites de ce qui peut être affirmé. Le courriel prêt à copier est dans
[`emails.md`](emails.md) ; le brief d'origine, verbatim, dans [`inputs/brief_kliyan.md`](inputs/brief_kliyan.md).

## Situation

| | |
|---|---|
| **Nature** | Proposition de consultation, sans avis de recrutement |
| **Dossier créé le** | dimanche 25 octobre 2026 |
| **Date limite** | aucune annoncée |
| **Canal** | courriel ; destinataire et adresse à confirmer |
| **Langue** | propositions en créole haïtien (langue de travail d'APA), CV en français |

## Les pièces

| Pièce | Fichier dans `outputs/` | Pages |
|---|---|---|
| CV, sans le poste APA | `Alexandro_Disla_CV_APA_FR.pdf` (+ `.docx`, `.md`) | 2 |
| Proposition V1 · Direksyon | `APA_Pwopozisyon_Teknik_V1_Direksyon.pdf` (+ `.md`) | 3 |
| Proposition V2 · Teknik | `APA_Pwopozisyon_Teknik_V2_Teknik.pdf` (+ `.md`) | 3 |
| Proposition V3 · Faz pa faz | `APA_Pwopozisyon_Teknik_V3_Faz_pa_Faz.pdf` (+ `.md`) | 2 |

**On n'envoie qu'une seule des trois propositions**, avec le CV. Pour un seul fichier :
`pdfunite outputs/APA_Pwopozisyon_Teknik_V1_Direksyon.pdf outputs/Alexandro_Disla_CV_APA_FR.pdf outputs/Alexandro_Disla_Dossier_APA.pdf`
(changer `V1_Direksyon` selon la version choisie). Tout se reconstruit avec `./build_apa.sh`.

## Choisir la version

Les trois couvrent les deux scénarios CommCare, le coût, la durée et la preuve de travail. Elles
diffèrent par le lecteur visé :

- **V1 · Direksyon** : pour la direction. Peu de jargon ; le flux en trois étapes, le choix du
  scénario selon le plan CommCare, ce qu'APA obtient, le coût, une courte présentation du
  consultant. À choisir si le lecteur décide sans être technicien.
- **V2 · Teknik** : pour le spécialiste MEAL ou un relecteur technique. Architecture complète par
  fournisseur, tableau des trois Lambda, clés d'*upsert* par dépôt, contrôles qualité, sécurité,
  requêtes GoogleSQL, risques. À choisir si quelqu'un d'APA va vérifier la faisabilité.
- **V3 · Faz pa faz** : feuille de route en quatre phases avec livrables et critères d'acceptation,
  sans durée par phase. À choisir si APA n'est pas sûr de son plan CommCare : la phase 2 (API)
  devient conditionnelle, et la seule pièce qui change est mise en évidence.

## Ce qui a été vérifié (sources consultées le 25 octobre 2026)

- **Plans CommCare** (commcare.dimagi.com/pricing) : le plan **Standard n'a ni accès API ni Data
  Forwarding**, mais il a les exports quotidiens enregistrés et l'intégration Excel Dashboard. Le
  plan **Pro (500 $/mois en facturation annuelle) et au-dessus** ajoute l'API et le Data
  Forwarding. D'où : scénario 1 (Playwright) = plan sans API ; scénario 2 (HTTPX2) = Pro ou plus.
- **Case API v2** (commcare-hq.readthedocs.io/api/cases-v2.html) : `GET /a/<domaine>/api/case/v2/`,
  pagination par curseur (`next`), jusqu'à 5 000 cas par page, filtre `server_last_modified.gte`.
  En-tête `Authorization: ApiKey <utilisateur>:<clé>` sans code 2FA ; clé restreignable par IP.
- **httpx2** existe : successeur de httpx maintenu par Pydantic (PyPI, dépôt pydantic/httpx2).
- **Gratuité** : AWS Lambda offre en permanence 1 million de requêtes et 400 000 Go-secondes par
  mois ; BigQuery, 10 Gio de stockage et 1 Tio de requêtes par mois, et les chargements par lots
  sont gratuits ; Looker Studio est gratuit. ECR coûte environ 0,10 $/Go-mois et Secrets Manager
  0,40 $ par secret et par mois. Les totaux des figures (« < 1 $ », « < 2 $ ») sont des
  **estimations**, présentées comme telles.
- **Infrastructure existante d'APA** (lue dans `~/Desktop/APA_root`, en lecture seule) : le script
  de collecte AWS lit déjà la base Hostinger avec des identifiants dans Secrets Manager ; le script
  EDA réécrit la feuille Google en entier à chaque passage ; le récepteur de fiches de suivi fait
  déjà des *upserts* (`INSERT … ON DUPLICATE KEY UPDATE` sur une clé unique). La base de production
  est en réalité MariaDB 11.8 ; les propositions disent « MySQL », comme APA et hPanel.
- **Logos** : visuels officiels non retouchés, sources et conditions dans
  [`assets/logos/SOURCES.md`](assets/logos/SOURCES.md).

## Points à trancher avant l'envoi

1. **Que signifie PLDL ?** Le sigle n'est développé nulle part, ni dans le brief ni dans
   `APA_root`. Les documents écrivent seulement « PLDL ». Ne pas le développer sans confirmation.
2. **Quel est le plan CommCare d'APA ?** Le brief dit qu'APA a accès aux fonctions API, mais qu'il
   faut prévoir le cas contraire. Si le plan est Pro ou plus, le scénario 2 ne coûte rien de plus et
   la V3 peut annoncer la phase 2 comme certaine.
3. **Destinataire** : nom, fonction et adresse. `emails.md` laisse le salut générique.
4. **Source de données du rapport STS EvolveMe** : le CV et les propositions ne la nomment pas. Si
   c'est BigQuery, on peut l'écrire ; c'est un argument direct.
5. **Accès à demander au démarrage** (phase 0) : un compte CommCare dédié à l'automatisation (et la
   manière dont la 2FA y est configurée), un rôle IAM AWS, un projet GCP avec compte de service, un
   utilisateur MySQL limité à la nouvelle table.

## Ce qu'il ne faut pas affirmer

- **Aucun secret, aucun identifiant interne.** Rien de `ENV/master.env`, ni le mot de passe de test
  ni le PIN imprimés dans `Gid_webApp_APA.pdf`, ni noms d'hôte, de base ou de bucket. Le build
  échoue s'il trouve l'un de ces marqueurs dans `outputs/`.
- **Pas de poste APA dans le CV**, à sa demande ; le build vérifie que le CV ne mentionne pas APA.
  Les propositions décrivent pourtant l'infrastructure d'APA en détail : s'il y a une question,
  c'est à l'oral qu'on dit d'où vient cette connaissance.
- **Pas de diplôme C.T.P.E.A délivré** : le CV dit « scolarité complète et ensemble des examens
  réussis », sans attestation jointe cette fois.
- **Pas de coût nul garanti** : les quotas gratuits sont publics et datés ; on parle d'estimation.
- **Pas d'API promise sans plan Pro** : le scénario 2 dépend du plan CommCare, et la V3 le dit.
- **Captures STS** : elles montrent des agrégats d'un autre client (comptes par ville et par
  région, aucune donnée personnelle). Il a validé leur usage comme preuve de travail ; si Tekkod
  ou STS y voit un problème de confidentialité, retirer la section « Prèv travay ».

## Avant d'envoyer

Ouvrir chaque page de la version choisie et du CV (`pdftoppm -png -r 80 <fichier>.pdf apercu`) :
logo net, figures lisibles, aucune ligne qui dépasse. Un nombre de pages ne prouve rien.
