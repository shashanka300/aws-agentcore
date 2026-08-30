# Module 05 — Authenticate & Authorize

**Protect agents with inbound JWT authentication and manage outbound credentials for external services.**

AgentCore Identity handles both directions of authentication: validating who is calling your agent (inbound) and managing credentials your agent uses to call external services (outbound). It integrates with existing identity providers — no new IdP required.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Protect an AgentCore Runtime endpoint with JWT validation (Cognito, Entra ID, Okta, PingFederate)
- Store and automatically inject API keys and OAuth tokens for outbound service calls
- Implement 3-legged OAuth (user-delegated) flows from within an agent
- Combine machine-to-machine (M2M) and 3LO flows in a single agent
- Implement On-Behalf-Of (OBO) token exchange across agent-to-MCP-server boundaries
- Enforce role-based access with multi-agent OBO patterns

---

## Inbound Auth Exercises

| Exercise | Description |
|:---------|:------------|
| [Cognito JWT](../agentcore-features/05-authenticate-and-authorize/01-inbound-auth/01-inbound-auth-cognito/) | Validate AWS Cognito JWTs at the AgentCore Runtime endpoint |
| [Microsoft Entra ID](../agentcore-features/05-authenticate-and-authorize/01-inbound-auth/02-inbound-auth-EntraID/) | Entra ID JWT validation; includes OneNote access via MCP |
| [Okta](../agentcore-features/05-authenticate-and-authorize/01-inbound-auth/03-inbound-auth-okta/) | Okta JWT validation with scope enforcement |
| [PingFederate](../agentcore-features/05-authenticate-and-authorize/01-inbound-auth/04-inbound-auth-pingfederate/) | Self-hosted PingFederate setup (CDK deployment included) |

## Outbound Auth Exercises

| Exercise | Description |
|:---------|:------------|
| [OpenAI API Key](../agentcore-features/05-authenticate-and-authorize/02-outbound-auth/01-outbound-auth-openai/) | Store and inject an OpenAI API key for agent use |
| [Google Calendar 3LO](../agentcore-features/05-authenticate-and-authorize/02-outbound-auth/02-outbound-auth-3lo/) | 3-legged OAuth for user-delegated Google Calendar access |
| [GitHub 3LO](../agentcore-features/05-authenticate-and-authorize/02-outbound-auth/03-outbound-auth-github/) | GitHub API access via 3-legged OAuth |
| [Generic OAuth2 M2M](../agentcore-features/05-authenticate-and-authorize/02-outbound-auth/04-outbound-auth-self-hosted/) | Machine-to-machine OAuth2 client credentials flow |

## Advanced Multi-Flow Exercises

| Exercise | Description |
|:---------|:------------|
| [M2M + 3LO Combined](../agentcore-features/05-authenticate-and-authorize/03-m2m-3lo/) | Cognito inbound + GitHub and Google outbound in one agent |
| [Entra ID OBO](../agentcore-features/05-authenticate-and-authorize/04-entra-obo-mcp-runtime/) | On-Behalf-Of token exchange between Agent and MCP Server via Entra ID |
| [Auth0 Multi-Agent OBO](../agentcore-features/05-authenticate-and-authorize/auth0-multi-agent-obo/) | Multi-agent RFC 8693 OBO flows via Auth0 |
| [Okta Three-Tier RBAC](../agentcore-features/05-authenticate-and-authorize/okta-auth-three-tier-end-to-end-demo/) | End-to-end Okta three-tier demo with role-based access control |
| [Certificate-Based Auth (Private Key JWT)](../agentcore-features/05-authenticate-and-authorize/05-certificate-based-auth/) | Outbound auth with PRIVATE_KEY_JWT client authentication via KMS (Okta and Entra ID) |
| [Okta Cross App Access (XAA)](../agentcore-features/05-authenticate-and-authorize/06-okta-xaa/) | Agent calls APIs on behalf of a user via Okta XAA ID-JAG token exchange |
| [OBO: Agent to Downstream](../agentcore-features/05-authenticate-and-authorize/obo-training/3-examples/01-agent-to-downstream/) | OBO exchange from an agent on Runtime to a downstream API (Entra ID and Okta) |
| [OBO: Agent via Gateway](../agentcore-features/05-authenticate-and-authorize/obo-training/3-examples/02-agent-via-gateway/) | Two-hop OBO: agent on Runtime calls downstream API through AgentCore Gateway |

## Key Concepts

- **Inbound auth** — who is allowed to call your agent; validated at the runtime endpoint
- **Outbound auth** — credentials your agent uses when calling external services; stored and injected by AgentCore
- **3LO** — user-delegated OAuth; the agent acts on behalf of the end user
- **OBO** — On-Behalf-Of; propagates the user's identity across agent-to-agent or agent-to-tool calls
