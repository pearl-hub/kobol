
#  irc irssi


## basic commands

To connect to a server:
`/connect irc.freenode.net`

or:
`/server irc.freenode.net`

You can use Ctrl-X to switch between network connections.
To join a channel:
`/join - mychan`

To list all the channel:
`/list`

To close the session irc client:
`/quit`

List of main commands:

    |Command               |Alias    |Info                                               |
    |----------------------|---------|----|
    |/ban                   |/bans,/b|Sets or List bans for a channel|
    |/clear                 |/c, /cl |Clears a channel buffer|
    |/join                  |/j      |Joins a channel|
    |/kick                  |/k      |Kicks a user|
    |/kickban               |/kb     |Kickban a user|
    |/msg                   |/m      |Send a private message to a user|
    |/unban *               |/mub    |Clears the unbanlist (unbans everyone) in a channel|
    |/names                 |/n      |Lists the users in the current channel|
    |/query                 |/q      |Open a query window with a user,|
    |                       |        |or close current query window|
    |/topic                 |/t      |Displays/edits current topic.|
    |                       |        |Tip: use /t[space][tab] to automatically|
    |                       |        |fill in existing topic.|
    |/window close          |/wc     |Force closure of a window.|
    |/whois                 |/wi     |WHOIS a user. Displays user information|
    |/away "message"        |        |Set the client as away.|
    |                       |        |To disable it use the same command without message.|
    |/lastlog "word"        |        |Print the messages containing the "word"|
    |/scrollback goto hh:mm |/sb     |Move to previous conversation.
    |                       |        |Use /sb end for to go the bottom.|

## Manage a channel ##

To create a channel:

    /join #channel

To invite people in channel:

    /invite buddy #channel

To insert the topic:

    /topic this is my topic

To change the mode to private or secret:

    /mode #channel +s
    /mode #channel +p

## miscellaneous ##

To get the property:
`/set`

To set a property:
`/set timestamp_format %H:%M:%S`

To save the configuration:
`/save`

To get all the alias:
`/alias`

To set a theme:
`/set theme themename`

To highlight some nick:
`/hilight yournick`


## perl script ##

Put the script in ~/.irssi/scripts or in ~/.irssi/scripts/autorun to run the script at startup.
To execute a script:
`/run scriptname`


## set a new account ##

To set a nick:
`/nick feel`

To register the nick:
`/msg nickserv register password user@email`

To beingidentified with your own account:
`/msg nickserv register password`

To change the password:
`/ns set password newPassword`


## chatting ##

To a private chat:
`/query nick`



## manage window ##

To show a window #num in a new horizontal container (works only for non stick windows):
`/window show #num`

To hide a window:
`/window hide #num`

To disable stickness from a window:
`/window stick #num off`

To move window up/down:
`/window move IP/DOWN`

To close the current window:
`/window close`

### manage window size ###

To balance the size of all windows:
`/window balance`

To shrink/grow the size of the current window:

`/window shrink [#lines]`

`/window grow [#lines]`




