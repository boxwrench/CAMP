# Logic Flow Map

This maps the existing GStack office-hours logic to the proposed Abundance Network skill family.

## Naming Decision

`abundance-diagnosis` is the office-hours equivalent.

It is the front-door guided session. A user brings a concrete public problem or policy idea, and the skill turns it into an Abundance Systems Memo.

The name should emphasize diagnosis because the core rule is: do not advocate before understanding.

## Role In The Skill Family

| GStack Role | Abundance Network Role |
| --- | --- |
| `office-hours` | `abundance-diagnosis` |
| Front-door product/founder diagnostic | Front-door public systems diagnostic |
| Produces a design doc | Produces an Abundance Systems Memo |
| Routes to CEO/eng/design reviews | Routes to foresight/implementation/public-translation/evidence reviews |

## Phase Map

| GStack Office-Hours Phase | What It Does | Abundance-Diagnosis Phase | What It Should Do |
| --- | --- | --- | --- |
| Preamble | Load config, prior sessions, repo state, skill behavior | Preamble | Load config, knowledge library, prior memos, source settings, naming conventions |
| Context Gathering | Understand idea, repo, user goal, stage | Intake | Identify problem or policy idea, jurisdiction, actors, current status, user role |
| Mode Selection | Startup mode vs builder mode | Input Type Selection | Public problem mode vs policy idea mode |
| Startup Product Diagnostic | Demand, status quo, urgency, wedge, user evidence | Systems Diagnostic | Visible failure, existing equilibrium, affected public, authority, blockers, feedback gaps |
| Builder Design Partner | Explore fun, capability, scope, creative alternatives | Policy Idea Exploration | Audit the user's instinct, explain why they believe it, name what would change their mind |
| Related Design Discovery | Search prior design docs | Related Memo Discovery | Search prior Abundance Systems Memos, cases, mechanisms, and pattern-library entries |
| Landscape Awareness | Search current discourse | Evidence Scan | Gather or request live diagnostic material depending on pass one vs pass two |
| Premise Challenge | Test assumptions before solution | Instinct Audit And Premise Test | Test the policy/problem frame against institutions, incentives, political economy, and culture |
| Alternatives Generation | Generate 2-3 approaches | Intervention Portfolio | Generate structural bet, near-term lever, learning experiment, and watchlist |
| Founder Signal Synthesis | Detect founder quality / YC signals | Civic Action Signal | Detect seriousness, local knowledge, coalition potential, implementation access, evidence quality |
| Design Doc | Save product/design artifact | Abundance Systems Memo | Save weighted causal model, system map, evidence ladder, action portfolio, public translation table |
| Approval Gate | Approve/revise/start over | Memo Approval Gate | Approve, revise, request evidence-backed pass two, or start over |
| Founder Resources | Recommend YC/startup resources | Knowledge References | Recommend canonical lenses and case studies relevant to the causal weights |
| Next-Skill Recommendations | CEO/eng/design review | Follow-On Workflows | Strategic foresight, implementation mechanics, public translation, evidence review, feedback-loop check |

## Proposed `abundance-diagnosis` Flow

1. Preamble
   - Load knowledge library.
   - Load prior memos and pattern entries.
   - Detect whether this is pass one or pass two.
   - Confirm whether live browsing/source gathering is allowed.

2. Intake
   - Ask whether the user is bringing a public problem or a policy idea.
   - Capture jurisdiction, institutional setting, affected people, current status, and user role.

3. Instinct Audit
   - Ask what the user currently believes.
   - Ask why they believe it.
   - Ask what would change their mind.

4. Full-Stack Diagnosis
   - Institutional mechanics.
   - Political economy.
   - Cultural and ideological defaults.
   - Historical/procedural roots where relevant.

5. System Map
   - Actors.
   - Authority.
   - Upstream dependencies.
   - Downstream consequences.
   - Veto points.
   - Feedback paths.

6. Policy-As-Organism Test
   - Predict how the policy or intervention mutates when it enters the real environment.
   - Identify capture, delay, litigation, hollow compliance, and implementation drift risks.

7. Weighted Causal Model
   - Assign causal weight, tractability, time horizon, confidence, and feedback signal.
   - Distinguish high-weight hard causes from lower-weight tractable causes.

8. Evidence Ladder
   - Mark what is known from canonical lenses.
   - Mark what is known from live diagnostic evidence.
   - Mark what is uncertain.
   - Define what pass two must gather if this is only pass one.

9. Intervention Portfolio
   - Structural bet.
   - Near-term lever.
   - Learning experiment.
   - Feedback and drift watchlist.

10. Public Translation Table
    - Internal finding.
    - Public claim.
    - Evidence.
    - Audience.
    - Risk of overclaiming.
    - Safer wording.

11. Save Memo
    - Write the Abundance Systems Memo.
    - Save in the project/memos folder.
    - Log reusable mechanisms or cases into the knowledge library when appropriate.

12. Route Follow-On Work
    - `strategic-foresight-review`
    - `implementation-mechanics-review`
    - `public-translation-review`
    - `evidence-review`
    - `feedback-loop-check`
    - `pattern-library-entry`

## Parallel To GStack

The structural analogy is:

```text
office-hours
  -> design doc
  -> plan-ceo-review / plan-eng-review / plan-design-review
  -> ship / QA / review

abundance-diagnosis
  -> Abundance Systems Memo
  -> strategic-foresight-review / implementation-mechanics-review / public-translation-review
  -> publish-circulate-test / feedback-loop-check / evidence-review
```

## Current Recommendation

Use `abundance-diagnosis` as the front-door skill name.

Use `Abundance Systems Memo` as the artifact name.

Use `abundance-action-memo` only if the group wants the artifact and skill to sound more outward-facing. The risk is that "action" weakens the central norm that diagnosis must come first.

