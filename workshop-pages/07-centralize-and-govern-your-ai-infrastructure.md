# Module 07 — Centralize & Govern Your AI Infrastructure

**Gateway (MCP proxy), Cedar policy engine, and centralized agent/tool registry.**

AgentCore provides a governance layer that sits between agents and the tools and services they use. The Gateway converts existing APIs into MCP tools, the Policy engine intercepts every tool call with deterministic rules, and the Registry gives teams a shared catalog of approved agents and tools.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Convert Lambda functions, OpenAPI specs, and existing services into MCP-compatible tools via the Gateway
- Add JWT authentication at the Gateway level to protect tool access
- Connect the Gateway to private services via VPC
- Integrate community tools (Salesforce, Zoom, Jira, Slack)
- Write Cedar policies to control which agents can call which tools — and under what conditions
- Publish agents and tools to a centralized registry with semantic search and approval workflows

---

## Gateway Exercises

| Exercise | Description |
|:---------|:------------|
| [Setup](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/01-gateway/00-optional-setup/) | Initial Gateway configuration and prerequisites |
| [Attach Targets](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/01-gateway/01-attach-targets/) | Add Lambda functions, MCP servers, OpenAPI specs, and Smithy models as Gateway targets |
| [Inbound Authorization](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/01-gateway/02-set-up-inbound-authorization/) | Enforce JWT validation for clients calling Gateway endpoints |
| [Private Connectivity](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/01-gateway/03-private-connectivity/) | Connect the Gateway to VPC-hosted or private network services |
| [Advanced Concepts](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/01-gateway/04-advanced-concepts/) | Complex Gateway routing and configuration patterns |
| [Community Integrations](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/01-gateway/05-community/) | Pre-built integrations: Salesforce, Zoom, Jira, Slack |

## Policy Engine Exercises

| Exercise | Description |
|:---------|:------------|
| [Tool Access with Policy](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/02-policy/01-tool-access-with-policy/) | Enforce Cedar policies on agent-to-tool interactions through an AgentCore MCP gateway with NL2Cedar and ABAC |
| [Guardrails in Policy](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/02-policy/02-guardrails-in-policy/) | Attach Bedrock Guardrails content-safety classifiers directly to an AgentCore gateway as policy rules |
| [Temporal Policies](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/02-policy/03-temporal-policies/) | Stateful authorization rules that evaluate the history of an agent's actions within a session |

## Registry Exercises

| Exercise | Description |
|:---------|:------------|
| [Registry End-to-End](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/03-registry/01-registry-end-to-end/) | Register an agent, search the catalog, and invoke a discovered tool |
| [Registry with OAuth](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/03-registry/02-registry-end-to-end-oauth/) | Add OAuth2 authentication to registry-published tools |
| [Advanced Patterns](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/03-registry/03-advanced/) | Advanced publishing, approval workflows, and namespacing |
| [Migrate to New Namespace](../agentcore-features/07-centralize-and-govern-your-ai-infrastructure/03-registry/04-migrate-to-new-namespace/) | Migrate registry data from the public preview namespace to the new agent-registry namespace |

## Key Concepts

- **Gateway** — converts any API or Lambda into an MCP tool; no agent code changes required
- **Policy** — deterministic, Cedar-based rules evaluated on every tool call before execution
- **Registry** — governed catalog with semantic search; teams discover and consume approved agents and tools
