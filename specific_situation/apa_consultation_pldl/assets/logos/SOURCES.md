# Sous des logos

Tous les logos sont les visuels officiels des éditeurs, téléchargés le 25 octobre 2026, non retouchés
(aucune déformation, aucune recoloration, sauf Hostinger : voir la ligne correspondante). Les
téléchargements bruts sont dans `_src/` (les archives `.zip` y sont ignorées par git : elles se
retéléchargent depuis les URL ci-dessous), les PNG prêts à l'emploi à côté de ce fichier. Les SVG ont
été rendus en PNG par Chrome headless via une balise `<img>` (un SVG chargé comme image n'exécute
aucun script), puis rognés avec `magick -trim`.

| Fichier | Élément | Source officielle | Conditions |
|---|---|---|---|
| `aws_lambda.png`, `aws_s3.png`, `aws_ecr.png`, `aws_secrets.png`, `aws_eventbridge.png`, `aws_cloud.png` | AWS Lambda, Amazon S3, Amazon ECR, AWS Secrets Manager, Amazon EventBridge, groupe « AWS Cloud » | Paquet AWS Architecture Icons `Icon-package_07312026` (31 juillet 2026), https://aws.amazon.com/architecture/icons/ | AWS autorise ces icônes dans les diagrammes d'architecture et les documents (« whitepapers, presentations, data sheets ») |
| `bigquery.png` | BigQuery | Google Cloud, `core-products-icons.zip`, https://cloud.google.com/icons | Bibliothèque officielle destinée aux diagrammes |
| `google_cloud.png` | Google Cloud (logotype) | https://www.gstatic.com/cgc/google-cloud-logo-fullcolor.svg (logo servi par cloud.google.com) | Usage nominatif dans un diagramme |
| `looker_studio.png` | Looker Studio | https://ssl.gstatic.com/analytics-lego/svg/ic_data_studio.svg : icône servie par lookerstudio.google.com lui-même (Google ne publie pas de SVG téléchargeable pour Looker Studio) | Usage nominatif |
| `google_sheets.png` | Google Sheets | https://www.gstatic.com/images/branding/product/2x/sheets_2020q4_512dp.png (icône produit Google Workspace) | Usage nominatif |
| `commcare_mark.png`, `commcare_logo.png`, `commcare_lockup.png` | CommCare (Dimagi) | Kit presse Dimagi, https://dimagi.com/press-kit/logos/commcare-logos.zip | Ne pas modifier le visuel ; garder au moins 18 px d'espace libre autour |
| `playwright.png` | Playwright | https://playwright.dev/img/playwright-logo.svg | Usage nominatif |
| `polars.png` | Polars | https://raw.githubusercontent.com/pola-rs/polars-static/master/logos/polars-logo-dark.svg | Usage nominatif |
| `mysql.png` | MySQL | https://labs.mysql.com/common/logos/mysql-logo.svg | Usage nominatif |
| `php.png` | PHP | https://www.php.net/images/logos/new-php-logo.svg (page officielle des logos PHP) | Usage nominatif |
| `python.png` | Python | Logo officiel de la PSF sans texte, https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg | Politique de marque de la PSF |
| `hostinger.png` | Hostinger | Simple Icons 15.0.0, https://cdn.jsdelivr.net/npm/simple-icons@15.0.0/icons/hostinger.svg | Simple Icons livre le symbole officiel en monochrome ; il a été rempli avec la couleur de marque officielle `#673DE6` |
| `../apa_logo.png` | Anseye Pou Ayiti | `~/Desktop/APA_root/Pwoje_database_Site_APA_vesyon_Avril_2026/logo.png` | Logo du client, utilisé pour sa propre proposition |

httpx2 n'a pas de logo : son README n'affiche qu'un titre texte. Les figures utilisent donc un badge
textuel « HTTPX2 », et jamais le papillon de l'ancien projet httpx.
