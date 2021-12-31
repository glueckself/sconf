export REPO_ROOT=$(git rev-parse --show-toplevel)

sconf_dbg() {
	echo "$@" >&2
	if [ ! -t 0 ]; then
		echo === stdin === >&2
		cat >&2
		echo ============= >&2
	fi
	case "$1" in
		sed|cat) cmd="$1"; shift; $cmd "$@" ;;
	esac
}

if [[ "$SCONF_DEMO" != "" ]]; then
	export sconf_cmd="sconf_dbg "
else
	export sconf_cmd=""
fi
