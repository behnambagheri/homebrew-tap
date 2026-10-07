# bea.sh Homebrew tap

Project-maintained Homebrew packages from [behnambagheri](https://github.com/behnambagheri).

## IPinfo for macOS

```sh
brew install --cask behnambagheri/tap/ipinfo
open -a IPinfo
```

For the shorter installation command, add the tap first:

```sh
brew tap behnambagheri/tap
brew install --cask ipinfo
```

IPinfo checks `ip.bea.sh` and `ip.behnam.pro` concurrently. Matching IP, location,
and ASN results show only `ip.bea.sh`; differing results show both. Failed checks
remain visible with an error and never count as a match. Refresh after changing
a VPN or proxy. Supports Apple Silicon and Intel Macs on macOS 13 or later,
with no Node.js, Docker, or local service required.

The initial app release is ad-hoc signed and not Apple-notarized. After a first
launch attempt, macOS may require approval in **System Settings → Privacy &
Security → Open Anyway**. The cask retains standard quarantine checks.

```sh
brew upgrade --cask ipinfo
brew uninstall --cask ipinfo
```

This tap is maintained by the project and is not the official Homebrew cask
repository. The unrelated `brew install ipinfo` formula is a different project.

[App source and build instructions](https://github.com/behnambagheri/ipinfo/tree/v1.0.0/macos)
· [Releases](https://github.com/behnambagheri/ipinfo/releases)

## Maintaining releases

Build and publish a versioned app release from the IPinfo repository. Copy that
release's generated `ipinfo.rb` asset into `Casks/ipinfo.rb`, check its SHA-256
against the published ZIP, validate the cask, then commit and push the update.
Use the published build's checksum, not that of a separate local rebuild.
