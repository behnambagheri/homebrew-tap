cask "ipinfo" do
  version "1.1.0"
  sha256 "1e79285d3b75758e2780ba128b3fc2c71b7b49a6845f8489eb5a179efbe3636c"

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
    before its first launch.
  EOS
end
