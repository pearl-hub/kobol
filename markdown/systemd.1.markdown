
#  systemd


## System ##

To boot the system:
`systemctl reboot`

To poweroff the system:
`systemctl poweroff`

Analyze the boot time in msec:
`systemd-analyze`

Ordered list of units sortex by init time:
`systemd-analyze blame`

Plot a graph of init time:
`systemd-analyze plot`

## Journal & Logs ##

### Best commands ###
Show log from this boot for a specific unit:

`journalctl -xn -b -u UNITNAME.service`

Follow new messages:

`journalctl -f`

To check which services are managed by Journald:
`journalctl -F _SYSTEMD_UNIT`

### Bootstrap ###
Shows messages from the current boot:

`journalctl -b -0`

From the previous boot:

`journalctl -b -1`

Create a text file for the log:
`journalctl -a > read_log.txt`

### Filtering ###

Get logs for a specific PID:
`journalctl _PID=1`

Get logs for a specific unit:
`journalctl _SYSTEMD_UNIT=systemd-logind.service`

Get logs for a specific user:
`journalctl _UID=myusername`

Get logs for a specific command:
`journalctl _COMM=sshd`

Get all logs since yesterday until 9th Sep 2016:
`journalctl --since=yesterday --until=2016-09-10`


## Services ##

List of services:
`systemctl`

List all the active services:
`systemctl list-units`

List all available services (even the inactive ones):
`systemctl list-unit-files`

List the units failed:
`systemctl --failed`

Start a service:
`systemctl start service`

Stop a service:
`systemctl stop service`

Restart a service:
`systemctl restart service`

Reload a service:
`sudo systemctl reload service`

Show the status of a service:
`systemctl status service`

Enable a service at boot:
`systemctl enable service`

Disable a service at boot:
`systemctl disable service`

Check whether a service is disabled:
`systemctl is-enabled service; echo $?`





