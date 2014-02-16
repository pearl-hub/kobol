
#  gnome



## Gestione dell'ambiente desktop - gdm

Per avviare l'ambiente desktop:

`startx`
  oppure 
`init 5`
 oppure 
`sudo /etc/init.d/gdm start`


Per chiudere l'ambiente si può usare Ctrl-Alt-Backspace oppure
`/etc/init.d/gdm stop`

o anche cambiare il runlevel
`/sbin/init 3`





## import

Consente di fare screenshot e salvarlo su un file.
Screenshot della finestra principale (root):
`import -window root ~/Scrivania/Screen_$(date '+%d%b%y-%N').png.png`



## gnome-mount

-d /dev/file specifica la partizione da montare sul mountpoint localizzato per default nella cartella /media. E' possibile cambiare mountpoint con l' opzione -m




## gnome-terminal

terminale di gnome. con l'opzione -e Ãš possibile eseguire un comando. Es. gnome-terminal -e "sudo bash --rcfile /etc/profile"





## gconf-editor

consente di gestire tuttoooo l'ambiente desktop. E' possile disabilitare la scrittura su disco (/desktop/gnome/lockdown/disable_save_to_disk)



## autostart Avvio applicazioni

La cartella su cui poter inserire file .desktop da avviare al boot e' ${HOME}/.config/autostart




