# Module 04 — Manage Context of Your Agent

**Short-term session memory and long-term persistent memory for context-aware agents.**

AgentCore Memory gives agents the ability to remember: what happened in this conversation (short-term) and what they've learned across many sessions over time (long-term). Memory stores are shareable across agents and integrate with identity and Guardrails.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Store and retrieve conversation events within a session
- Persist and query long-term memories across sessions using semantic search
- Apply memory strategies: semantic, summarization, user preference, and episodic
- Share a memory store across multiple agents
- Secure memory with IAM scoping, Cognito federation, and KMS encryption
- Observe memory usage with CloudWatch metrics and alarms

## Exercises

| Exercise | Description |
|:---------|:------------|
| [Getting Started](../agentcore-features/04-manage-context-of-your-agent/memory/00-getting-started/) | Core concepts, surface decision guide (CLI vs boto3 vs SDK), quickstart |
| [Short-Term Memory](../agentcore-features/04-manage-context-of-your-agent/memory/01-short-term-memory/) | Session events, isolation, conversation branching, framework examples |
| [Long-Term Memory](../agentcore-features/04-manage-context-of-your-agent/memory/02-long-term-memory/) | Semantic, summarization, user-preference, and episodic memory strategies; namespaces, retrieval, batch CRUD |
| [Integrations](../agentcore-features/04-manage-context-of-your-agent/memory/03-integrations/) | Connect memory to Runtime, Identity, Guardrails, and the Browser Tool |
| [Observability](../agentcore-features/04-manage-context-of-your-agent/memory/04-observability/) | CloudWatch metrics, alarms, and ingestion log monitoring |
| [Security](../agentcore-features/04-manage-context-of-your-agent/memory/05-security/) | IAM policy scoping, Cognito identity federation, KMS encryption at rest |
| [Production Patterns](../agentcore-features/04-manage-context-of-your-agent/memory/06-production-patterns/) | Error handling, cost optimization, and a production deploy checklist |
| [Skip STM](../agentcore-features/04-manage-context-of-your-agent/memory/02-long-term-memory/07-skip-STM/) | Write long-term memory without short-term events using IngestData and batch record CRUD |

## Key Concepts

- **Short-term** — conversation events scoped to a session; lost when the session ends
- **Long-term** — persists across sessions; supports semantic search over past interactions
- **Multi-agent sharing** — multiple agents can read from and write to the same memory store
