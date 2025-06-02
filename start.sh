#!/bin/sh

# Start Ollama in background
ollama serve &

# Wait for it to be ready
sleep 10

# Pull all the models
ollama pull bge-large:latest  # for embeddings
ollama pull nomic-embed-text:latest # for embeddings
ollama pull mxbai-embed-large # for embeddings

ollama pull qwen3:1.7b # for chat agents
ollama pull granite3.3:2b # for chat agents
ollama pull llama3.2:1b # for chat agents
ollama pull deepseek-r1:1.5b # for chat agents

# Keep the container alive
tail -f /dev/null
