cask "ipinfo" do
  arch arm: "arm64", intel: "universal"

  version "1.2.2"
  sha256 arm: "287377bb87d01ff889a9a5b9d570b8ba7c4c444ed47dac2590b1a9d6180fab81", intel: "1e1ea9d835029effcd74047db17eedecced58f36efb67e96689dd5c4de95ce18"

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
