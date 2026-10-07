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

The same cask includes the command-line tool:

```sh
ipinfo                       # Your IP information from both sources.
ipinfo 1.2.3.4               # A specific IPv4 address.
ipinfo 2606:4700:4700::1111   # A specific IPv6 address.
ipinfo --json 8.8.8.8        # JSON keyed by displayed source.
```

Matching diagnostic results show only the first source; differences and errors
show both. Exit status is 0 for two successful checks, 1 for a failed check,
and 2 for invalid arguments. Shell aliases/functions named `ipinfo` can shadow
the executable; use `command ipinfo` or forward the wrapper to it.

The initial app release is ad-hoc signed and not Apple-notarized. After a first
launch attempt, macOS may require approval in **System Settings → Privacy &
Security → Open Anyway**. The cask retains standard quarantine checks.

```sh
brew upgrade --cask ipinfo
brew uninstall --cask ipinfo
```

This tap is maintained by the project and is not the official Homebrew cask
repository. The unrelated `brew install ipinfo` formula is a different project.

[App source and build instructions](https://github.com/behnambagheri/ipinfo/tree/v1.1.0/macos)
· [Releases](https://github.com/behnambagheri/ipinfo/releases)

## Maintaining releases

Build and publish a versioned app release from the IPinfo repository. Copy that
release's generated `ipinfo.rb` asset into `Casks/ipinfo.rb`, check its SHA-256
against the published ZIP, validate the cask, then commit and push the update.
Use the published build's checksum, not that of a separate local rebuild.
