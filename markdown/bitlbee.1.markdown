
#  bitlbee


## help

General index:
`help index`




## first step

To register your own account:
`register <password>`

Add a gmail account:
`account set jabber username@gmail.com password`

To see the setting related to this account:
`acc gtalk set`

Then set the "server","port" and "ssl" property accordingly.
Add a facebook account:
`account add jabber user@chat.facebook.com`

and enable it:
`account fb set oauth on`



## manage accounts and user

List the accounts:
`account list`

To set server property:
`account 0 set server talk.google.com`

To set username:
`account 0 set username foo@gmail.com`

To connect with an account:
`account 0 on`

To disconnect:
`account gtalk off`

To delete an account:
`account 0 del`

To see all the properties of an account:
`account 0 set`


To see all the properties of a user:
`set`




## chatting

To add some contacts:
`add 0 r2d2@example.com`

To remove:
`remove r2d2`

To rename:
`rename r2d3 r2d2`

To chat in separate window:
`/msg or /query`


More features:
To join in a new separate channel:
`/join &amp;msn`





