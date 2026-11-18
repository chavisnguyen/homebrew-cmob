class Cmob < Formula
  desc "Watch and control your cmux terminals and coding agents from a phone"
  homepage "https://github.com/chavisnguyen/cmob"
  version "0.1.4"
  license "MIT"

  # This file is generated from packaging/homebrew/cmob.rb.template by the
  # "bump-tap" job of .github/workflows/release.yml on every published Release.
  # Do not edit it by hand.
  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chavisnguyen/cmob/releases/download/v0.1.4/cmob-macos-arm64"
      sha256 "0368265d24f6d9f77c437e073f63d88b919e564b81ec27ac6c1b67a5bb07792c"
    end
    on_intel do
      url "https://github.com/chavisnguyen/cmob/releases/download/v0.1.4/cmob-macos-x64"
      sha256 "4f66b4cd763ba8e7065ce89d30a91a2538cab5e8e2e1f4e859d5a74087f0a96c"
    end
  end

  def install
    asset = Hardware::CPU.arm? ? "cmob-macos-arm64" : "cmob-macos-x64"
    bin.install asset => "cmob"
  end

  def caveats
    <<~EOS
      Next steps, in a terminal inside cmux:
        cmob setup            # one time: token, autostart, gateway
        cmob qr --tailscale   # pair your phone
      Needs the cmux app and Tailscale. Run `cmob status` if anything looks off.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cmob --version")
  end
end
