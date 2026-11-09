# homebrew-tap-opendeck

Homebrew tap for OpenDeck on macOS.

## OpenDeck

[OpenDeck](https://github.com/nekename/OpenDeck) has no official cask. This tap tracks its GitHub releases; a workflow checks for a new release every 12 hours and updates the cask automatically.

```sh
brew tap ChrsCrss/tap-opendeck
brew trust ChrsCrss/tap-opendeck
brew install --cask ChrsCrss/tap-opendeck/opendeck
# --adopt only works if the installed app has the same version as the cask
```

Update by hand with `brew upgrade --cask opendeck`, or automatically with [homebrew-autoupdate](https://github.com/DomT4/homebrew-autoupdate):

```sh
brew tap domt4/autoupdate
brew autoupdate start 43200 --upgrade --cleanup
```

A running OpenDeck keeps running the old version until you restart it. The cask removes the quarantine flag because OpenDeck releases are not notarized.
