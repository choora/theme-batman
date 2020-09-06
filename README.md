<img src="https://camo.githubusercontent.com/6d5df21bea6143af7a37e1284fe110df1ab9edb6/68747470733a2f2f63646e2e7261776769742e636f6d2f6f682d6d792d666973682f6f682d6d792d666973682f653466316332653032313961313765326337343862383234303034633864306233383035356331362f646f63732f6c6f676f2e737667" align="left" width="144px" height="144px"/>

#### Magenta

> A [Oh My Fish][omf-link] theme modified from [Batman][batman-link] especially for Deepin Terminal light theme.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-%E2%89%A5v2.2.0-007EC7.svg)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg)][omf-link]

<br/>

## Screenshot

<img src="http://ww1.sinaimg.cn/large/005H05ODgy1gi7ubmoo05j30zq0la41y.jpg" align="center"/>

## Installation

Since this theme has not been added to Oh My Fish official repository, it's recommanded to register it using Oh My Fish commands manually.

Firstly, clone this Git repository:

```shell
git clone https://github.com/choora/omf-theme-magenta
```

Then, make a symbolic link to `$OMF_PATH/theme/`. In most case, `$OMF_PATH` is `~/.local/share/omf` by default.

```shell
ln -s /path/to/omf-theme-magenta $OMF_PATH/theme/magenta
```

Finally, you can switch to magenta theme easily by typing:

```shell
omf theme magenta
```

## Differences

- `$HOME` directory abbreviated to `~`
- Path to current working directory is *not* abbreviated. (more friendly to Chinese users)
- Arrow symbol `>>>` becomes red if last `$status` was `!= 0`
- Display exit status for non zero codes
- ~~`^` character denotes the current repository has stashed changes~~
- `*` character denotes the current repository is dirty
- Display current branch
- Display number of commits in relation to the current branch
- Display current time
- ~~Batman inspired colors.~~

## Settings

**Abbreviated current path**

In `fish_prompt.fish` file, replace `pwd` with `prompt_pwd`:

```shell
#set -l pwd (prompt_pwd)
set -l pwd (pwd)
```

**No greeting**

In your Oh My Fish `init.fish` (or any other fish shell config file), add 2 lines:

```shell
function fish_greeting
end
```

or simply edit `fish_greeting.fish` file in this repo.

# License

[MIT][mit] © Jorge Bucaran and et [at][omf-contributors] (Batman)
[MIT][mit] © Choora (Magenta)

[batman-link]: https://github.com/oh-my-fish/theme-batman
[mit]: http://opensource.org/licenses/MIT
[omf-link]: https://www.github.com/oh-my-fish/oh-my-fish
[omf-contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors
