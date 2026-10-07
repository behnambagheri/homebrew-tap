cask "ipinfo" do
  arch arm: "arm64", intel: "universal"

  version "1.2.1"
  sha256 arm: "55ab533f8ca4d4dc2268bfd41e4d2e7239e312a7bf5cac5a0ab401a178fe34c5", intel: "86cd28ea589bf0581586a12aff38e23ddea9c88bb4147da741c1f777e1851023"

  url "https://github.com/behnambagheri/ipinfo/releases/download/v#{version}/IPinfo-#{version}-#{arch}.zip"
  name "IPinfo"
  desc "Compare IP and network diagnostics from two services"
  homepage "https://github.com/behnambagheri/ipinfo"

  depends_on macos: :ventura

  app "IPinfo.app"
  binary "#{appdir}/IPinfo.app/Contents/Helpers/ipinfo"

  uninstall quit: "sh.bea.ipinfo"

  caveats <<~EOS
    This release is ad-hoc signed and is not Apple-notarized.
    macOS may require approval in System Settings > Privacy & Security
    > Open Anyway before its first launch.

    If macOS blocks the app and you trust this download, you can remove its
    download quarantine attribute in Terminal:
      sudo /usr/bin/xattr -r -d com.apple.quarantine "#{appdir}/IPinfo.app"
      open "#{appdir}/IPinfo.app"
  EOS
end
