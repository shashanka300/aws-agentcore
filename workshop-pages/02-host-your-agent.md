# Module 02 — Host Your Agent

**Deploy agents and MCP tool servers on AgentCore Runtime with multi-protocol support.**

AgentCore Runtime gives you a serverless, session-isolated environment for hosting agents and tool servers. Deploy by zipping your code and uploading to S3 — no container knowledge required.

[← Back to Workshop](../INDEX.md)

## What You'll Learn

- Deploy an agent to AgentCore Runtime and invoke it over HTTP
- Expose an agent using the A2A or AG-UI protocol
- Host an MCP tool server for other agents to consume
- Use sessions, streaming, and async execution patterns
- Connect agents to a VPC for private network access
- Build coding agents with persistent filesystems (S3 or EFS)

## Exercises

| Exercise | Description |
|:---------|:------------|
| [Hosting Agents — HTTP](../agentcore-features/02-host-your-agent/01-runtime/01-hosting-agents/) | Deploy agents using Strands, LangGraph, CrewAI, Java, or TypeScript over HTTP, A2A, and AG-UI protocols |
| [Hosting Tools — MCP](../agentcore-features/02-host-your-agent/01-runtime/02-hosting-tools/) | Deploy an MCP tool server and connect agents to it |
| [Advanced Patterns](../agentcore-features/02-host-your-agent/01-runtime/03-advanced/) | Streaming responses, session management, async execution, multi-agent orchestration, VPC connectivity, middleware |
| [Persistent Filesystems](../agentcore-features/02-host-your-agent/01-runtime/03-advanced/07-persistent-filesystems/) | Persist filesystem state across session stop/resume cycles using AgentCore runtime session storage |
| [Coding Agents](../agentcore-features/02-host-your-agent/01-runtime/04-coding-agents/) | Claude Code agents with S3 and EFS filesystem integration |
| [Claude Code with S3 Files](../agentcore-features/02-host-your-agent/01-runtime/04-coding-agents/01-claude-code-with-s3-files/) | Deploy Claude Code as an HTTP agent on AgentCore runtime with an S3 Files filesystem mounted for persistent storage shared across sessions |
| [HTTP Agent on EC2 CapacityProvider](../agentcore-features/02-host-your-agent/01-runtime/01-hosting-agents/08-http-ec2-capacity-provider/) | Deploy an HTTP agent on your own EC2 instances via a CapacityProvider (zip and container artifacts) |
| [A2A Agent on EC2 CapacityProvider](../agentcore-features/02-host-your-agent/01-runtime/01-hosting-agents/09-a2a-ec2-capacity-provider/) | Deploy an A2A agent on your own EC2 instances via a CapacityProvider |
| [MCP Server on EC2 CapacityProvider](../agentcore-features/02-host-your-agent/01-runtime/02-hosting-tools/03-mcp-ec2-capacity-provider/) | Deploy an MCP tool server on your own EC2 instances via a CapacityProvider |
| [Egress-Controlled Code Execution](../agentcore-features/02-host-your-agent/01-runtime/03-advanced/12-egress-coding-execution/) | Run untrusted code in a network-isolated container with broker-mediated egress |
| [Async Jobs on EC2 CapacityProvider](../agentcore-features/02-host-your-agent/01-runtime/03-advanced/13-async-ec2-capacity-provider/) | Long-running async jobs on EC2 with HealthyBusy ping to prevent idle reclamation |
| [Autonomous Coding Agent — Durable](../agentcore-features/02-host-your-agent/01-runtime/04-coding-agents/05-autonomous-coding-agent-durable/) | Event-driven coding agent with durable orchestration, Cedar policies, and cross-ticket memory |
| [Codex with EFS](../agentcore-features/02-host-your-agent/01-runtime/04-coding-agents/06-codex-with-efs/) | Deploy OpenAI Codex SDK on AgentCore Runtime with EFS for persistent shared storage |

## Key Concepts

- **Any framework** — Strands, LangGraph, CrewAI, or bring your own
- **Multi-protocol** — HTTP, MCP, A2A (Agent-to-Agent), AG-UI
- **Session isolation** — each session runs in its own environment
- **Fast cold starts** — optimized for low-latency agent invocations
