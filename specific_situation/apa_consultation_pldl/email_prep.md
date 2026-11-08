# Anseye Pou Ayiti (APA) — Consultation données PLDL : préparation de l'envoi

Procédure, arbitrages et limites de ce qui peut être affirmé. Le courriel prêt à copier est dans
[`emails.md`](emails.md) ; le brief d'origine, verbatim, dans [`inputs/brief_kliyan.md`](inputs/brief_kliyan.md).

## Acceptation (courriel d'APA reçu le samedi 7 novembre 2026)

APA retient la proposition après l'échange du mercredi 4 novembre et pose cinq conditions :
travail autonome avec un minimum de supervision ; planifier les rencontres selon les étapes et la
disponibilité de l'équipe ; respecter les valeurs (Solidarite, Ekselans, Respè, Angajman) et les
principes de communication d'APA ; **deux mois à 2 000 USD par mois** ; **un modèle de contrat
avec calendrier prévisionnel pour le mercredi 11 novembre** (le courriel écrit « 2027 » : c'est
une coquille, le 11/11/2026 est bien un mercredi). APA demande aussi **deux contacts de
référence** ; on en donne trois.

### Ce qui part avec la réponse

| Pièce | Fichier dans `outputs/` | Pages |
|---|---|---|
| Contrat, en kreyòl, en prose | `APA_Kontra_Konsiltasyon_vf.pdf` + `.docx` (locaux, gitignorés) | 2 |
| Exécution du projet | `APA_Egzekisyon_Pwoje.pdf` + `.docx` | 3 (4 en Word) |
| Références | `Alexandro_Disla_Referans_APA.pdf` + `.docx` | 1 |

Sources dans `kontra/` (`kontra.md`, `egzekisyon.md`, reconstruits par `./kontra/build_kontra.sh`)
et `referans/` (`./referans/build_referans.sh`) ; `build_apa.sh` appelle les deux. Le Word est en
Arial (Fira Sans et Montserrat ne sont pas installés chez APA) ; couleurs et logo APA conservés.

