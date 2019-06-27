# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

if [ -e /usr/local/bin/google-cloud-sdk/completion.bash.inc ]; then
    source /usr/local/bin/google-cloud-sdk/completion.bash.inc;
fi;

complete -o default -F __kubectl kc

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# PF9 Shortcuts
dupass() { 2>/dev/null ssh -tt $1 sudo grep PASS /root/admin_admin.rc | sed 's/^.*=//g'; }
duload() { ssh -tt $1 sudo uptime; }

# Bash completion support
source /usr/local/etc/bash_completion

# VirtualEnvsWrapper Workon
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export WORKON_HOME="/Users/joshkelly/.envs"
source /usr/local/bin/virtualenvwrapper.sh
