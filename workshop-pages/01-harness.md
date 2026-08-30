# Module 01 — Harness

**Run and validate AgentCore feature examples using the workshop test harness.**

The workshop harness provides a structured way to execute and verify AgentCore code examples. It manages Python environments, captures output, and confirms that each example behaves as expected — giving you a reliable foundation before moving on to more advanced modules.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Understand how the workshop test harness validates code examples
- Run individual examples and interpret their results
- Use the harness to confirm correct environment setup
- Explore advanced harness patterns for testing new AgentCore features

## Exercises

### Getting Started

| Exercise | Description |
|:---------|:------------|
| [Getting Started](../agentcore-features/01-harness/00-getting-started/) | Walk through the complete harness workflow: create an IAM role, create a harness agent, invoke it with two Claude models in the same session, and run shell commands on the agent's isolated microVM |

### Advanced Examples

| Exercise | Description |
|:---------|:------------|
| [Custom Containers](../agentcore-features/01-harness/01-advanced-examples/01-custom-containers/) | Attach a custom container image to a harness so the agent runs in your own environment — Node.js, Go, and Python presets plus cross-compilation |
| [Gateway Integration](../agentcore-features/01-harness/01-advanced-examples/02-gateway-integration/) | Full AgentCore gateway lifecycle: create a gateway with MCP protocol, add an MCP target, wire it to a harness, and invoke the agent so it calls tools via the gateway |
| [Execution Limits](../agentcore-features/01-harness/01-advanced-examples/03-execution-limits/) | Control how much work a harness agent can do per invocation using three limit parameters, with before/after comparisons |
| [MCP Integration](../agentcore-features/01-harness/01-advanced-examples/04-mcp-integration/) | Connect harness agents to external MCP servers for web search, APIs, and custom tools — single tool, multiple tools, authenticated servers, and error handling |
| [Agent Skills](../agentcore-features/01-harness/01-advanced-examples/05-agent-skills/) | Extend agent capabilities with pre-built skill bundles providing specialized instructions, code templates, and domain knowledge |
| [Async Step Functions](../agentcore-features/01-harness/01-advanced-examples/06-async-step-function/) | Build serverless, event-driven AI workflows using AWS Step Functions to orchestrate AgentCore harness invocations |
| [OAuth + JWT Auth](../agentcore-features/01-harness/01-advanced-examples/07-oauth/) | Production auth chain: inbound JWT validation (Cognito) and outbound M2M token injection for gateway tool calls |
| [Gemini Model Provider](../agentcore-features/01-harness/01-advanced-examples/08-gemini-model-provider/) | Run a harness on a Google Gemini model using the AgentCore CLI |
| [OpenAI Model Provider](../agentcore-features/01-harness/01-advanced-examples/09-openai-model-provider/) | Run a harness on an OpenAI-compatible model hosted in Amazon Bedrock (GPT-OSS) using the AgentCore CLI |
| [Agent Inspector](../agentcore-features/01-harness/01-advanced-examples/10-getting-started-with-agent-inspector/) | Explore harness sessions, traces, and span trees using the Agent Inspector UI |
| [Mantle Endpoint](../agentcore-features/01-harness/01-advanced-examples/11-mantle/) | Run a harness against the Bedrock Mantle OpenAI-compatible endpoint using `--api-format responses` or `chat_completions` |
| [LiteLLM + Mantle](../agentcore-features/01-harness/01-advanced-examples/12-litellm-mantle/) | Route harness requests to Mantle via a LiteLLM model configuration, with CloudWatch GenAI observability |
| [AWS Skills](../agentcore-features/01-harness/01-advanced-examples/13-aws-skills/) | Give a harness agent native AWS Skills — curated capability bundles from the AWS Agent Toolkit declared in the `skills` field |
| [S3 Filesystem Mount](../agentcore-features/01-harness/01-advanced-examples/14-s3-filesystem/) | Mount an S3 Files access point into the harness microVM so the agent gets a persistent POSIX path that survives session boundaries |

### Use Cases

| Exercise | Description |
|:---------|:------------|
| [Travel Agent](../agentcore-features/01-harness/02-use-cases/01-travel-agent/) | Complete travel guide agent showcasing HTML generation, AgentCore memory, browser tool for live web data, and Exa search with Code Interpreter for data visualization |
| [Webapp Visual Testing](../agentcore-features/01-harness/02-use-cases/02-webapp-visual-testing/) | Use the harness microVM as a CI/CD test environment — build a web app, serve it, write Puppeteer tests in natural language, and pull screenshots back locally |
| [AWS Builder Agent](../agentcore-features/01-harness/02-use-cases/03-aws-builder-agent/) | Canonical "how to build an agent with the harness" example using harness + AWS Skills: declare model, tools, and skills in one `create_harness` call |
| [Weather Agent](../agentcore-features/01-harness/02-use-cases/04-weather-agent/) | Full-stack weather agent web app integrating six AgentCore capabilities: Gateway, Guardrails, Memory, Observability, Evaluations, and Optimization |

## Key Concepts

- **Reproducible runs** — the harness isolates each example in its own `uv` environment to prevent dependency conflicts
- **Pass/fail validation** — each example is checked for expected output or exit codes, surfacing failures immediately
- **Index sync** — the harness integrates with the workshop index so new examples are automatically discovered and listed
- **Incremental testing** — run a single exercise path to iterate quickly without re-executing the full suite
