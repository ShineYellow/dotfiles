#!/bin/sh

event="${1:-Notification}"
log_file="${CODEX_HOME:-$HOME/.codex}/hooks/macos-notify.log"

log() {
  timestamp="$(date '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date)"
  printf '%s event=%s %s\n' "$timestamp" "$event" "$*" >>"$log_file" 2>/dev/null || true
}

log "started"

resolve_zellij_session_name() {
  if [ -n "${CODEX_ZELLIJ_SESSION_NAME:-}" ]; then
    printf '%s\n' "$CODEX_ZELLIJ_SESSION_NAME"
    return
  fi

  env_session_name="${ZELLIJ_SESSION_NAME:-}"
  zellij_version="$(zellij --version 2>/dev/null | awk '{print $2}')"
  zellij_socket_dir="${TMPDIR:-/tmp}/zellij-$(id -u)/$zellij_version"

  if [ -n "$env_session_name" ] && [ -S "$zellij_socket_dir/$env_session_name" ]; then
    printf '%s\n' "$env_session_name"
    return
  fi

  if [ -d "$zellij_socket_dir" ]; then
    latest_socket="$(
      find "$zellij_socket_dir" -maxdepth 1 -type s -print 2>/dev/null |
        while IFS= read -r socket_path; do
          stat -f '%m %N' "$socket_path" 2>/dev/null
        done |
        sort -nr |
        sed -n '1s/^[0-9][0-9]* //p'
    )"

    if [ -n "$latest_socket" ]; then
      basename "$latest_socket"
      return
    fi
  fi

  printf '%s\n' "$env_session_name"
}

session_name="$(resolve_zellij_session_name)"

if [ -n "$session_name" ]; then
  title="Codex · $session_name"
else
  title="Codex"
fi

case "$event" in
  Stop)
    message="Turn complete. Waiting for your input."
    ;;
  Notification)
    message="Codex needs your attention."
    ;;
  *)
    message="Codex hook: $event"
    ;;
esac

/usr/bin/osascript - "$title" "$message" >/dev/null 2>&1 <<'APPLESCRIPT' || true
on run argv
  display notification (item 2 of argv) with title (item 1 of argv)
end run
APPLESCRIPT
log "sent title=$(printf '%s' "$title" | tr '\n' ' ') message=$(printf '%s' "$message" | tr '\n' ' ')"

printf '{}\n'
exit 0
