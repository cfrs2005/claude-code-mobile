#!/bin/bash
set -e

echo "Loading configuration..."
if [ -f "/config/config.env" ]; then
    source /config/config.env
    echo "Config loaded"
fi

export PATH="$HOME/.local/bin:$PATH"

echo "Starting Happy service for mobile access..."
echo "Claude: $(which claude 2>/dev/null || echo 'not found')"
echo "Happy: $(which happy 2>/dev/null || echo 'not found')"

echo "Auto-starting Happy service..."

# Change to workspace directory before starting happy
cd /workspace

# Check if already authenticated
if [ -f "/root/.happy/access.key" ]; then
    echo "Authentication found, starting Happy with auto-config..."
    echo "Working directory: $(pwd)"
    if [ "${IS_SANDBOX:-0}" = "1" ]; then
    echo "Sandbox mode detected, using --dangerously-skip-permissions"
    HAPPY_ARGS="--dangerously-skip-permissions"
    else
        echo "Using default mode"
        HAPPY_ARGS=""
    fi
    # Use expect to handle Claude Code initial setup
    expect -c "
    set timeout -1
    spawn happy $HAPPY_ARGS
    expect {
        \"Choose the text style\" {
            puts \"Auto-selecting dark mode...\"
            send \"\r\"
            exp_continue
        }
        \"Press Enter to continue\" {
            puts \"Accepting security notes...\"
            send \"\r\"
            exp_continue
        }
        \"Welcome\" {
            puts \"Happy service ready!\"
            interact
        }
        eof { exit 0 }
    }
    "
else
    echo "No authentication found. First time setup needed:"
    echo "docker exec -it <container> happy"
    tail -f /dev/null
fi