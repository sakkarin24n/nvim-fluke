if type -q eza
   alias ls "eza -l -g --icons"
   alias ll "ls -a"
   alias c "clear"
   alias nv "nvim"
   alias t "tmux"
   alias django-run "python manage.py runserver"
end

    eval (oh-my-posh init fish --config ~/.poshthemes/marcduiker.omp.json)

if status is-interactive
    starship init fish | source
    set fish_greeting
#    if not tmux info &> /dev/null
#       tmux attach-session -t main || tmux new-session -s main
#    end

    # Commands to run in interactive sessions can go here
end

# bun
set -x PATH $HOME/.nix-profile/bin $PATH
set -gx TERM xterm-256color
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
