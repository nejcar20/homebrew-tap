# nejcar20/homebrew-tap

Homebrew tap for [Yowl](https://dontstealmylaptop.com), a free and open source
menu bar theft alarm for MacBooks.

```bash
brew install --cask nejcar20/tap/yowl
```

To update:

```bash
brew upgrade --cask yowl
```

## Why a tap rather than the main cask repository

Homebrew's [package acceptance policy](https://docs.brew.sh/Package-Acceptance-Policy)
asks a self-submitted project for 90 forks, 90 watchers or 225 stars before it
goes into `homebrew/cask`. Yowl is not there yet. The cask here is the same
file that would be submitted, so moving it over later is a copy rather than a
rewrite.

The app is signed with a Developer ID certificate and notarised by Apple, which
[Homebrew now requires of all casks](https://workbrew.com/blog/homebrew-5-0-0).

## Source

[github.com/nejcar20/yowl](https://github.com/nejcar20/yowl) — MIT.
