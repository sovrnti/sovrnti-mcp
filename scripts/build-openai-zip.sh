#!/usr/bin/env bash
# Build the ZIP for the OpenAI plugin portal (platform.openai.com/plugins).
# The portable manifest (plugin.json, mcp.json) drives the OpenAI listing.
# Claude-only files (.claude-plugin/, .mcp.json) and the MCP Registry file
# (server.json) stay out of the archive so the portal reads one manifest.
set -euo pipefail
cd "$(dirname "$0")/.."
version=$(python3 -c 'import json; print(json.load(open("plugin.json"))["version"])')
out="dist/sovrnti-openai-plugin-${version}.zip"
mkdir -p dist
rm -f "$out"
zip -r -X "$out" plugin.json mcp.json skills assets README.md LICENSE -x '*.DS_Store'
echo "$out"
