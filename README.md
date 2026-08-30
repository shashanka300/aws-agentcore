# Amazon Bedrock AgentCore Workshop

Hands-on workshop for **Amazon Bedrock AgentCore** — build, deploy, and operate AI agents securely at scale using any framework and foundation model.

## Prerequisites

- Python 3.12+
- [uv](https://docs.astral.sh/uv/getting-started/installation/) package manager
- AWS account with Amazon Bedrock AgentCore access
- AWS CLI configured with credentials (`aws configure`)

## Quick Start

```bash
# Clone the repo
git clone https://github.com/shashanka300/aws-agentcore.git
cd aws-agentcore

# Verify AWS credentials
aws sts get-caller-identity

# Run your first example
cd agentcore-features/01-harness/00-getting-started
uv run --with-requirements ../requirements.txt python getting_started.py
```

## Workshop Modules

| # | Module | Description | Difficulty |
|:--|:-------|:------------|:-----------|
| 01 | [Harness](workshop-pages/01-harness.md) | Serverless agent orchestration — run a model with tools in a single API call | Beginner |
| 02 | [Host Your Agent](workshop-pages/02-host-your-agent.md) | Deploy agents (Strands, LangGraph, CrewAI) to AgentCore Runtime | Intermediate |
| 03 | [Connect to Anything](workshop-pages/03-connect-your-agent-to-anything.md) | Code Interpreter sandbox and headless Browser tool | Beginner |
| 04 | [Manage Context](workshop-pages/04-manage-context-of-your-agent.md) | Short-term and long-term memory across sessions | Beginner |
| 05 | [Authenticate & Authorize](workshop-pages/05-authenticate-and-authorize.md) | Inbound JWT auth (Cognito, Okta, Entra ID) and outbound credentials | Advanced |
| 06 | [Observe, Evaluate & Optimize](workshop-pages/06-observe-evaluate-optimize-your-agent.md) | OpenTelemetry traces, LLM-as-a-judge evals, A/B prompt testing | Intermediate |
| 07 | [Centralize & Govern](workshop-pages/07-centralize-and-govern-your-ai-infrastructure.md) | Gateway, Cedar policy engine, and agent/tool registry | Intermediate |
| 08 | [Agents That Transact](workshop-pages/08-agents-that-transact.md) | x402 microtransaction payments (USDC on Base Sepolia / Solana Devnet) | Advanced |

**Recommended path:** Start with Module 01 (Harness), then 03 (Code Interpreter), then 04 (Memory). These have the fewest infrastructure dependencies.

## Running Examples

Every exercise lives under `agentcore-features/` and has its own `requirements.txt`. The standard pattern:

```bash
cd agentcore-features/<module>/<exercise>
uv run --with-requirements requirements.txt python <script>.py
```

If no `requirements.txt` exists in the exercise folder, check the parent:

```bash
uv run --with-requirements ../requirements.txt python <script>.py
```

## Key Concept: Two API Planes

AgentCore splits its API into a control plane and a data plane:

```python
import boto3

# Control plane — create/manage resources (harnesses, memory stores, gateways)
control = boto3.client('bedrock-agentcore-control', region_name='us-west-2')

# Data plane — invoke agents, run code, read/write memory
data = boto3.client('bedrock-agentcore', region_name='us-west-2')
```

## Project Structure

```
agentcore-features/           # Runnable code examples (one folder per module)
  01-harness/
    00-getting-started/       # Start here
    01-advanced-examples/     # Custom containers, gateway, MCP, skills, etc.
    02-use-cases/             # Travel agent, visual testing, weather agent
  02-host-your-agent/
  03-connect-your-agent-to-anything/
  04-manage-context-of-your-agent/
  05-authenticate-and-authorize/
  06-observe-evaluate-optimize-your-agent/
  07-centralize-and-govern-your-ai-infrastructure/
  08-agents-that-transact/

workshop-pages/               # Narrative guides for each module (*.md)
```

## Infrastructure Requirements

Not all examples will run without additional AWS infrastructure:

| Module | Works out of the box | Requires setup |
|:-------|:--------------------|:---------------|
| 01 Harness | Yes (needs AWS creds + Bedrock access) | |
| 03 Code Interpreter / Browser | Yes (just boto3) | AgentCore service access |
| 04 Memory | Yes (just boto3) | Memory store must be created first |
| 02 Host Your Agent | Partial | S3 bucket, ECR repo for deployment |
| 05 Auth | No | External IdP (Cognito, Okta, Entra ID) |
| 06 Observe/Evaluate | Partial | CloudWatch or OTLP endpoint |
| 07 Gateway/Policy/Registry | Partial | VPC for some integrations |
| 08 Payments | No | Wallet provider (Coinbase CDP or Stripe/Privy) |

## Documentation

- [What is Amazon Bedrock AgentCore?](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/what-is-bedrock-agentcore.html)
- [boto3 Control Plane Reference](https://docs.aws.amazon.com/boto3/latest/reference/services/bedrock-agentcore-control.html)
- [boto3 Data Plane Reference](https://docs.aws.amazon.com/boto3/latest/reference/services/bedrock-agentcore.html)
- [AgentCore Python SDK (GitHub)](https://github.com/aws/bedrock-agentcore-sdk-python)

## License

This workshop is provided for educational purposes.
