# OpenCode Commands Reference

## TUI Slash Commands

| Command | Aliases | Description | Keybind |
|---|---|---|---|
| `/connect` | | Add a provider and API key | |
| `/compact` | `/summarize` | Compact/summarize current session | `ctrl+x c` |
| `/details` | | Toggle tool execution details | |
| `/editor` | | Open external editor for composing | `ctrl+x e` |
| `/exit` | `/quit`, `/q` | Exit OpenCode | `ctrl+x q` |
| `/export` | | Export conversation to Markdown | `ctrl+x x` |
| `/help` | | Show help dialog | |
| `/init` | | Guided setup for AGENTS.md | |
| `/models` | | List available models | `ctrl+x m` |
| `/new` | `/clear` | Start a new session | `ctrl+x n` |
| `/redo` | | Redo a previously undone message | `ctrl+x r` |
| `/sessions` | `/resume`, `/continue` | List/switch between sessions | `ctrl+x l` |
| `/share` | | Share current session | |
| `/themes` | | List available themes | `ctrl+x t` |
| `/thinking` | | Toggle thinking/reasoning block display | |
| `/undo` | | Undo last message (reverts file changes) | `ctrl+x u` |
| `/unshare` | | Unshare current session | |

## CLI Commands

### Core Commands

| Command | Description |
|---|---|
| `opencode [project]` | Start TUI (default, opens in current directory or specified project) |
| `opencode run [message]` | Run non-interactively with a prompt |
| `opencode serve` | Start headless HTTP server for API access |
| `opencode web` | Start server with web interface (opens browser) |
| `opencode attach [url]` | Attach TUI to a running backend server |
| `opencode acp` | Start ACP (Agent Client Protocol) server via stdin/stdout |

### Agent Management

| Command | Description |
|---|---|
| `opencode agent list` | List all available agents |
| `opencode agent create` | Create a new agent with custom configuration |

### Authentication

| Command | Aliases | Description |
|---|---|---|
| `opencode auth login` | | Login to a provider |
| `opencode auth list` | `auth ls` | List authenticated providers |
| `opencode auth logout` | | Logout from a provider |

### MCP Servers

| Command | Aliases | Description |
|---|---|---|
| `opencode mcp add` | | Add an MCP server |
| `opencode mcp list` | `mcp ls` | List configured MCP servers |
| `opencode mcp auth [name]` | | Authenticate with OAuth MCP server |
| `opencode mcp logout [name]` | | Remove OAuth credentials for MCP server |
| `opencode mcp debug <name>` | | Debug OAuth connection issues |

### Models

| Command | Description |
|---|---|
| `opencode models [provider]` | List all available models (optionally filter by provider) |

### Sessions

| Command | Description |
|---|---|
| `opencode session list` | List all OpenCode sessions |
| `opencode export [sessionID]` | Export session data as JSON |
| `opencode import <file>` | Import session from JSON file or share URL |

### Statistics

| Command | Description |
|---|---|
| `opencode stats` | Show token usage and cost statistics |

### GitHub

| Command | Description |
|---|---|
| `opencode github install` | Install GitHub agent in your repository |
| `opencode github run` | Run the GitHub agent (typically in GitHub Actions) |

### Maintenance

| Command | Description |
|---|---|
| `opencode upgrade [target]` | Upgrade to latest version or specific version |
| `opencode uninstall` | Uninstall OpenCode and remove related files |

## CLI Flags

### TUI Flags

| Flag | Short | Description |
|---|---|---|
| `--continue` | `-c` | Continue the last session |
| `--session` | `-s` | Session ID to continue |
| `--fork` | | Fork the session when continuing |
| `--prompt` | | Prompt to use |
| `--model` | `-m` | Model to use (provider/model format) |
| `--agent` | | Agent to use |
| `--port` | | Port to listen on |
| `--hostname` | | Hostname to listen on |

### Run Flags

| Flag | Short | Description |
|---|---|---|
| `--command` | | The command to run |
| `--continue` | `-c` | Continue the last session |
| `--session` | `-s` | Session ID to continue |
| `--fork` | | Fork the session when continuing |
| `--share` | | Share the session |
| `--model` | `-m` | Model to use (provider/model format) |
| `--agent` | | Agent to use |
| `--file` | `-f` | File(s) to attach to message |
| `--format` | | Output format: `default` or `json` |
| `--title` | | Title for the session |
| `--attach` | | Attach to running opencode server |
| `--port` | | Port for local server |
| `--dangerously-skip-permissions` | | Auto-approve permissions (dangerous!) |

### Global Flags

| Flag | Short | Description |
|---|---|---|
| `--help` | `-h` | Display help |
| `--version` | `-v` | Print version number |
| `--print-logs` | | Print logs to stderr |
| `--log-level` | | Log level: DEBUG, INFO, WARN, ERROR |

### Session List Flags

| Flag | Short | Description |
|---|---|---|
| `--max-count` | `-n` | Limit to N most recent sessions |
| `--format` | | Output format: `table` or `json` |

### Stats Flags

| Flag | Description |
|---|---|
| `--days` | Show stats for the last N days |
| `--tools` | Number of tools to show |
| `--models` | Show model usage breakdown |
| `--project` | Filter by project |

### Agent Create Flags

| Flag | Description |
|---|---|
| `--path` | Directory to write agent file |
| `--description` | What the agent should do |
| `--mode` | Agent mode: `all`, `primary`, or `subagent` |
| `--permissions` | Comma-separated list of permissions to allow |
| `--model` / `-m` | Model to use (provider/model format) |

### Upgrade Flags

| Flag | Short | Description |
|---|---|---|
| `--method` | `-m` | Installation method: curl, npm, pnpm, bun, brew |

### Uninstall Flags

| Flag | Short | Description |
|---|---|---|
| `--keep-config` | `-c` | Keep configuration files |
| `--keep-data` | `-d` | Keep session data and snapshots |
| `--dry-run` | | Show what would be removed without removing |
| `--force` | `-f` | Skip confirmation prompts |

## TUI Special Inputs

| Input | Description |
|---|---|
| `@filename` | Fuzzy file reference - injects file content into conversation |
| `!/command` | Run a shell command - output added to conversation as tool result |

## Custom Commands

Create custom commands by placing markdown files in:
- **Global:** `~/.config/opencode/commands/`
- **Per-project:** `.opencode/commands/`

### Example: `.opencode/commands/test.md`

```markdown
---
description: Run tests with coverage
agent: build
model: anthropic/claude-3-5-sonnet-20241022
---
Run the full test suite with coverage report and show any failures.
Focus on the failing tests and suggest fixes.
```

### Custom Command Placeholders

| Placeholder | Description |
|---|---|
| `$ARGUMENTS` | All arguments passed to the command |
| `$1`, `$2`, `$3` | Positional arguments |
| ``!`command` `` | Inject shell command output |
| `@filename` | Include file content |

### Custom Command Options (frontmatter)

| Option | Description |
|---|---|
| `description` | Shown in TUI when typing the command |
| `template` | The prompt sent to the LLM (required) |
| `agent` | Which agent should execute the command |
| `model` | Override the default model for this command |
| `subtask` | Force command to trigger a subagent |

## Editor Setup

Set your `EDITOR` environment variable for `/editor` and `/export` commands:

```bash
# Linux/macOS
export EDITOR="code --wait"    # VS Code
export EDITOR="nvim"           # Neovim
export EDITOR="vim"            # Vim

# Windows (PowerShell)
$env:EDITOR = "code --wait"
```