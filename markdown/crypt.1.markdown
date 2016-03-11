# Cryptography #

## Password stored in Linux ##

Hash passwords are stored in */etc/shadow* file.
Each line contains the information separated by *:*:

- Username
- Hash password
- Last password change in days since 1 Jan 1970
- The minimum number of days required between password changes
- The maximum number of days the password is valid
- The number of days before password is to expire that user is warned
- The number of days after password expires that account is disabled
- Days since Jan 1, 1970 that account is disabled 

###Hash Password###

The Hash password is comprised of three different fields separated by *$*:

- Chars representing cryptographic hashing mechanism used

```
  - $1$  md5
  - $2a$ Blowfish
  - $2y$ Blowfish, with correct handling of 8 bit characters
  - $5$  sha-256
  - $6$  sha-512
```

- A randomly generated salt
- The hash resulting by combining the password, salt with the hashing mechanism

To get the hash password from the plain one:

- Using mkpasswd:

    `mkpasswd --method=sha-512 --salt=vb1tLY1qiY PASSWORD`

- Using python:

    `import crypt`
    `crypt.crypt('PASSWORD', '$6$vb1tLY1qiY')`

- Using openssl (only for md5):

    `openssl passwd -salt saltvalue -1`
