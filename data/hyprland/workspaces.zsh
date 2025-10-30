#!/usr/bin/env zsh

arg=$1

# get the current workspace id (numeric) or empty if unknown
get_current_ws() {
    local ws
    ws=$(hyprctl -j activeworkspace 2>/dev/null | jq -r '.id' 2>/dev/null)
    if [[ $ws =~ ^[0-9]+$ ]]; then
        echo "$ws"
    else
        echo ""
    fi
}

current_ws=$(get_current_ws)

# helper to dispatch to horizontal workspace (HOR_WORKSPACE) or default to 1
dispatch_hor_workspace() {
    if [[ -n $HOR_WORKSPACE && $HOR_WORKSPACE =~ ^[0-9]+$ ]]; then
        hyprctl dispatch workspace "$HOR_WORKSPACE"
    else
        export HOR_WORKSPACE=1
        hyprctl dispatch workspace "$HOR_WORKSPACE"
    fi
}

if [[ $arg == "--input=up" ]]; then
    if [[ -z $current_ws ]]; then
        echo "input: up (could not determine current workspace)" >&2
        echo "input: up"
        exit 0
    fi

    # if current workspace is horizontal (>10), switch to HOR_WORKSPACE
    if (( current_ws > 10 )); then
        dispatch_hor_workspace
    else
        # go "up" by decreasing workspace number with wrap-around 1..10
        target=$(( current_ws - 1 ))
        if (( target < 1 )); then
            target=10
        fi
        hyprctl dispatch workspace "$target"
    fi

    echo "input: up"

elif [[ $arg == "--input=down" ]]; then
    if [[ -z $current_ws ]]; then
        echo "input: down (could not determine current workspace)" >&2
        echo "input: down"
        exit 0
    fi

    # if current workspace is horizontal (>10), switch to HOR_WORKSPACE
    if (( current_ws > 10 )); then
        dispatch_hor_workspace
    else
        # go "down" by increasing workspace number with wrap-around 1..10
        target=$(( current_ws + 1 ))
        if (( target > 10 )); then
            target=1
        fi
        hyprctl dispatch workspace "$target"
    fi

    echo "input: down"

elif [[ $arg == "--input=right" ]]; then
    # handle right
    echo "input: right"

elif [[ $arg == "--input=left" ]]; then
    # handle left
    echo "input: left"
fi
