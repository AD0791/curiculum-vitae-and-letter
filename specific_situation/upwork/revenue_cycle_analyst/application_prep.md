# Upwork — Financial & Revenue Cycle Analyst : submission brief

What goes in, what may be claimed, and what must not. The paste-ready proposal text is in
[`proposal.md`](proposal.md); the advert as published is in
[`inputs/upwork_financial_revenue_cycle_analyst.md`](inputs/upwork_financial_revenue_cycle_analyst.md).

## The posting

| | |
|---|---|
| **Title** | Financial & Revenue Cycle Analyst for Medical Billing Role |
| **Employer** | Unnamed — "a growing U.S. psychiatric practice" |
| **Platform** | Upwork proposal |
| **Location** | Remote |
| **Rate, duration, deadline** | **Not stated in the advert.** Check the live posting before sending |

This is the second Upwork application in this repo after `remoteleverage_data_analyst/`, and the
HANWASH engagement on the CV was itself won on Upwork — worth saying in the interview, because it
makes the platform history verifiable rather than decorative.

## What to send

1.  `[x]` **Proposal text** — paste block 1 of [`proposal.md`](proposal.md) into the Upwork
    cover-letter field. Raw text, no formatting.
2.  `[x]` **CV** — `outputs/Alexandro_Disla_Resume_RevenueCycleAnalyst_EN.pdf` (2 pages)
3.  `[x]` **Cover letter** — `outputs/Alexandro_Disla_CoverLetter_RevenueCycleAnalyst_EN.pdf` (1 page)
4.  Alternatively, one attachment: `outputs/Alexandro_Disla_FinancialRevenueCycleAnalyst.pdf`
    (letter + CV, 3 pages)

The `.docx` twins are built too, in case the client asks for an editable file.

**The proposal answers the advert's seven "To apply" questions in the advert's own order.** That
structure is the single most important thing in this application: a client who writes a seven-item
checklist is sorting on whether you answered it. Do not replace it with a free-form pitch.

## No contact details — anywhere

Upwork refused the first submission of this proposal outright:

> Sorry, we were unable to save your application. Please remove any contact details. This includes
> phone numbers, email addresses, and links to other websites or services.

Every file that leaves this directory is now stripped accordingly, and the CV and cover letter
headers read **"Contact through Upwork"** in place of the usual phone / email / GitHub block. The
attachments matter as much as the proposal box — they are part of the same submission, and the
GitHub URL is a "link to another service" by that rule just as much as an email address is.

This is the one place where this dossier deliberately breaks the house pattern: every other CV in
`specific_situation/` carries the full contact block, because every other one is emailed. Do not
"fix" these two headers by copying a block back in from another dossier.

The bar to re-check after any edit, from the dossier root:

```bash
grep -nE 'https?://|www\.|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+|\+509|4148-3700|github' \
    proposal.md resume_en.md resume_en.tex cover_letter.md cover_letter.tex
pdftotext outputs/Alexandro_Disla_FinancialRevenueCycleAnalyst.pdf - | grep -nE 'https?://|@|\+509'
```

Both must return nothing. Contact details can be exchanged freely once a contract is open — the
restriction covers the period before that, not the engagement itself.

## The hard problem: the degree requirement

The advert does not say "preferred". It says **"You must have a bachelor's degree or higher in a
quantitatively rigorous field"**, and it lists Economics and Statistics among them. The field is
exactly right; the conferral is not.

The only credential on file is the 2018 C.T.P.E.A attestation
(`../../../attestation_diplomes/AlexandroDISLA_CTPEA_AttestationTemp.pdf`), which states that the
Diplôme d'Études Supérieures is delivered **after** the defence of the exit thesis. So:

*   The CV, the letter and the proposal all say the same thing: four-year higher-education
    programme, coursework complete, diploma pending the thesis defence, attestation available on
    request.
*   **Never write "bachelor's", "master's", "DES obtenu" or "Lauréat".** This is the standing rule
    across every dossier in this repo, and it matters more here than usual because the requirement
    is stated as absolute.
*   The disclosure is made **early and by you**, in item 1 of the proposal and in the letter's last
    paragraph — not buried. A client screening on a hard requirement will either pass on it or not,
    and finding out at offer stage would be worse for both sides.

If you want to change this outcome rather than manage it, the lever is the mémoire de sortie, not
the wording.

## What must NOT be claimed

These limits hold in the current files. They have to hold in the interview too.

