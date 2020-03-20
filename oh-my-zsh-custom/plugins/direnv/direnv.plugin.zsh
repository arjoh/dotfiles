if ! (( $+commands[direnv] )); then
  print "zsh direnv plugin: direnv not found. Please install direnv before using this plugin." >&2
  return 1
fi

# ALIASES

# CONFIGURATION VARIABLES


# Hook direnv into our shell
eval "$(command direnv hook zsh)"

