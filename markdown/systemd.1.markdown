
-  systemd


## system

To boot the system:
`systemctl reboot`

To poweroff the system:
`sudo systemctl poweroff`

Analyze the boot time in msec:
`systemd-analyze`

Ordered list of units sortex by init time:
`systemd-analyze blame`

Plot a graph of init time:
`systemd-analyze plot`



## system-log

BEST COMMAND:
Show log from this boot for a specific unit:

`journatlctl -xn -b -u UNITNAME`


Follow new messages:

`journalctl -f`


BOOT:
Shows messages from the current boot:

`journalctl -b -0`

From the previous boot:

`journalctl -b -1`


Show all messages by a specific process:

`journalctl _PID=1`


Create a text file for the log:
`journalctl -a > read_log.txt`

Get log a specific unit:
`journalctl _SYSTEMD_UNIT=systemd-logind.service`




## services

List of services:
`systemctl`

List of active and non active services:
`systemctl list-unit-files`

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





