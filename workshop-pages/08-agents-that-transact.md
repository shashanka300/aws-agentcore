# Module 08 — Agents That Transact

**Microtransaction payments for agents via the x402 protocol — wallets, spending limits, and multi-agent budgets.**

AgentCore Payments enables agents to pay for tools, data, and services autonomously. Agents get a wallet, operators set spending limits, and every payment is observable end-to-end.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Set up the payment infrastructure stack and configure a wallet provider (Coinbase CDP or Stripe/Privy)
- Build Strands and LangGraph agents that make automatic payments when invoking paid tools
- Deploy payment-capable agents to AgentCore Runtime
- Fund a wallet, delegate spend authority, and check balances
- Discover paid tools via the AgentCore Gateway (Coinbase Bazaar)
- Use the Browser Tool to pay for paywalled web content
- Optimize costs with memory — skip redundant paid calls by recalling recent results
- Orchestrate multiple agents with independent per-agent spending budgets

---

## Getting Started — Tutorial Progression

Work through these in order for a complete end-to-end payments experience.

| Step | Exercise | Description |
|:-----|:---------|:------------|
| 0 | [Payment Stack Setup](../agentcore-features/08-agents-that-transact/00-getting-started/00-setup-agentcore-payments/) | Deploy IAM roles and configure your wallet provider (Coinbase CDP or Stripe/Privy) |
| 1 | [Agents with Payments & Limits](../agentcore-features/08-agents-that-transact/00-getting-started/01-agents-payments-and-limits/) | Build Strands and LangGraph agents that pay for tools with configurable spending limits |
| 2 | [Deploy to Runtime](../agentcore-features/08-agents-that-transact/00-getting-started/02-deploy-to-agentcore-runtime/) | Package and deploy payment agents to AgentCore Runtime |
| 3 | [Wallet Funding & Onboarding](../agentcore-features/08-agents-that-transact/00-getting-started/03-user-onboarding-wallet-funding/) | Fund a wallet, delegate spend authority, and manage wallet lifecycle |
| 4 | [Discover Paid Tools via Gateway](../agentcore-features/08-agents-that-transact/00-getting-started/04-agent-with-coinbase-bazaar-via-gateway/) | Use the AgentCore Gateway to discover and invoke paid tools from Coinbase Bazaar |
| 5 | [Pay for Web Content](../agentcore-features/08-agents-that-transact/00-getting-started/05-agent-with-browser-tool-pay-for-content/) | Combine the Browser Tool with payments to access paywalled web content |
| 6 | [Memory-Aware Payment Optimization](../agentcore-features/08-agents-that-transact/00-getting-started/06-research-agent-with-payment-memory/) | Use Memory to personalise your response. |
| 7 | [Multi-Agent Payment Orchestration](../agentcore-features/08-agents-that-transact/00-getting-started/07-multi-agent-payment-orchestrator/) | Orchestrate multiple agents with independent budgets and per-agent spending limits |
| 8 | [MPP (Machine Payments Protocol)](../agentcore-features/08-agents-that-transact/00-getting-started/08-mpp-machine-payments-protocol/) | Pay MPP endpoints on Tempo using the Challenge-Credential-Receipt flow with per-run spending sessions |
| 9 | [Pay Per Use with upto](../agentcore-features/08-agents-that-transact/00-getting-started/09-pay-per-use-with-upto/) | Metered x402 payments where the seller settles the actual amount consumed under a buyer-authorized ceiling |

## Payments Skills and CLI

| Exercise | Description |
|:---------|:------------|
| [Payments via aws-agents Plugin](../agentcore-features/08-agents-that-transact/01-payments-skills-and-cli/) | Add x402 payment capability to any agent using the aws-agents plugin and AgentCore CLI |

## Production Use Cases

| Use Case | Description |
|:---------|:------------|
| [Pay for API Access](../agentcore-features/08-agents-that-transact/02-use-cases/pay-for-api-agent/) | Agent that pays per-call for premium API access |
| [Pay for Paywalled Content](../agentcore-features/08-agents-that-transact/02-use-cases/pay-for-content-browser-use/) | Browser-based agent that pays to unlock web content |
| [Pay for Data](../agentcore-features/08-agents-that-transact/02-use-cases/pay-for-data/) | Agent that purchases data on demand and monetizes its own outputs |

## Key Concepts

- **x402 protocol** — open standard for HTTP-native micropayments
- **Testnet** — all exercises use Base Sepolia and Solana Devnet (no real funds required)
- **Spending limits** — operators cap per-transaction and cumulative agent spend
- **Observability** — every payment is traced end-to-end alongside agent tool calls
