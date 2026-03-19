FROM python:3.11-slim

# Install uv/uvx
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install Node.js
RUN apt-get update && apt-get install -y curl git && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install mcp-streamablehttp-proxy and the Karakeep MCP server
RUN pip install mcp-streamablehttp-proxy --break-system-packages && \
    npm install -g @karakeep/mcp

#CMD ["mcp-streamablehttp-proxy", "--host", "0.0.0.0", "--port", "3000", "npx", "@karakeep/mcp"]
