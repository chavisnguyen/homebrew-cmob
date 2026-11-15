class Cmob < Formula
  desc "Watch and control your cmux terminals and coding agents from a phone"
  homepage "https://github.com/chavisnguyen/cmob"
  version "0.1.2"
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
      url "https://github.com/chavisnguyen/cmob/releases/download/v0.1.2/cmob-macos-arm64"
      sha256 "4b8562ec2d0113434a9229ade80d852f48202874edad8335b413f82c193d9c86"
    end
    on_intel do
      url "https://github.com/chavisnguyen/cmob/releases/download/v0.1.2/cmob-macos-x64"
      sha256 "06467c45acbf4e2d38f3326679ec0ff83a6852e6b3b61e0fd34330d12af5c824"
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
