#                   ______     ___           __ __
#                  / ____/__  / (_)  __     / //_/_  ____  ______
#                 / /_  / _ \/ / / |/_/    / ,< / / / / / / / __ \
#                / __/ /  __/ / />  <     / /| / /_/ / /_/ / / / /
#               /_/    \___/_/_/_/|_|____/_/ |_\__, /\__,_/_/ /_/
#                                  /_____/    /____/
#                               My Zsh Config [OMZ]

# Print Greet 
#figlet -cf slant Felix_Kyun | lolcat
redfetch

# enable p10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Enable OMZ
export ZSH="$HOME/.oh-my-zsh"
# export TERM='xterm-256color'

#Set Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Plugins
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
#  vi-mode
)

# Some Other Settings
source $ZSH/oh-my-zsh.sh
path+=('/home/felix/.local/bin')

# eval "$(luajit ~/.oh-my-zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once fzf )"

# Enable Other Configs
. ~/.zsh_aliases
. ~/.zsh_vars
# Finally Enable p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
