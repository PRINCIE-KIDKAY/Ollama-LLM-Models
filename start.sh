#!/bin/sh

# Start Ollama in background
ollama serve &

# Wait for it to be ready
sleep 10

# Pull all the models
ollama pull bge-large:latest
ollama pull nomic-embed-text:latest
ollama pull mxbai-embed-large

ollama pull qwen3:1.7b
ollama pull granite3.3:2b
ollama pull llama3.2:1b
ollama pull deepseek-r1:1.5b

# Keep the container alive
tail -f /dev/null
