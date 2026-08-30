# Module 03 — Connect Your Agent to Anything

**Give agents a sandboxed Python environment (Code Interpreter) and a managed headless browser.**

AgentCore provides two powerful built-in tools that require no infrastructure setup: a secure code execution sandbox and a cloud-hosted Chromium browser.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Execute Python code in an isolated sandbox with filesystem access
- Run shell commands and use the AWS CLI from within a sandboxed environment
- Automate web browsers — navigate, fill forms, extract data
- Integrate browser automation with Strands agents and the Nova Act model
- Apply domain filtering policies to restrict browser access
- Handle authentication for web interactions

---

## Code Interpreter Exercises

| Exercise | Description |
|:---------|:------------|
| [File Operations](../agentcore-features/03-connect-your-agent-to-anything/01-code-interpreter/01-file-operations/) | Upload files to the sandbox, read and write the filesystem |
| [Code Execution](../agentcore-features/03-connect-your-agent-to-anything/01-code-interpreter/02-code-execution/) | Run arbitrary Python code and capture output |
| [Data Analysis](../agentcore-features/03-connect-your-agent-to-anything/01-code-interpreter/03-data-analysis/) | End-to-end data analysis workflows inside the sandbox |
| [Run Commands](../agentcore-features/03-connect-your-agent-to-anything/01-code-interpreter/04-run-commands/) | Execute shell commands and invoke the AWS CLI |

## Browser Tool Exercises

| Exercise | Description |
|:---------|:------------|
| [Nova Act](../agentcore-features/03-connect-your-agent-to-anything/02-browser/01-nova-act/) | Browser automation with Amazon Nova Act model |
| [Browser-Use](../agentcore-features/03-connect-your-agent-to-anything/02-browser/02-browser-use/) | Use the Browser-Use framework for web interactions |
| [Observability](../agentcore-features/03-connect-your-agent-to-anything/02-browser/03-observability/) | Trace and debug browser interactions |
| [Strands Integration](../agentcore-features/03-connect-your-agent-to-anything/02-browser/04-strands/) | Attach the Browser Tool to a Strands agent |
| [Domain Filtering](../agentcore-features/03-connect-your-agent-to-anything/02-browser/05-domain-filtering/) | Configure domain firewall policies for the browser |
| [Web Bot Auth](../agentcore-features/03-connect-your-agent-to-anything/02-browser/06-web-bot-auth/) | Handle authentication flows in automated browser sessions |
| [VPC Connectivity](../agentcore-features/03-connect-your-agent-to-anything/02-browser/07-11-vpc/) | Connect the browser to private network resources via VPC |
| [Chrome Policies](../agentcore-features/03-connect-your-agent-to-anything/02-browser/12-chrome-policies/) | Enforce Chrome security and behavior policies |
| [OS Actions](../agentcore-features/03-connect-your-agent-to-anything/02-browser/13-os-actions/) | Perform OS-level actions from within browser sessions |

## Web Search Exercises

| Exercise | Description |
|:---------|:------------|
| [Raw MCP](../agentcore-features/03-connect-your-agent-to-anything/03-web-search/01-raw-mcp/) | Calls the AgentCore gateway directly over the MCP protocol — tool discovery and invocation without an agent framework |

## FMKB Managed KB Exercises

| Exercise | Description |
|:---------|:------------|
| [Raw MCP](../agentcore-features/03-connect-your-agent-to-anything/04-fmkb-managed-kb/01-raw-mcp/) | Verify the gateway path without an agent — isolates the gateway/IAM layer from the agent layer |
| [Strands Agent](../agentcore-features/03-connect-your-agent-to-anything/04-fmkb-managed-kb/02-strands-agent/) | Deploy a Strands agent on AgentCore Runtime that queries a Managed Knowledge Base via Gateway |

## Key Concepts

- **Code Interpreter** — Python 3.12 sandbox, writable filesystem, shell access, per-session isolation
- **Browser** — Managed headless Chromium, Chrome DevTools Protocol (CDP), cloud-hosted (no local browser needed)
