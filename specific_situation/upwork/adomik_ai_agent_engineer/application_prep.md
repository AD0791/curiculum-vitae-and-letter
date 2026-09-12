# Adomik — AI Agent Engineer (Upwork) : submission brief

Built 2026-09-12. Advert verbatim in
[`inputs/upwork_adomik_ai_agent_engineer.md`](inputs/upwork_adomik_ai_agent_engineer.md).
Paste-ready text in [`proposal.md`](proposal.md).

## Read this first

**The client has ruled you out by location, in writing, before reading anything you send:**

> Candidates located outside this time-zone range should not apply. Applications from candidates
> outside the required time zone will not be reviewed and will not receive a response.

The range is UTC-1 to UTC+3. Port-au-Prince is UTC-5. There is no reading of that sentence under
which this application is likely to be read, and **the honest expectation is silence**. Nothing in
this dossier pretends otherwise: the proposal opens by answering "no" and explicitly invites them to
discard it.

**Do not fix this by adjusting your stated location.** It is the one edit that would turn a long
shot into a fraud, it is checked against your Upwork profile and your payment details, and it would
cost you the account. If you are not prepared to send an application that says "no" in its first
line, send nothing.

The second gap, **Ruby**, is narrower than it first looked. The advert asks for *"Professional
experience with Ruby"* under REQUIRED EXPERIENCE. You learned Ruby and Rails at Flatiron School's
software engineering program in 2019 — that program is built on Ruby and Rails, so the foundation is
real and it is the reason `FlatIron School (Software Engineering)` already sits in your education
section. What you do not have is **production** Rails: every paid backend engagement in your record
is Python or PHP.

The proposal therefore splits the claim rather than answering yes or no: trained and able to work in
a Rails codebase, not professionally experienced in one, stated in those words. That is honest and
it is also the stronger play — a bare "no" invites the filter, and a bare "yes" collapses the moment
someone asks which production Rails app you shipped.

**If you have actually shipped Rails professionally and it is simply missing from your CVs — the way
PHP and Laravel were — tell me and I will upgrade the claim.** That would remove the second blocker
outright. Until then it stays as written.

Separately: the Ruby icon in the tech strip of `ad0791.github.io/README.md` is now *less* of a
problem than I thought, since you do know the language. It is still worth a look — a badge strip
implying production use across a dozen technologies is a claim like any other.

## So why is this dossier here at all

Because **location is now the only hard blocker left**, and on everything else this is the
best-matched role in the repository. Two things from the posting sidebar shift the odds in your
favour, even if they cannot undo the geography:

- **Experience level: Intermediate**, with *"I am looking for a mix of experience and value"*. They
  are not screening for a senior Paris-rate engineer. Your Python, SQL and data depth sits at or
  above what they asked for, which is a comfortable place to be arguing from.
- **$17–20/hour for 30+ hours over 6+ months.** A budget-conscious client has a reason to look past
  a rule they wrote for convenience — which is not a reason to expect it, only a reason the attempt
  is not absurd.

The requirement-by-requirement position:

| Their requirement | Your position |
|---|---|
| 3+ years professional Python | ~5 years, backend and data |
| Backend applications / REST APIs | FastAPI, JWT, RBAC, repository pattern, OpenAPI |
| Strong SQL, complex analytical queries | BigQuery, PostgreSQL, MySQL, SQL Server; window functions, optimisation, execution plans |
| Data science / analysis, statistical reasoning | Applied economist; statistical modelling, forecasting and simulation |
| Data processing / analytics | Apache Beam ETL, MongoDB → BigQuery, idempotent loads |
| Git, testing, code review, CI/CD | Documented across both Tekkod engagements |
| Async programming, caching, performance | Async SQLAlchemy 2.0, FastAPI; the N+1 diagnosis and fix |
| Anomaly detection, metric decomposition *(nice to have)* | MPCE variance analysis; DQA anomaly triage against source records |
| OAuth 2.0, JWT, application security *(nice to have)* | OAuth2/JWT and RBAC, implemented twice |
| Claude / LLM tooling *(nice to have)* | Daily Claude and Claude Code use |
| French *(preferred)* | Native |
| **Ruby / Rails** (required) | Flatiron School 2019, solid foundation — **but no production Rails** |
| **Snowflake, Bedrock** | **None** — BigQuery and AWS instead |
| **MCP in production** | **None** — the advert treats this as learnable |
| **Location within 2 h of Paris** | **No — UTC-5** |

The proposal's strongest passage is the one about their own design principle — deterministic
numerical computation with the language model confined to language. That is an applied economist's
instinct and a data-quality practitioner's instinct at once, and it is the single best argument that
you would be good at this job rather than merely qualified on paper. If any part of this gets read,
that is the part that earns a reply.

