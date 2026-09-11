# Action Contre la Faim Haïti — Responsable département MEAL : préparation du dépôt

Coordonnées d'envoi, composition du dossier et limites de ce qui peut être affirmé.
Les textes d'e-mail prêts à copier sont dans [`emails.md`](emails.md).

## Coordonnées

| | |
|---|---|
| **Destinataire** | `recrutement-pap@ht-actioncontrelafaim.org` |
| **Objet** | `Candidature - Responsable département MEAL - Alexandro Disla` |
| **Publication** | 25 août 2026 |
| **Date limite** | **4 octobre 2026** |
| **Lieu** | Port-au-Prince, Haïti — présence 5 jours/semaine, déplacements terrain |
| **Rattachement** | Directeur Pays |

### La mention obligatoire

> « Aucune candidature ne sera acceptée sans la mention de l'intitulé du poste :
> **Responsable département MEAL** »

L'annonce en tête d'affiche écrit « Responsable MEAL », mais la clause de rejet cite
**« Responsable département MEAL »**. C'est cette formulation exacte qui figure dans l'objet du
courriel, dans le bloc destinataire des deux lettres et dans le nom du PDF fusionné. Ne pas la
raccourcir.

## Pièces du dossier

⚠️ **La liste officielle des pièces manque.** La section « Dossier de candidature » renvoie à
« l'ensemble des documents indiqués ci-dessus » — or aucune liste ne précède dans le texte diffusé
(voir [`inputs/acf_responsable_meal_jd.md`](inputs/acf_responsable_meal_jd.md)). Si tu retrouves
l'annonce complète, aligne cette checklist et `credentials/README.md` dessus avant d'envoyer :
ACF précise que les candidatures incomplètes ne sont pas considérées.

En attendant, le dossier est monté sur la composition standard d'un dépôt ACF Haïti, en **un seul
PDF fusionné** : `outputs/Alexandro_Disla_ResponsableDepartementMEAL_ACF.pdf`

### Contenu, dans l'ordre de fusion

1.  `[x]` **Lettre de motivation (français)** — 1 page
2.  `[x]` **Curriculum Vitae (français)** — 2 pages
3.  `[x]` **Cover letter (anglais)** — 1 page
4.  `[x]` **Curriculum Vitae (anglais)** — 2 pages
5.  `[ ]` **Attestation C.T.P.E.A** — **OBLIGATOIRE**, voir ci-dessous
6.  `[ ]` Baccalauréat — facultatif
7.  `[ ]` Certificats / attestations de travail (Caris, HANWASH, MPCE…)
8.  `[ ]` Pièce d'identité (CIN ou passeport), NIF, NUI

Les pièces 5 à 8 ne sont pas dans le dépôt : dépose-les dans `credentials/` selon le nommage de
[`credentials/README.md`](credentials/README.md), puis relance `./build_acf.sh`. Le script
convertit les images en PDF et fusionne dans l'ordre des préfixes `01_`, `02_`…

Les deux langues sont incluses parce que l'annonce exige la « maîtrise du français et de
l'anglais », et parce qu'ACF-USA pilote la mission Haïti depuis New York et Nairobi. Le français
passe en premier : l'annonce et le bureau recruteur sont francophones.

## Ce qui ne doit PAS être affirmé

Ces limites sont respectées dans les fichiers actuels. Elles doivent tenir aussi en entretien.

*   **Aucun master délivré.** La seule pièce disponible est l'attestation C.T.P.E.A de 2018, qui
    indique que le Diplôme d'Études Supérieures est délivré **après** la soutenance du mémoire de
    sortie. Le CV écrit « Scolarité complétée ; Diplôme d'Études Supérieures en attente de la
    soutenance du mémoire de sortie » et la lettre pose la réserve en toutes lettres. Ne jamais
    écrire « master », « DES obtenu » ni « Lauréat ».
*   **L'attestation doit partir avec le dossier.** Le CV et la lettre annoncent tous deux
    « attestation officielle jointe au dossier ». Envoyer sans elle transformerait une réserve
    honnête en affirmation invérifiable — c'est le seul défaut qui rendrait ce dossier malhonnête.
