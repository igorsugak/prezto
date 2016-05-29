#
# Sets history options and defines history aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Igor Sugak <sugak.igor@gmail.com>
#

#
# Variables
#

HISTFILE="${ZDOTDIR:-$HOME}/.zsh-history" # The path to the history file.
HISTSIZE=130000                # The maximum number of events to save.
SAVEHIST=130000                # The maximum number of events to save.

#
# Options
#

setopt BANG_HIST               # Treat the '!' character specially.
setopt EXTENDED_HISTORY        # Use ':start:elapsed;command' history format.
setopt INC_APPEND_HISTORY      # Write to the history file immediately.
setopt SHARE_HISTORY           # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire a duplicate event first when trimming.
setopt HIST_IGNORE_DUPS        # Do not record an event that was just recorded.
setopt HIST_IGNORE_ALL_DUPS    # Delete an old event if a new one is a duplicate.
setopt HIST_FIND_NO_DUPS       # Do not display a previously found event.
setopt HIST_IGNORE_SPACE       # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS       # Do not write a duplicate event.
setopt HIST_VERIFY             # Do not execute immediately upon expansion.
setopt HIST_NO_FUNCTIONS       # Do not store function definitions in history.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks from each command.

#
# Aliases
#

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
