FROM python:3.11-slim

RUN pip install mcp-streamablehttp-proxy mcp-server-fetch

# Bind to 0.0.0.0 for container networking
