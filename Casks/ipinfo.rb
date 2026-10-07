cask "ipinfo" do
  version "1.2.0"
  sha256 "79710b8e98e54a97118aa151dfa3bb3f2c2456bf9bd833f645a411ab02306e88"

  url "https://github.com/behnambagheri/ipinfo/releases/download/v#{version}/IPinfo-#{version}-universal.zip"
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
