# All of this was taken from:
# [IRSSI Docs](https://irssi.org/documentation/startup)

# Get a list of default public network available
/network list

# Connect to a specific network
/connect Freenode
/server Freenode

# Join a channel
/join #channelname

# Get the names and the count of users inside a channel
/names

# Get the full list of users
/who #channelname

# Exit from a channel
/part
or
/part #channelname

# Disconnect from a server
/disconnect

# Add a network
/network ADD ExampleNet

# Add a server for a specified network
/SERVER ADD -auto -network ExampleNet irc.example.net

# Setup to automatically join channels after being connected to a network
/CHANNEL ADD -auto #channelname ExampleNet

# Automatically login to specified networks 
/NETWORK ADD -autosendcmd "/^msg nickserv ident pass;wait 2000" ExampleNet

# Automatically login to specified networks using SASL
/NETWORK ADD -sasl_username yourname -sasl_password yourpassword -sasl_mechanism PLAIN ExampleNet

# To have our nick highlighted we can set:
/hilight nick
# or
/SET hilight_nick_matches_everywhere ON

# To have beeps when we are references
/SET beep_msg_level MSGS HILIGHT DCCMSGS

# Get help
/HELP NETWORK
/HELP SERVER
/HELP CHANNEL
/HELP

## Freenode Specific
/msg alis LIST searchterm
/msg alis LIST * -topic multiple*ordered*search*terms
/msg alis LIST * -min 50
/msg alis LIST #foo*
/msg alis LIST #foo* -mode =n
/msg alis LIST *freetopic* -mode -t -show mt
/msg alis LIST ##nocolors* -mode +c -show t


## Moving inside irssi
We can move between windows through:
* Alt-[0-9q-o]              - Jump to the specified window
* /WINDOW <number>          - Jump to any window with specified number
* Ctrl-P, Ctrl-N            - Jump to previous / next window


## Users

# Check if user is online
/ping username

# Get information about administrators of a specific server
/stats

# Viewing channel names on new messages
/set actlist_names on

# Save configuration
/save
