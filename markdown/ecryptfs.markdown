# ECryptfs #

More information [here](https://wiki.archlinux.org/index.php/ECryptfs#Manual_setup)

Add passphrase to the kernel keyring:

```
ecryptfs-add-passphrase
```

To check the already created key:

```
keyctl list @u
```

Configure ecryptfs:

```
mkdir -m 700 ~/.secret ~/.ecryptfs
mkdir -m 500 ~/secret
echo "$HOME/.secret $HOME/secret ecryptfs" > ~/.ecryptfs/secret.conf

# Add the passphrase signature twice (for filename encryption):
echo 78c6f0645fe62da0 > ~/.ecryptfs/secret.sig
echo 78c6f0645fe62da0 >> ~/.ecryptfs/secret.sig
```

Mount the directory:

```
ecryptfs-add-passphrase     # in case the key is not in the keyring
mount.ecryptfs_private secret
```

Umount the directory:

```
umount.ecryptfs_private secret
```

Clear directly the key (not needed after the umount):

```
keyctl clear @u
```
