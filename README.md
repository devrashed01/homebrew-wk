# Homebrew tap for wk

[wk](https://devrashed01.github.io/wk/) is a macOS menu-bar app and CLI for git worktrees and Claude Code sessions.

```sh
brew tap devrashed01/wk
brew trust devrashed01/wk
brew install --cask wk
```

Recent Homebrew versions only install from a third-party tap after you trust it, which is what the second line does.

This installs `Wk.app` and puts the `wk` command on your PATH. To update later:

```sh
brew upgrade --cask wk
```

The app is signed but not notarized, so the cask removes the quarantine flag after installing. Source and releases: [devrashed01/wk](https://github.com/devrashed01/wk).
