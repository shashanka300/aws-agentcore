# Module 06 — Observe, Evaluate & Optimize

**Trace agents with OpenTelemetry, evaluate quality automatically, and optimize prompts and tool descriptions.**

AgentCore provides a full agent lifecycle management loop: observe what your agent is doing, measure whether it's doing it well, and get data-driven recommendations to make it better.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Add custom OpenTelemetry spans to trace agent sessions and tool calls
- Protect sensitive data in traces using Bedrock Guardrails and CloudWatch Data Protection
- Run batch evaluations against ground-truth datasets
- Use built-in LLM-as-a-judge evaluators (GoalSuccessRate, Helpfulness, Correctness, ToolSelectionAccuracy, Faithfulness)
- Write custom Lambda-based evaluators for domain-specific quality checks
- Run A/B tests on system prompts and tool descriptions with automatic recommendations

---

## Observe Exercises

| Exercise | Description |
|:---------|:------------|
| [Custom Spans](../agentcore-features/06-observe-evaluate-optimize-your-agent/01-observe/custom_span_creation.py) | Create OTel custom spans for sessions, tool calls, and agent steps |
| [Data Protection](../agentcore-features/06-observe-evaluate-optimize-your-agent/01-observe/data_protection.py) | Redact PII in traces using Bedrock Guardrails + CloudWatch Data Protection |
| [Attribute Redaction](../agentcore-features/06-observe-evaluate-optimize-your-agent/01-observe/attribute_redaction.py) | Selectively redact span attributes before export |
| [Baggage & Filters](../agentcore-features/06-observe-evaluate-optimize-your-agent/01-observe/) | Propagate baggage context and apply span filters |

## Evaluate Exercises

| Exercise | Description |
|:---------|:------------|
| [Ground-Truth Evaluation](../agentcore-features/06-observe-evaluate-optimize-your-agent/02-evaluate/ground-truth-based-evaluation/) | Simulate a dataset and run batch evaluation against expected outputs |
| [LLM-as-a-Judge](../agentcore-features/06-observe-evaluate-optimize-your-agent/02-evaluate/llm-as-a-judge-evaluation/) | Use built-in evaluators: GoalSuccessRate, Helpfulness, Correctness, ToolSelectionAccuracy, Faithfulness |
| [Custom Evaluators](../agentcore-features/06-observe-evaluate-optimize-your-agent/02-evaluate/custom-code-based-evaluation/) | Build Lambda-based evaluators for custom scoring logic |

## Optimize Exercises

| Exercise | Description |
|:---------|:------------|
| [Optimization](../agentcore-features/06-observe-evaluate-optimize-your-agent/03-optimize/) | Create configuration bundles, run A/B tests (50/50 or canary 10%), and apply system prompt + tool description recommendations |

## Key Concepts

- **Observability** — OpenTelemetry traces integrated with CloudWatch
- **Evaluation** — on-demand batch evaluation and online (production-sampling) evaluation
- **Optimization** — AI-generated recommendations for system prompts and tool descriptions, validated via A/B routing
