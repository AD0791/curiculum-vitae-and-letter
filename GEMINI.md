# GEMINI.md - Project Context

## Project Overview
This repository is a structured collection of professional documents, primarily **Curriculum Vitae (CV)**, **Resumes**, and **Terms of Reference (TDR)** for **Alexandro Disla**. It highlights a unique **multidisciplinary hybrid profile** bridging **Monitoring, Evaluation, Accountability, and Learning (MEAL)**, **Data Engineering**, **Software Engineering (Fullstack)**, and **Applied Economics**. It uses **LaTeX** (specifically the `moderncv` class) for high-quality document generation and **Pandoc** for document conversion.

The project is organized to manage multiple versions (English/French), specific job-related projects, and historical versions of professional applications.

## Directory Overview
- **Root Directory:** Contains the main LaTeX source files for the unified multidisciplinary English and French resumes, along with the primary build script.
- **`appels_doffres/`:** Contains job descriptions and tender documents.
- **`jobs/`:** Contains specific documents related to particular job applications or projects.
- **`tdr/`:** Focuses on "Terms of Reference" (TDR) documents, including a specialized build script for DOCX conversion.
- **`old_version/`:** A comprehensive archive of previous versions of cover letters, recommendation letters, and older CV templates.
- **`specific_situation/`:** One self-contained directory per application, each with its own tailored CV, cover letter(s) and build script. See "Tailored application dossiers" below — this is where most active work happens.
- **`attestation_diplomes/`:** The single central store of record for supporting documents (diplomas, work certificates, transcripts) — a credential is scanned once and lives here, never committed inside a dossier. Most build scripts stage what a given advert demands through the dossier's own gitignored `credentials/`; `mast_psara/` merges straight from this directory. See "Tailored application dossiers" for which does which.

## Key Files
- `alexandro.disla_cv.tex`: Main French CV source (Unified Multidisciplinary Profile).
- `alexandrodislaResume.tex`: Main English Resume source (Unified Multidisciplinary Profile).
- `build_cv.sh`: Bash script to compile the LaTeX sources into PDFs using `latexmk`.
- `tdr/tdr_analyst_data_dev.tex`: Source for Data/Dev Analyst Terms of Reference.
- `tdr/build_tdr.sh`: Script to convert TDR LaTeX files to DOCX using `pandoc`.

## Usage & Building

### Building Resumes (PDF)
The main resumes can be built using the provided shell script. It requires `latexmk` and a TeX distribution (like TeX Live).
```bash
./build_cv.sh
```
This script generates `Alexandro_Disla_Resume_English.pdf` and `Alexandro_Disla_Resume.pdf`, then cleans up auxiliary LaTeX files.

### Building TDRs (DOCX)
Terms of Reference documents are intended for word processing format and are converted using `pandoc`.
```bash
cd tdr
./build_tdr.sh
```
This requires `pandoc` to be installed.

## Tailored application dossiers (`specific_situation/`)

Each application gets its own directory. **`acf_responsable_meal/` is the fullest example of the
current pattern** — bilingual pair, `credentials/`, `inputs/`, `email_prep.md` and `emails.md` —
and is the one to copy for a new dossier. `samaritans_purse_senior_meal/`, `cmmb_me_officer/`,
`faes_ha_j0005/`, `goal_officier_redevabilite/`, `crs_spo_meal/`, `crs_po_meal/`,
`acted_assistant_meal/` and `concern_gestion_information/` share that shape. The last two are the
model for the commonest case, **one post, French only**: one `cv_fr`, one `cover_letter_fr`, one
merged PDF. `panos_mel_acq/` has the shape without a `credentials/` directory; `mast_psara/` is
mature but predates the local `credentials/` convention (see below) and remains the model for the
*two posts, one CV* case. The older
`mercy_corps/`, `acted_assistantDB/`, `iom_web_content_developer/` and `parole_et_action/` predate
parts of the pattern, and `remoteleverage_data_analyst/` is a stub holding outputs only.
`apa_consultation_pldl/` is the model for a third case, a **consulting pitch** with no advert: a
tailored CV plus technical proposals written in Markdown, described under "Consulting proposals"
below. The shape is:

