#!/bin/sh

echo "[INFO] Starting Ollama..."

# Check if NVIDIA GPU is available (for logging only)
if command -v nvidia-smi > /dev/null; then
  echo "[INFO] NVIDIA GPU detected:"
  nvidia-smi
else
  echo "[WARN] No NVIDIA GPU detected. Using CPU."
fi

# Start Ollama in background
ollama serve &

# Wait for the service to initialize
sleep 10

# Pull models (edit as needed)
ollama pull bge-large:latest
ollama pull nomic-embed-text:latest
ollama pull mxbai-embed-large
ollama pull qwen3:1.7b
ollama pull granite3.3:2b
ollama pull llama3.2:1b
ollama pull deepseek-r1:1.5b

echo "[INFO] All models pulled. Ready to serve."

# Keep container alive
tail -f /dev/null
