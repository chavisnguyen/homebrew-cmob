class Cmob < Formula
  desc "Watch and control your cmux terminals and coding agents from a phone"
  homepage "https://github.com/chavisnguyen/cmob"
  version "0.1.9"
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
      url "https://github.com/chavisnguyen/cmob/releases/download/v0.1.9/cmob-macos-arm64"
      sha256 "6980fed46bdd7cb3549622b820d0a63968c7f04efd499871a5b511041a6c44b5"
    end
    on_intel do
      url "https://github.com/chavisnguyen/cmob/releases/download/v0.1.9/cmob-macos-x64"
      sha256 "924d011651bd5c7ad90f44e28baec1bf4d140cafbe49d47f98d6c9bf4e317f89"
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