| File | Role |
|---|---|
| `cv_fr.tex` / `resume_en.tex` (+ `.md` twin) | The tailored CV. The `.md` twin is not decoration — `pandoc` builds the `.docx` from it, so **the two must be edited together or they silently drift** |
| `cover_letter_*.tex` (+ `.md` twin) | One letter per post. A dossier covering two posts keeps one CV and two letters |
| `build_<name>.sh` | `latexmk` → PDF, `pandoc` → DOCX, `sips` → image-to-PDF, `pdfunite` → merged dossier. Cleans its own LaTeX artefacts |
| `outputs/` | Everything the script generates. Nothing here is hand-edited |
| `email_prep.md` | The submission brief: deadline, address, the contents checklist, what may and may not be claimed, and what still needs the user's decision |
| `emails.md` | Copy-paste-ready email subject and body per post, plus a follow-up. **Raw text only** — see the rule below. Newer dossiers split this out of `email_prep.md`; the older ones still keep drafts inline |
| `inputs/` | The job advert as published, kept verbatim. Note in the header anything the published text omits |
| `credentials/` | Gitignored staging area for scans the merged PDF needs. Holds only a committed `README.md` naming what to drop in and in what `01_`, `02_` order |

**No credential is ever committed inside a dossier.** `attestation_diplomes/` stays the single
store of record: a diploma or work certificate is scanned once and lives there. Two build scripts
implement that principle differently, and both are in use — read the script before assuming which:

- **Gitignored local staging (`credentials/`)** — every dossier listed above as sharing the
  shape, except `panos_mel_acq/`. The user copies the scans a given advert demands into the
  dossier's own `credentials/`, which a `.gitignore` *inside that dossier* (`credentials/*`,
  `!credentials/README.md`) excludes except for its `README.md`; the repository-level
  `.gitignore` does not cover it, so a new dossier must copy that file too. This is the dominant
  pattern, because adverts ask for identity papers (CIN, NIF, NUI) that have no business in
  `attestation_diplomes/` and differ per employer.
- **Direct read from the central store** — `mast_psara/` alone, whose `CREDENTIALS_DIR` points
  at `../../attestation_diplomes/`. Simpler, but only workable when the advert wants nothing
  beyond the diplomas already on file.

Either way the directory is read **sorted by filename**, so `01_`, `02_` prefixes control the
order pages land in the merged PDF, and the script prints a loud warning when it finds the
directory empty rather than quietly producing an incomplete dossier. When an advert demands a
single PDF, the script assembles it in the order the advert states — letter → CV → credentials,
with the advert's own language first when the dossier is bilingual.

**A CV may never claim more than the credential attached beside it in the same PDF.** When the
diploma travels with the CV, an overstated education line is contradicted two pages later by the
applicant's own attachment. The converse holds too: when the CV or letter points to an attached
credential, attach it even if the advert asks only for a CV and a letter.
`concern_gestion_information/` does this with the C.T.P.E.A attestation, because the post
requires a Bac+4 and the education line refers the reader to the attestation.

**An email draft is raw text the user pastes into a mail client, so it carries no Markdown.**
Never wrap a draft in `>` blockquotes, and keep `**bold**`, `[link](url)` syntax and list bullets
out of the body and the signature — every one of those characters pastes literally and has to be
stripped by hand, which defeats the point of the file. Headings and `---` rules *between* drafts
are fine; everything from the `Objet :` / `Subject:` line down to the last line of the signature
must be exactly what gets sent, bare URLs included. Markdown linters will flag those bare URLs
(`MD034`) — that warning is wrong here and stays unfixed. The rule applies to any message drafted
for the user to send, not only to `emails.md`.

## Consulting proposals (`apa_consultation_pldl/`)

A pitch to a client rather than an answer to an advert. `apa_consultation_pldl/` (Anseye Pou Ayiti,
CommCare data for the PLDL programme) is the reference. Its `inputs/brief_kliyan.md` holds the
user's brief verbatim in place of an advert. There is no `credentials/` directory and no cover
letter: the proposal does that job. It differs from an application dossier in four ways:

- **Proposals are Markdown, built to a branded PDF** by `pandoc --pdf-engine=xelatex -H
  apa_header.tex --lua-filter apa_filters.lua`. The header carries the client's palette, fonts,
  title block and page furniture. The Lua filter swaps each figure's PNG, which the `.md` displays,
  for its vector PDF, and keeps a heading on the same page as the figure or table that follows it.
  Several alternative versions are written for different readers, and the user sends one.
