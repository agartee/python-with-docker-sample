HEALTHY_TIMESPAN=30
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
LASTRUN=$(cat $PARENT_DIR/logs/lastrun.log)
NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

ELAPSED=$(( ($(date -d $NOW +%s) - $(date -d $LASTRUN +%s)) )) 
if [ $ELAPSED -lt $HEALTHY_TIMESPAN ]; then echo "True"; else echo "False"; fi

# TODO:
# 0: The container is healthy and working normally.
# 1: The container is unhealthy; the workload may not be functioning.
# 2: This status code is reserved by Docker and should not be used.
