#!/usr/bin/env zsh

arg=$1

if [[ $arg == '--input=up' ]]; then
    # handle up
    # determine current workspace (try jq path first, fallback to simple parsing)
    current_ws=$(hyprctl -j activewindow 2>/dev/null | jq -r '.workspace.id' 2>/dev/null || true)
    if [[ -z $current_ws ]]; then
        # fallback: try to grab a workspace number from hyprctl workspaces output
        current_ws=$(hyprctl workspaces 2>/dev/null | grep -m1 -oE '[0-9]+' || true)
    fi

    # ensure we have a numeric workspace id
    if ! [[ $current_ws =~ ^[0-9]+$ ]]; then
        echo "input: up (could not determine current workspace)" >&2
        echo "input: up"
        fi
    # if current workspace is above 10, go to HOR_WORKSPACE (if valid)
    if (( current_ws > 11 )); then
        if [[ -n $HOR_WORKSPACE && $HOR_WORKSPACE =~ ^[0-9]+$ ]]; then
            hyprctl dispatch workspace "$HOR_WORKSPACE"
        else
            export HOR_WORKSPACE=1
            hyprctl dispatch workspace "$HOR_WORKSPACE"
        fi
    else
        # go up by 1 (decrease workspace number). Do nothing if result < 1
            target=$(( current_ws + 1 ))
            if (( target > 10 )); then
                target=1
            elif (( target < 1 )); then
                target=10
            fi
            hyprctl dispatch workspace "$target"
        fi
    fi

    echo "input: up"
fi

if [[ $arg == '--input=down' ]]; then
    # handle down
    # determine current workspace (try jq path first, fallback to simple parsing)
    current_ws=$(hyprctl -j activewindow 2>/dev/null | jq -r '.workspace.id' 2>/dev/null || true)
    if [[ -z $current_ws ]]; then
        current_ws=$(hyprctl workspaces 2>/dev/null | grep -m1 -oE '[0-9]+' || true)
    fi

    # ensure we have a numeric workspace id
    if ! [[ $current_ws =~ ^[0-9]+$ ]]; then
        echo "input: down (could not determine current workspace)" >&2
        echo "input: down"
    else
        # if current workspace is above 10, go to HOR_WORKSPACE (if valid)
        if (( current_ws > 11 )); then
            if [[ -n $HOR_WORKSPACE && $HOR_WORKSPACE =~ ^[0-9]+$ ]]; then
                hyprctl dispatch workspace "$HOR_WORKSPACE"
            else
                export HOR_WORKSPACE=1
                hyprctl dispatch workspace "$HOR_WORKSPACE"
            fi
        else
            # go down by 1 (increase workspace number) with wrap-around 1..10
            target=$(( current_ws + 1 ))
            if (( target > 10 )); then
                target=1
            elif (( target < 1 )); then
                target=10
            fi
            hyprctl dispatch workspace "$target"
        fi

        echo "input: down"
    fi
fi
fi

if [[ $arg == '--input=right' ]]; then
    # handle right
    echo "input: right"
fi

if [[ $arg == '--input=left' ]]; then
    # handle left
    echo "input: left"
fi