*   **Pas d'administration DHIS2/DATIM.** À la Caris Foundation, le rôle était **producteur de
    données** : production et soumission des indicateurs PEPFAR/MER. Le CV et la lettre le
    précisent (« en tant que producteur de données », « soumission de données »). Ne jamais
    revendiquer l'administration, la configuration ou la gestion des métadonnées de ces
    plateformes.
*   **Aucune enquête SMART ou IRNA dirigée.** L'annonce les cite explicitement. La lettre le dit
    franchement et rattache ce qui est réel : formation en échantillonnage et analyse statistique,
    coordination de collectes multi-sites. Ne pas laisser entendre le contraire en entretien.
*   **Pas dix ans de MEAL en ONG.** Le compte honnête est **cinq ans en ONG** (Caris, HANWASH,
    Anseye Pou Ayiti) et **huit ans au MPCE** sur le suivi d'exécution du Plan Triennal
    d'Investissement et la modélisation statistique. Le CV et la lettre annoncent le total *et* sa
    décomposition. Ne jamais présenter les dix ans comme dix ans d'ONG.
*   **Pas d'expérience ECHO ni UE.** L'annonce liste USAID, Banque mondiale, ONU, ECHO et UE. Ce
    qui est réel : **USAID** (PEPFAR/MER via la Caris Foundation) et **ONU** (projet sous contrat
    UNOPS chez CassionSoft). Le dossier ne cite que ces deux-là. Ne pas ajouter ECHO, l'UE ni la
    Banque mondiale.
*   **Pas d'outil APR connu de l'intérieur.** L'APR (Rapport d'Avancement des Activités) est un
    outil interne à ACF. La lettre parle du *cycle de production* d'un rapport bailleur, ce qui est
    réel, sans prétendre connaître l'outil lui-même.
*   **Pas de rédaction de presse.** L'annonce demande d'appuyer les articles de presse, études de
    cas et success stories, et de superviser la communication externe. Ce qui existe : guides
    techniques, rapports d'analyse, tableaux de bord. Ne pas inventer un portefeuille éditorial.

## Points à préparer pour l'entretien

Le premier tri se fera probablement sur le master et sur les dix ans en ONG. Les deux réserves
étant posées par écrit, l'entretien se joue sur ce qui les compense :

*   **Encadrement.** Le poste supervise un Responsable régional MEAL et des Agents MEAL. Le
    précédent réel est la Caris Foundation : supervision des agents de collecte sur l'ensemble des
    sites et encadrement technique du personnel de suivi-évaluation.
*   **Harmonisation multisectorielle.** ACF Haïti couvre nutrition, santé, WASH et SAME. Le
    précédent réel est la standardisation des formulaires et des flux entre sites à la Caris, plus
    trois secteurs distincts déjà pratiqués (santé/VIH, EAH, éducation).
*   **Atelier d'apprentissage annuel.** Rien de directement comparable au CV. À préparer comme une
    proposition de méthode, pas comme un antécédent.
*   **Ce que personne d'autre n'apporte :** la base de suivi des subventions et la feuille de
    résumé des paramètres clés demandées par l'annonce sont un travail d'ingénierie de données —
    bases relationnelles, pipelines ETL, tableaux de bord — et c'est le métier exercé en parallèle
    chez Tekkod. Peu de candidats MEAL construisent eux-mêmes le système qu'ils pilotent.

## Avant d'envoyer

1.  Déposer l'attestation C.T.P.E.A dans `credentials/` sous `01_attestation_ctpea.pdf`
    (le fichier source est `../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf`).
2.  Relancer `./build_acf.sh`.
3.  **Ouvrir le PDF fusionné et le regarder page par page** — vérifier que l'attestation y est.
4.  Vérifier que l'objet du courriel contient bien « Responsable département MEAL ».
5.  Envoyer à `recrutement-pap@ht-actioncontrelafaim.org` avant le **4 octobre 2026**.
