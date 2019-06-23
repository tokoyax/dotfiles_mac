function peco_switch_tmux_session
  tmux ls | peco | ruby -ne 'puts $_.sub(/:.*/, "")' | xargs tmux switch-client -t
end
