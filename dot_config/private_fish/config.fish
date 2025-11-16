if status is-interactive
    # Set the default editor
    export EDITOR='nano'
    export VISUAL='lite-xl'

    fish_add_path --append --path ~/.bin ~/.local/bin

    # PATH changes
    bass [[ -r ~/.profile ]] && bass source ~/.profile
    # shell aliases
    bass [[ -r ~/.shell_common ]] && bass source ~/.shell_common

    fastfetch
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/lh/.lmstudio/bin
# End of LM Studio CLI section

