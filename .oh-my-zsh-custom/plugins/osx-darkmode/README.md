# osx-darkmode

This plugin supports switching your terminal apps to Light/Dark mode on macOS based on the OS setting.<br />
It is inspired on [this post by Apostolos Papadopoulos](https://apas.gr/2018/11/dark-mode-macos-safari-iterm-vim/).


To use it add `osx-darkmode` to the plugins array in your zshrc file.
```zsh
plugins=(... osx-darkmode)
```

Natively supported are: 
- [iTerm2](https://www.iterm2.com/)

When the plugin is loaded, it sets the variable `OSX_DARKMODE_STATUS`, which can be used in other [applications](#Apps) as well.<br/>
*Limitation:* Because the mode is set at load time, it will only affect new shells. You can switch 'manually' in the current shell by using the `light` and `dark` aliases.

## Aliases

| Alias  | Command                | Description                                               |
| ------ | -----------------------|---------------------------------------------------------- |
| light  | `_light`               | Force Light mode in this terminal                         |
| dark   | `_dark`                | Force Dark mode in this terminal                          |

## Configuration Variables

| Variable                            | Description                                                                   |
|-------------------------------------|-------------------------------------------------------------------------------|
| **iTerm**                           |                                                                               |
| `OSX_DARKMODE_ITERM_ENABLE`         | Enable for iTerm (default: `false`)                                           |
| `OSX_DARKMODE_ITERM_LIGHT`          | iTerm profile to use for Light mode (default: `Default`)                      |
| `OSX_DARKMODE_ITERM_DARK`           | iTerm profile to use for Dark mode (default: `Dark`)                          |

## Apps
### Vim
I recommend using the [Solarized Colorscheme for Vim](https://github.com/altercation/vim-colors-solarized).<br/>
To enable in [Vim](https://www.vim.org/), add the following to you `.vimrc`:

```
let osx_darkmode_status = $OSX_DARKMODE_STATUS

if osx_darkmode_status == "Dark"
    set background=dark
elseif osx_darkmode_status == "Light"
    set background=light        " Set solarized background color
endif
```