## The time-zone arithmetic — check it, because it is load-bearing

Haiti observes US daylight saving. Paris observes EU daylight saving. The two shift within a few
weeks of each other, so **the offset is six hours in both winter and summer** and does not drift:

| | Paris | Port-au-Prince | Gap |
|---|---|---|---|
| Winter | UTC+1 (CET) | UTC-5 | 6 h |
| Summer | UTC+2 (CEST) | UTC-4 | 6 h |

So 09:30–18:30 Paris is **03:30–12:30** in Port-au-Prince, the same two numbers year-round. The
proposal states this as a fact and offers it as the reason the rule's *purpose* is met even though
its *letter* is not. Verify it against a clock before sending — an error here would discredit the
one technical argument the proposal makes.

There is a brief mismatch each spring and autumn when the US and EU switch on different dates. It is
a week or two of a seven-hour gap, it is not worth mentioning unprompted, and it is worth knowing if
they ask.

## Decisions you owe before sending

**1. The rate — now $20, not the $35 I first wrote.** The posting's sidebar carries a band the body
text does not mention: **$17.00–$20.00 per hour**, at **Intermediate** experience level, with *"I am
looking for a mix of experience and value"*. $35 was double their ceiling and would have been
screened out on the number alone before anyone read a word about time zones.

$20 is the top of their band. That is the right ask: you are at the experienced end of
"intermediate" for this stack, and there is no reason to bid under a posted ceiling. The proposal
adds one line inviting them to name a firm lower number rather than discard you over it — worth
keeping, because you are already asking them to bend a harder rule.

**If you want a lever, $18 is the one.** Dropping to it costs you about $350 a month and gives them
a reason to look past the geography. That is a trade only you can price.

**Do not let the $10/hour in `../generalist_web_dev/` anchor this either.** Different market
entirely: that is a small agency at $1,000–1,500/month; this is $20/hour over 30–40 hours for six
months or more, which is roughly $2,600–3,500 a month.

Note the sidebar also says **"More than 30 hrs/week"** where the body says "approximately 40". The
proposal commits to 40. If you would rather commit to 32 or 35, change item 4 — but a lower number
weakens the one requirement you can fully meet, so I would leave it.

**2. Your start date and the Tekkod overlap.** The proposal says "within one week" and commits to 40
hours. You are currently Software Engineer at Tekkod LLC. A full-time 40-hour engagement on Paris
hours is not compatible with another full-time role, and 03:30–12:30 local leaves your afternoon
free in a way that might make it look compatible when it is not. Decide what is true before you send
a number, because this one becomes a contract.

## What must NOT be claimed

- **No *production* Ruby or Rails.** Flatiron School 2019 is real and is claimed; shipped Rails is
  not. The proposal draws that line in so many words. Do not let it blur into "professional
  experience with Ruby" in a later message or an interview — that is the exact phrase the advert
  used, and it is the one thing they will check first if the application survives.
- **No Snowflake, no Snowflake Cortex, no SPCS, no AWS Bedrock.** Your warehouse work is BigQuery
  and your cloud work is AWS, GCP and Azure. "Snowflake" appears in your study notes only as the
  *snowflake schema* of dimensional modelling, which is an unrelated term — do not let that become a
  claim.
- **No MCP or FastMCP in production, no LangGraph.** Daily Claude and Claude Code use is real and is
  claimed; building MCP servers is not. The advert explicitly welcomes candidates motivated to learn
  MCP, so there is nothing to gain by overstating it.
- **No AdTech.** No SSP, DSP, header bidding or programmatic experience. Not mentioned rather than
  deflected.
- **Do not misstate your location.** Stated again because it is the only edit that could get you
  banned rather than rejected.

## No CV in this dossier

By design, per [`../README.md`](../README.md): the advert asks for seven items in the proposal and
nothing else, and building a tailored LaTeX CV for an application the client has said they will not
read is effort better spent elsewhere. If they do reply, a tailored CV is one build away — the
`revenue_cycle_analyst/` pair is the closest starting point, and it would need the Python, FastAPI,
Beam and async work promoted to the top.

## If you want this kind of work rather than this job

This advert is worth keeping as a specimen. It describes, more precisely than anything else in this
repository, the intersection your profile actually sits on: Python backend, analytical SQL,
statistical reasoning and applied LLM work. Search Upwork for that shape without the Paris
constraint — the same posting exists with a US or worldwide time zone, and against those you fail on
Ruby alone rather than on Ruby and geography.
