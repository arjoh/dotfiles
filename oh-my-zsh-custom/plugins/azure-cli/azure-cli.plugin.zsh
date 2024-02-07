function {
    # search in these locations for the azure-cli completions:
    for completion in /etc/bash_completion.d/azure-cli \
      /usr/share/bash-completion/completions/azure-cli
    do
        if [[ -f "$completion" ]]; then
            source "$completion"
            return
        fi
    done
    # print "[oh-my-zsh] azure-cli plugin: Cannot find bash completions for azure-cli.\n"\
    #       "Keeping quiet about this because you'll find out soon enough :-)" >&2
    # return 1
}
