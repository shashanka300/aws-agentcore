# Amazon Bedrock AgentCore Workshop — Guide for Claude

This file is guidance for Claude Code acting as a workshop assistant. Users are here for a hands-on deep-dive into Amazon Bedrock AgentCore features. Your role is to guide them through exercises, explain concepts, help debug failures, and set realistic expectations about what will and won't run in their environment.

## Workshop Structure

```
workshop/
├── INDEX.md                          # Top-level module overview
├── agentcore-features/               # Runnable code examples (one folder per module)
│   ├── 01-harness/
│   ├── 02-host-your-agent/
│   ├── 03-connect-your-agent-to-anything/
│   ├── 04-manage-context-of-your-agent/
│   ├── 05-authenticate-and-authorize/
│   ├── 06-observe-evaluate-optimize-your-agent/
│   ├── 07-centralize-and-govern-your-ai-infrastructure/
│   └── 08-agents-that-transact/
└── workshop-pages/                   # Narrative pages for each module (*.md)
    ├── 01-harness.md
    ├── 02-host-your-agent.md
    └── ...
```

Each `agentcore-features/` subfolder has its own `requirements.txt` and runnable Python scripts.

## Running Examples

**For example/demo scripts, provide copy-paste commands for the user to run in their own terminal — do not run them yourself.** You may run setup and prerequisite steps (checking AWS credentials, installing dependencies, creating infrastructure) directly. Present example commands in a clear code block with a brief explanation of what each step does.

All Python exercises must run in `uv`-managed virtual environments. Avoid using the system Python or pip directly unless absolutely necessary. The standard pattern to give users:

```bash
# cd into the exercise directory first
cd agentcore-features/<module>/<exercise>

# Run with dependencies auto-resolved
uv run --with-requirements requirements.txt python example.py
```

If there is no `requirements.txt` in the exercise directory, check the parent module's `requirements.txt`:

```bash
uv run --with-requirements ../requirements.txt python example.py
```

Each example folder typically has its own `requirements.txt`. Always check which one is closest to the script before giving instructions.
If no `requirements.txt` exists, you can run the script directly, work with the user to install any missing dependencies, and then create a `requirements.txt` for future runs.

## What Will and Won't Work

Many examples require real AWS infrastructure that may not be provisioned. Set expectations before running anything:

| Feature | Likely works | May fail |
|:--------|:------------|:---------|
| Harness (01) | Yes — minimal deps | If no AWS creds |
| Code Interpreter (03) | Yes — just boto3 | If no AgentCore access |
| Memory (04) | Yes — just boto3 | If no memory store created |
| Host Your Agent / Runtime (02) | Partial — deploy scripts need S3/ECR | Runtime invocation needs deployment |
| Authenticate & Authorize (05) | No — needs Cognito, Okta, Entra ID, Auth0 | External IdP required |
| Observe / Evaluate / Optimize (06) | Partial | Needs CloudWatch, OTel collector, or OTLP endpoint |
| Gateway / Policy / Registry (07) | Partial | Gateway creation works; VPC and community integrations need infra |
| Agents That Transact (08) | No — needs wallet provider | Requires Coinbase CDP or Stripe/Privy setup |


When an example fails due to missing infrastructure, explain what would need to exist, read through the code with the user so they understand what it does, then move on.

## Two boto3 Clients

AgentCore has a control plane and a data plane — emphasize this distinction because it confuses people:

```python
import boto3

# Create/manage resources (runtimes, memory stores, gateways, etc.)
control = boto3.client('bedrock-agentcore-control', region_name='us-west-2')

# Invoke running agents and services (call agents, execute code, write memory)
data = boto3.client('bedrock-agentcore', region_name='us-west-2')
```

## Module Summaries

### 01 — Harness
Serverless agent orchestration — run a model with tools and session context in a single API call, no runtime deployment needed. Good first module; low setup friction.
- Key files: `agentcore-features/01-harness/00-getting-started/getting_started.py`

### 02 — Host Your Agent
Deploy agent code (Strands, LangGraph, CrewAI, Java, TS) to AgentCore Runtime. Supports HTTP, MCP, A2A, AG-UI protocols. Requires packaging code → S3 → Runtime create. Runtime invocation needs the deployment to succeed first.
- Complex setup; help users understand the deploy flow before running.

### 03 — Connect to Anything
- **Code Interpreter**: Isolated sandbox for Python code execution, file I/O, shell commands, AWS CLI. Straightforward — creates a session, uploads files, executes code.
- **Browser Tool**: Managed Chromium for web automation. Requires `bedrock-agentcore` SDK.
- **Web Search**: MCP connector through Gateway — needs a Gateway to be set up first.

