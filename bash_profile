if [[ -f $HOME/.bashrc ]]; then source $HOME/.bashrc; fi
if [[ -f $HOME/.bashrc.local ]]; then source $HOME/.bashrc.local; fi
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
