# Dotfiles

images from source for this repo!
![dofiles](http://dotshare.it/public/images/uploads/8372.png)
![dofiles](http://dotshare.it/public/images/uploads/8287.png)
![dofiles](http://dotshare.it/public/images/uploads/8371.png)

## Install

Fetch dotfiles from github:

```
git clone https://github.com/trepnick/dotfiles ~/.dotfiles
```

Manually install files:

```
stow vim
```

Automatic install:

```
for d in $(ls -d */ | cut -f1 -d '/');
do
    ( stow "$d"  )
done
```
