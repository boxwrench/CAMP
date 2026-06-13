# Deep Research Handoff

Use this when ordinary browsing or quick search is not enough to support the memo's causal weights, evidence ladder, or public claims.

## When To Suggest It

Suggest a deep-research handoff when:

- The diagnosis depends on legal, budgetary, procurement, administrative, or historical details.
- The case has multiple institutions, agencies, statutes, funding streams, or veto points.
- The live source trail is likely buried in meeting minutes, PDFs, audits, bills, contracts, litigation, or local reporting.
- The memo has high-impact uncertainty that could change the intervention portfolio.
- The user is about to circulate public claims that need stronger evidence discipline.

Do not suggest it for every memo. Use it when deeper evidence would materially improve the diagnosis.

## Workflow

1. Identify the highest-value evidence gaps.
2. Tell the user what deep research would clarify and why it matters.
3. Generate a standalone prompt the user can run in a deep-research tool.
4. Ask the user to bring the result back.
5. When the result returns, treat it as pass-two material and revise the memo.

## Prompt Requirements

The prompt should ask for:

- A concise executive summary.
- A source-backed timeline.
- Key institutions, actors, authorities, and veto points.
- Statutes, rules, budgets, procurement documents, meeting minutes, litigation, audits, and agency docs where relevant.
- Competing explanations and evidence for each.
- Causal weights with confidence and caveats.
- What evidence is still missing.
- Links and citations for every factual claim.
- A section explicitly titled "Implications for an Abundance Systems Memo."

## Prompt Template

```text
I am preparing an Abundance Systems Memo on:

{problem_or_policy}

Context:

- Jurisdiction:
- Institutions/agencies involved:
- Current policy/status quo:
- My initial hypothesis:
- What action or decision this research will inform:

Please conduct deep research that helps diagnose the system before recommending advocacy or action.

Focus on:

1. The visible failure: what is broken, delayed, scarce, expensive, or procedurally blocked.
2. Institutional mechanics: agencies, authority, process steps, procurement, budgets, staffing, legal constraints, veto points, and implementation responsibilities.
3. Political economy: interest groups, concentrated benefits, diffuse costs, incumbents, fiscal incentives, and who benefits from delay or complexity.
4. Cultural and ideological defaults: risk aversion, scarcity assumptions, proceduralism, blame avoidance, distrust of building, and public narratives.
5. Historical roots: how the current process or constraint developed, including reforms that solved one problem while creating another.
6. Upstream and downstream systems: dependencies, consequences, and actors affected before and after the immediate policy point.
7. Evidence: statutes, bills, budgets, procurement records, meeting minutes, agency documents, audits, litigation, local reporting, academic or policy research, and relevant case studies.
8. Competing explanations: list the strongest plausible causes, estimate causal weight, confidence, and what evidence supports or weakens each.
9. Policy-as-organism test: predict how the proposed policy or intervention would mutate when it enters the real institutional environment.
10. Feedback signals: what observable signals would show real progress, drift, capture, hollow compliance, or failure.

Output format:

- Executive summary
- Source-backed timeline
- Actor and authority map
- Evidence table with links
- Weighted causal model
- Evidence gaps and uncertainty
- Failure modes and implementation risks
- Implications for an Abundance Systems Memo

Do not start with advocacy recommendations. Diagnose first. Mark uncertainty clearly. Cite sources with links.
```