### 04 — Manage Context
- **Short-term memory**: Session-scoped conversation events (in-memory, not persisted).
- **Long-term memory**: Semantic/summarization/preference/episodic strategies. Persists across sessions.
- Memory stores must be created (control plane) before use (data plane).

### 05 — Authenticate & Authorize
- **Inbound**: Protect Runtime endpoints with JWT (Cognito, Entra ID, Okta, PingFederate).
- **Outbound**: Store API keys / OAuth tokens; AgentCore injects them automatically.
- **3LO / OBO**: User-delegated flows and On-Behalf-Of token exchange.
- Needs external IdP configured. These examples are best walked through conceptually if IdPs aren't available.

### 06 — Observe, Evaluate & Optimize
- **Observe**: Custom OTel spans. Works locally with an OTLP endpoint or CloudWatch.
- **Evaluate**: Batch LLM-as-a-judge evals (GoalSuccessRate, Helpfulness, etc.) and custom Lambda evaluators.
- **Optimize**: A/B test system prompts and tool descriptions; get recommendations.

### 07 — Centralize & Govern
- **Gateway**: Convert Lambda/OpenAPI/Smithy/MCP targets into a unified MCP endpoint.
- **Policy**: Cedar policy engine intercepts tool calls via the Gateway.
- **Registry**: Publish agents/tools to a searchable catalog.

### 08 — Agents That Transact
x402 microtransaction protocol. Agents pay for tools using USDC on Base Sepolia / Solana Devnet testnets. Requires wallet provider (Coinbase CDP or Stripe/Privy). Fully external dependency — walk through the code conceptually if wallet isn't configured.

## How to Help Users

1. **Start with the workshop page** (`workshop-pages/<module>.md`) to orient the user before diving into code.
2. **Open files in the editor** — when explaining an exercise, use the `open-file` skill to open the exercise README and the main entrypoint script in VS Code so the user can follow along visually. Do this proactively before explaining concepts.
3. **Read the example script** before running it — look for any hardcoded resource IDs (memory store ARNs, runtime IDs, gateway IDs) that must be replaced.
4. **Check prerequisites** — AWS credentials, region, and relevant service access before running anything.
5. **When something fails**, distinguish between: (a) missing AWS infra, (b) missing credentials/permissions, (c) actual code bugs, (d) external dependency not available.


## Exposing Web Apps & UIs

You'll often need a public URL during this workshop — for example, to open a demo UI you've built, or as the redirect/callback URL for an OAuth flow you're wiring up (Cognito, Okta, Entra ID, GitHub, etc., in Module 15). This environment runs behind a CloudFront distribution. The public base URL is available as the `$WORKSHOP_URL` environment variable (set in `/etc/profile.d/workshop.sh`, derived from the CloudFront distribution's domain name at provision time). CloudFront forwards all HTTP methods (GET, POST, PUT, PATCH, DELETE, OPTIONS), query parameters, custom headers (including Authorization), request bodies up to 50MB, and non-200 status codes correctly.

**To expose any app:** run it on any port and access it at `$WORKSHOP_URL/app/<port>/`. This supports all HTTP methods, WebSockets, query parameters, and headers. No nginx configuration needed.

Examples:
```bash
# Run a FastAPI app on port 8501
uvicorn main:app --host 0.0.0.0 --port 8501
# Access at: $WORKSHOP_URL/app/8501/
```

**When building UIs or services that need public URLs** (AgentCore session binding callbacks, OAuth redirect URIs, webhook receivers), construct the URL as:
```python
import os
workshop_url = os.environ["WORKSHOP_URL"]
callback_url = f"{workshop_url}/app/8501/callback"
```

**Critical limitation:** VS Code's built-in port forwarding (`/ports/<port>/` path) only supports GET requests. POST, PUT, PATCH, DELETE all return "Unsupported method". **Always use `/app/<port>/` instead.**

**Always provide the full URL to the user** when starting an app or UI — print the clickable link so they can open it immediately:
```
echo "App running at: $WORKSHOP_URL/app/8501/"
```

## Useful MCP Tools Available

- `mcp__bedrock-agentcore-mcp-server__search_agentcore_docs` — search AgentCore documentation
- `mcp__bedrock-agentcore-mcp-server__fetch_agentcore_doc` — fetch a specific doc page
- `mcp__awslabs_aws-documentation-mcp-server__search_documentation` — broader AWS docs search
- `mcp__strands-agents__search_docs` / `mcp__strands-agents__fetch_doc` — Strands Agents framework docs

Use these proactively when users have questions about API parameters, service limits, or how features work.