- **Every diagram is built from the official logo of each component**, as TikZ cards
  (`pwopozisyon/figures/fig_style.tex`): flow, architecture by provider zone, scenario choice,
  cost cards, phase ribbon. Logos come from the vendors' own kits, are never recoloured or
  distorted, and are recorded with URL and terms in `assets/logos/SOURCES.md`. Raw archives under
  `assets/logos/_src/` are gitignored. A product without a logo gets a text badge; never borrow
  another project's logo.
- **The build checks what it ships**: page count per proposal (2–3) and for the CV (≤ 2), a scan
  of every output for the client's internal secrets and host names, and that the CV does not
  mention the client when the user asked for that job to be removed.
- **Kreyòl documents** use the client's own vocabulary (APA says *fòmilè*, *dachbòd*, *bakòp*,
  never *sondaj*), no space before `:`, ragged-right text without hyphenation (babel has no
  Haitian Creole patterns), and no `lang` setting. The user's spellings override any dictionary:
  *done brit* (never *bwit*), *konntenè*, *apresa* in one word, *reyitilise*, *sèten*. When he
  supplies Creole text himself, keep his wording and fix only unmistakable slips (stray letters,
  French words such as *et* or *en plas*, missing accents), naming each fix so he can revert it.
- **Every proposal version carries a "Sa APA ap jwenn" section**, shaped for its reader rather than
  copied: plain bullets for leadership, the technical substance of each deliverable for a technical
  reader, and a deliverable / benefit / phase table in a phased roadmap.

Three LaTeX traps this dossier hit: the `needspace` package's `\penalty-100` makes TeX break pages
early under `\raggedbottom`, so `apa_header.tex` defines its own `\apaneedspace`. The header also sets
`\widowpenalty` and `\clubpenalty` to 10000, so no paragraph leaves a single line alone on a page. `\lg` is already
a math operator. `fontawesome5` writes *alt* icons starred (`\faSync*`, not `\faSyncAlt`).

## Agent Expertise
When working in this repository, the agent should act with the following expertise:
- **University Professor:** Expert in pedagogy, curriculum design, and simplifying complex technical concepts for learners.
- **Exam Architect:** Specialist in designing high-stakes technical evaluations, mock exams, and structured study plans.
- **MEAL Specialist:** Expert in Monitoring, Evaluation, Accountability, and Learning frameworks, Logframes, and ITTs.
- **Data Analyst:** Mastery of data automation, visualization (Power BI, Looker Studio), and reporting (RMarkdown/Quarto).
- **LaTeX Expert:** Deep understanding of `moderncv`, preamble configuration, and document layout.
- **Professional CV & Cover Letter Builder:** Ability to craft compelling professional narratives.
- **Professional CV & Cover Letter Reviewer:** Critical eye for formatting, grammar, and impactful content.
- **Pandoc Expert:** Mastery of document conversion between LaTeX, Markdown, and DOCX.
- **Bash Script Expert:** Proficiency in maintaining and optimizing build automation scripts.

## Development Conventions
- **LaTeX Class:** Most documents use the `moderncv` class with the `classic` style and `blue` color scheme.
- **Formatting:** Use standard LaTeX command `\textbf{...}` for bold (avoid markdown `**...**`) and always escape ampersands (`\&`).
- **Page geometry — do not improvise here.** `geometry`'s `scale` is the *fraction of the paper the text block occupies*, so raising it removes margins. Letters use `scale=0.82` (~1.9 cm margins), CVs `0.85`–`0.88`. **Never exceed ~0.9, and never change `scale` to solve a pagination problem** — at `scale=1.0` the text runs clean off the edge of the page.
- **Making a letter fit one page:** cut text first; then drop `11pt` to `10pt`. Do **not** pull `\makeletterclosing` up with a negative `\vspace` — `moderncv` reserves that space for a handwritten signature, and removing it prints the signature on top of the last paragraph.
- **`\title{}` in `moderncv` `classic` sits in a narrow left column.** Keep it to four or five words, or it wraps over six lines and crowds the name.
- **Verification:** a built document is not finished until it has been *looked at*: `pdftoppm -png -r 80 file.pdf out`, then view the image. A page count proves nothing about whether the page is correct.
- **Encoding:** Files are encoded in **UTF-8** (`\usepackage[utf8]{inputenc}`).
- **Automation:** Prefers automated build scripts (`.sh`) over manual compilation to ensure consistency and clean-up of temporary LaTeX artifacts.
- **Version Control:** Historical versions are maintained in the `old_version/` directory rather than relying solely on Git history for easy side-by-side comparison of templates.
