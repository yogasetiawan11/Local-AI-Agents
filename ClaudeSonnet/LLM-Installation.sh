#!/bin/bash

# 1. Install Ollama on Linux
curl -fsSL https://ollama.com/install.sh | sh

# 2. Verify the installation
echo "Ollama version: $(ollama --version)"

# 3. Pull the Ollama model
ollama pull glm-4.7-flash  
# or gpt-oss:20b (for better performance)

# 4. Pull the Claude model
curl -fsSL https://claude.ai/install.sh | bash

# 5. Run Claude with Ollama
ollama launch claude --model glm-4.7-flash 
# or ollama launch claude --model glm-4.7-flash gpt-oss:20b

