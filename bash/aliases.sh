alias ..='cd ..'
alias reload='source $HOME/.bashrc'

if which bat >& /dev/null;
then
  alias cat='bat'
fi

if  which rg >& /dev/null;
then
  alias grep='rg'
fi
