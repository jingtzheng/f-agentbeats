#!/bin/bash
# AgentBeats controller launch script
# This script is called by the AgentBeats controller
# The controller sets HOST and AGENT_PORT environment variables

# Change to script directory (project root)
cd "$(dirname "$0")"

# AGENT_TYPE determines which agent to start: "green" (default) or "white"
AGENT_TYPE="${AGENT_TYPE:-green}"

if [ "$AGENT_TYPE" = "white" ]; then
    echo "Starting WHITE agent..."
    python start_white_agent.py --host ${HOST:-0.0.0.0} --port ${AGENT_PORT:-9002}
else
    echo "Starting GREEN agent..."
    python start_green_agent.py --host ${HOST:-0.0.0.0} --port ${AGENT_PORT:-9001} --mode white_agent
fi
