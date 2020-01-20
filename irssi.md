All of this was taken from:
[IRSSI Docs](https://irssi.org/documentation/startup)


To see a list of default public network available we can do:
```irssi
/network list
```

Notice that in some clients we may have the command `/server` instead of
`/connect`.


To connect to a specific network we can do:
```irssi
/connect Freenode
```

```irssi
/join #channelname
```

To check the names and the count of users inside a channel we can do:
```irssi
/names
```

or to have the full list of users we can do:
```irssi
/who #channelname
```

We can exit from a channel by doing:
```irssi
/part
# or
/part #channelname
```

We can disconnect from a server by doing:
```irssi
/disconnect
```

We can add a network by doing:
```irssi
/network ADD ExampleNet
# then we can add a server for the specified network by doing
/SERVER ADD -auto -network ExampleNet irc.example.net
```

We can setup to automatically join channels after being connected to a network
by doing:
```irssi
/CHANNEL ADD -auto #channelname ExampleNet
```

We can also automatically login to networks by doing:
```irssi
/NETWORK ADD -autosendcmd "/^msg nickserv ident pass;wait 2000" ExampleNet
```
or using a SASL authentication:
```irssi
/NETWORK ADD -sasl_username yourname -sasl_password yourpassword -sasl_mechanism PLAIN ExampleNet
```

To have our nick highlighted we can set:
```irssi
/hilight nick
# or
/SET hilight_nick_matches_everywhere ON
```

we can also have beeps when there is our nick on osme line by doing:
```irssi
/SET beep_msg_level MSGS HILIGHT DCCMSGS
```


For more options check out the help command:
```irssi
/HELP NETWORK
/HELP SERVER
/HELP CHANNEL
/HELP
```

## Freenode Specific

```irssi
/msg alis LIST searchterm
/msg alis LIST * -topic multiple*ordered*search*terms
/msg alis LIST * -min 50
/msg alis LIST #foo*
/msg alis LIST #foo* -mode =n
/msg alis LIST *freetopic* -mode -t -show mt
/msg alis LIST ##nocolors* -mode +c -show t
```


## Moving inside irssi

We can move between windows through:
* Alt-[0-9q-o]              - Jump to the specified window
* /WINDOW <number>          - Jump to any window with specified number
* Ctrl-P, Ctrl-N            - Jump to previous / next window



## Users

We can check if a user is online by doing:
```irssi
/ping username
```

we can get information about administrators of a specific server by doing:
```irssi
/stats
```

## Viewing channel names on new messages

```irssi
/set actlist_names on
```

## Configuration

We can save current configuration with:
```irssi
/save
```