**PDF du contrat remplissable** : quatre champs texte (nom et fonction du représentant d'APA, les
deux dates) et deux champs de signature électronique (`SiyatiAPA`, `SiyatiKonsiltan`), signables
dans Acrobat Reader (« Signer ») ou tout lecteur qui gère les signatures PDF. Les champs de
signature sont posés par `kontra/add_sig_fields.py` (pyhanko), qui les place sur les cadres du
tableau en lisant leur position dans le PDF. Dans le Word, la case signature est une simple ligne. **Depuis le 8 novembre, sa signature manuscrite est déjà dans la case
consultant du PDF** (image tirée d'une photo, `kontra/siyati.local.png`, gitignorée). Il ne reste
alors qu'un champ de signature, celui d'APA, et la date du consultant reste à remplir. Le Word
n'a pas l'image.

### Ce que disent les deux documents (refonte du 8 novembre)

- **Contrat en prose à la première personne**, sans articles : ce qu'APA attend, la solution, la
  méthode agile (2 check-ins de 15 à 30 min par semaine avec le responsable MEAL, documentés et
  partagés), la semaine 1 de prise en main (accès, code PHP mis dans une organisation GitHub APA
  gratuite, formulaires ONA et CommCare, ses propres problèmes), la rencontre kadraj avec l'équipe
  PL-DL, l'environnement de test, les 11 étapes, les livrables, le paiement, les retards.
- **API CommCare prioritaire** ; Playwright seulement si l'API est bloquée ; tout changement
  d'approche documenté et partagé. La figure d'architecture a une variante `fig_achitekti_api`
  (les propositions gardent l'ancienne).
- **Deux paiements de 2 000 USD** (modifié le 8 novembre) : le premier à la fin du premier mois
  (15 décembre 2026) ; le second pour les livrables, une fois tout soumis et validé : documentation
  du système, PowerPoint système, PowerPoint dashboard, code et documents sur le GitHub de
  l'organisation. Le suivi administratif qu'il fait ne change pas ces dates.
  Paiement par virement bancaire sur son compte en dollars US à la BUH, au nom d'Alexandro
  Disla (ajouté au contrat le 8 novembre). Le numéro n'est pas dans le dépôt, qui est public : il
  est dans `kontra/kont_bank.local` (gitignoré), et le contrat construit est gitignoré aussi.
- **Retards** : seuls ceux qui dépendent de lui sont à sa charge (aucun coût en plus pour APA, même
  un jour au-delà des deux mois) ; un retard qui ne dépend pas de lui ne retarde ni les paiements
  ni la validation des livrables.
- **Ordre des 11 étapes** : celui qu'il a écrit, sauf deux déplacements logiques : construire le
  dashboard sur `base_test` (son point 9) vient avant le déploiement définitif (son point 10), et
  la suppression de l'environnement de test (son point 8) vient après ce déploiement.
- **Kreyòl** : ses formulations, avec des coquilles corrigées (`googlesheet_tes` →
  `googlesheet_test`, « kenn » → « nou », « angwo » → « an gwo »).
- Retirés de l'ancien modèle : le report du calendrier par simple
  courriel, les clauses fiscalité, résiliation et litige, les principes de communication à remettre
  en R1. La durée reste du 16 novembre 2026 au 15 janvier 2027.

### À faire avant la réponse

1. **Contacts des références (remplis le 8 novembre)** : Pierre Robinz Cassion
   +509 4916-3700 / 3795-1719 / 3138-0001 ; Reginald Victor +509 4730-8025 (repris du dossier
   FAES, titre donné le 7 novembre) ; Alex Bonhomme +509 3753-1020. Le build échoue si Christ-Love
   Henry réapparaît (elle est déjà chez APA) ou s'il reste un `[a konplete]`.
2. **Signer le contrat** dans le PDF (champ `SiyatiKonsiltan`) ou laisser APA signer en premier.
3. **Relire la colonne « Kad kolaborasyon »** des références : elle décrit ce que chacun peut
   attester (Caris : CommCare, MySQL, qualité des données ; Tekkod : pipelines, bases, dashboards ;
   HANWASH : mWater, indicateurs, dashboards automatisés). À corriger si un répondant a vu autre
   chose.
4. **Prévenir les trois répondants** qu'APA peut les appeler.
5. APA relira le contrat avec ses propres règles RH ou juridiques ; ne pas présenter le texte comme
   un avis juridique.

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
| Proposition V3 · Faz pa faz | `APA_Pwopozisyon_Teknik_V3_Faz_pa_Faz.pdf` (+ `.md`) | 3 |

**On n'envoie qu'une seule des trois propositions**, avec le CV. Pour un seul fichier :
`pdfunite outputs/APA_Pwopozisyon_Teknik_V1_Direksyon.pdf outputs/Alexandro_Disla_CV_APA_FR.pdf outputs/Alexandro_Disla_Dossier_APA.pdf`
(changer `V1_Direksyon` selon la version choisie). Tout se reconstruit avec `./build_apa.sh`.

## Choisir la version

Les trois couvrent les deux scénarios CommCare, ce qu'APA obtient (section « Sa APA ap jwenn »), le
coût, la durée et la preuve de travail. **La durée est ferme : 3 mois**, avec les six justifications
qu'il a rédigées lui-même (développer, comprendre les données PLDL, tester, garantir la solidité,
rester dans les dépenses cloud actuelles d'APA, documenter et former). Elles diffèrent par le
lecteur visé :

- **V1 · Direksyon** : pour la direction. Peu de jargon ; le flux en trois étapes, le choix du
  scénario selon le plan CommCare, ce qu'APA obtient, le coût, une courte présentation du
  consultant. À choisir si le lecteur décide sans être technicien.
- **V2 · Teknik** : pour le spécialiste MEAL ou un relecteur technique. Architecture complète par
  fournisseur, tableau des trois Lambda, clés d'*upsert* par dépôt, contrôles qualité, sécurité,
  livrables détaillés (Lambda, dashboard en GoogleSQL, table `commcare_pldl`), risques. À choisir si quelqu'un d'APA va vérifier la faisabilité.
- **V3 · Faz pa faz** : feuille de route en quatre phases avec livrables et critères d'acceptation,
  sans durée par phase, puis un tableau qui rattache chaque livrable à la phase qui le produit. À choisir si APA n'est pas sûr de son plan CommCare : la phase 2 (API)
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
