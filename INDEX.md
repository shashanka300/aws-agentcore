# Amazon Bedrock AgentCore Workshop

Welcome to the hands-on workshop for **Amazon Bedrock AgentCore** — an agentic platform for building, deploying, and operating AI agents securely at scale using any framework and foundation model.

## What You'll Learn

By the end of this workshop you will know how to:

- Run agents serverlessly with the **Harness** — no infrastructure to manage
- **Deploy** agents and MCP tool servers on AgentCore Runtime
- Give agents superpowers with the built-in **Code Interpreter** and **Browser** tools
- Add **Memory** so agents remember context across sessions
- Secure agents with **inbound and outbound authentication**
- **Observe, evaluate, and optimize** agents in production
- **Govern** AI infrastructure with a gateway, policy engine, and registry
- Enable agents to make **microtransaction payments** via the x402 protocol

## Prerequisites

- Python 3.12+
- [`uv`](https://docs.astral.sh/uv/getting-started/installation/) installed
- AWS account with Amazon Bedrock AgentCore access
- AWS CLI configured with credentials
- `boto3` installed (`pip install boto3`)

## Workshop Modules

| # | Module | Description |
|:--|:-------|:------------|
| 01 | [Harness](workshop-pages/01-harness.md) | Run and validate AgentCore feature examples using the workshop test harness. |
| 02 | [Host Your Agent](workshop-pages/02-host-your-agent.md) | Deploy agents and MCP tool servers on AgentCore Runtime with multi-protocol support |
| 03 | [Connect to Anything](workshop-pages/03-connect-your-agent-to-anything.md) | Give agents a sandboxed Python environment (Code Interpreter) and a headless browser |
| 04 | [Manage Context](workshop-pages/04-manage-context-of-your-agent.md) | Short-term session memory and long-term persistent memory across sessions |
| 05 | [Authenticate & Authorize](workshop-pages/05-authenticate-and-authorize.md) | Protect agents with inbound JWT auth and manage outbound credentials for external services |
| 06 | [Observe, Evaluate & Optimize](workshop-pages/06-observe-evaluate-optimize-your-agent.md) | Trace with OpenTelemetry, evaluate with LLM-as-a-judge, and optimize prompts |
| 07 | [Centralize & Govern](workshop-pages/07-centralize-and-govern-your-ai-infrastructure.md) | Gateway (MCP proxy), Cedar policy engine, and centralized agent/tool registry |
| 08 | [Agents That Transact](workshop-pages/08-agents-that-transact.md) | Microtransaction payments via the x402 protocol — wallets, spending limits, multi-agent budgets |

## Documentation

- [What is Amazon Bedrock AgentCore?](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/what-is-bedrock-agentcore.html)
- [boto3 Control Plane Reference](https://docs.aws.amazon.com/boto3/latest/reference/services/bedrock-agentcore-control.html)
- [boto3 Data Plane Reference](https://docs.aws.amazon.com/boto3/latest/reference/services/bedrock-agentcore.html)
- [AgentCore Python SDK (GitHub)](https://github.com/aws/bedrock-agentcore-sdk-python)
