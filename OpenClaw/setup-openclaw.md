# OpenClaw configuration with Ollama
## 1. Install OpenClaw
```sh
curl -fsSL https://openclaw.ai/install.sh | bash
```

## 2. Install Ollama
```sh
curl -fsSL https://ollama.com/install.sh | sh
```

## 3. Run a powerful model locally
```sh
ollama run gpt-oss:20b
```

## 4. Prepare OpenClaw config for Ollama
1. Create a Folder to stored the config 
```sh
mkdir ~/.openclaw && cd ~./openclaw
```
2. Create a Jsonfile
```sh
vim openclaw.json
```
3. Paste this config and Modify the LLm model you wanna use
```sh
{
  "models": {
    "providers": {
      "ollama": {
        "baseUrl": "http://localhost:11434/v1",
        "apiKey": "ollama-local",
        "api": "openai-completions",
        "models": [
          {
            "id": "gpt-oss:20b", # Replace with yours actual Model
            "name": "gpt-oss:20b",
            "reasoning": false,
            "input": [
              "text"
            ],
            "cost": {
              "input": 0,
              "output": 0,
              "cacheRead": 0,
              "cacheWrite": 0
            },
            "contextWindow": 131072,
            "maxTokens": 8192
          }
        ]
      }
    }
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "ollama/gpt-oss:20b"  # Replace with yours actual Model
      },
      "workspace": "/Users/abhi/.openclaw/workspace",
      "maxConcurrent": 4,
      "subagents": {
        "maxConcurrent": 8
      }
    }
  },
  "tools": {
    "web": {
      "search": {
        "enabled": false
      },
      "fetch": {
        "enabled": true
      }
    }
  }
}
```
## 5. Start OpenClaw
openclaw onboard


## Uninstall OpenClaw (if exists)
if you want to uninstall prior openclaw and switch to local openclaw, run this command:
```sh
openclaw uninstall
```