*   **No CFA, CPA, CA, ACCA, CMA, FRM or actuarial examination.** The advert lists these under
    "strongly prefer". Item 3 of the proposal says "none of the ones you list" in as many words. Do
    not soften that into "working towards" anything you are not actually enrolled in.
*   **No medical billing, coding, payer or U.S. healthcare reimbursement experience.** Zero. The
    advert offers to train it, which is why the application works at all. Do not imply familiarity
    with CPT coding, claim adjudication, ERAs, clearinghouses or payer portals.
*   **No FP&A, investment-analysis or risk-analysis job title.** The MPCE work is public investment
    execution monitoring and macroeconomic modelling. The letter calls it "variance analysis on a
    public investment portfolio under a different name" — a comparison, deliberately, not a
    relabelling. Do not put "FP&A" on the CV.
*   **No DHIS2/DATIM administration.** Caris was a **data producer** role: production and submission
    of PEPFAR/MER indicators. The CV states the limit in the bullet itself. Never claim
    administration, configuration or metadata management of those platforms.
*   **Tableau is not claimed.** Portfolio work on Tableau Public only; production BI is Power BI and
    Looker Studio. The advert lists Tableau as "valuable but not required", so there is nothing to
    gain by inflating it.
*   **No accounting practice.** No general ledger, no month-end close, no AP/AR ownership, no
    financial statements prepared. Accounts receivable in this role will be new. Reconciliation as a
    *discipline* is genuinely yours; double-entry bookkeeping is not.

## Verify before sending: the item 7 story

Item 7 — the most analytically difficult problem — is the answer the client will actually read
twice. **It is reconstructed from what your CV documents, not from your telling of it**, so read it
once and correct it before it goes out:

*   The setting is Caris Foundation International, multi-site health programme, three sources
    disagreeing (site collection forms, the national health information system, the integrated
    MySQL database).
*   The method is tracing each reported figure back to the individual source record.
*   The two causes named are **duplicate enrolments across sites** and **a denominator defined
    differently in two systems**. Both are consistent with the deduplication and DQA work the CV
    claims — but if what you actually found was something else, replace it. You will be asked to
    expand on this in an interview, and the detail has to be yours.
*   The 40 % figure is the one already on every CV in this repo. Keep it attached to *manual
    production time of the recurring report*, which is what it measures.

Two alternates, if you would rather lead with something else:

*   **MPCE / Development Planning Model** — stronger on the "financial modelling" requirement,
    weaker on "investigate why numbers disagree", which is what the role actually is day to day.
*   **Tekkod N+1 query, 36 s → 0.5 s** — the crispest and most measurable investigation you have,
    but it is a software performance story, and the client is hiring an analyst, not an engineer.
    Good as a second example if asked for another, not as the first.

The current choice is deliberate: item 7 should mirror the job description, and this job description
is a reconciliation job.

## If they test you

The advert requires strong Excel and the proposal says "I am happy to be tested on this" — which
means being ready for a workbook. The plausible test is a reconciliation exercise: two extracts that
should agree and do not, find the difference and explain it. Worth rehearsing, in Excel rather than
in SQL, since Excel is the stated requirement:

*   Pivot both sides to a common grain, then difference them — not a row-by-row eyeball.
*   XLOOKUP/INDEX-MATCH to find what exists on one side and not the other, in both directions.
*   SUMIFS by payer/service/period to localise where the variance concentrates.
*   Check for duplicate keys before concluding anything about amounts — the most common cause of a
    total that is too high while every detail line looks right.
*   Say the denominator out loud before computing any rate.

Also worth an hour of reading before any interview, purely so the vocabulary is not new: the claim
lifecycle (charge → claim → adjudication → payment/denial → appeal), what a contractual adjustment
is versus a write-off, what an EOB/ERA carries, and what "net collection rate" means and why it
differs from gross. You are not claiming to know it; you are avoiding the interview being spent on
definitions instead of on reasoning.

## Before sending

1.  Open the live Upwork posting and check the rate, the contract type and whether a screening
    question set has been added since this advert text was captured.
2.  Paste block 1 of `proposal.md` into the cover-letter field and confirm it fits the character
    limit (it is 4,772 characters; the cap is 5,000).
3.  Re-read item 7 and correct it to what you actually did.
4.  Attach the CV and the letter, or the merged PDF.
5.  Look at the PDFs before attaching them:
    `pdftoppm -png -r 80 outputs/Alexandro_Disla_FinancialRevenueCycleAnalyst.pdf /tmp/rcm`
