# homebrew-cmob

Homebrew tap for [cmob - Cmux Mobile](https://github.com/chavisnguyen/cmux-mobile): watch and control your cmux terminals and coding agents from your phone.

```bash
brew tap chavisnguyen/cmob
brew install cmob
```

Then, in a terminal inside cmux:

```bash
cmob setup            # one time
cmob qr --tailscale   # pair your phone
cmob status
```

Upgrade:

```bash
brew update && brew upgrade cmob
```

The formula is generated automatically on every release of cmux-mobile. Do not edit `Formula/cmob.rb` by hand.
