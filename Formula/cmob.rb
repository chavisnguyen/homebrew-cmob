class Cmob < Formula
  desc "Watch and control your cmux terminals and coding agents from a phone"
  homepage "https://github.com/chavisnguyen/cmux-mobile"
  version "0.1.0"
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
      url "https://github.com/chavisnguyen/cmux-mobile/releases/download/v0.1.0/cmob-macos-arm64"
      sha256 "af72538b69fcd55f20bb00ecb94297b743450fe921687cf56502710701640eda"
    end
    on_intel do
      url "https://github.com/chavisnguyen/cmux-mobile/releases/download/v0.1.0/cmob-macos-x64"
      sha256 "9ba5c0f8326c9de52bd09397549fbc85a0c4633fddc739163dae06ea5b1b4fb8"
    end
  end

  def install
    asset = Hardware::CPU.arm? ? "cmob-macos-arm64" : "cmob-macos-x64"
    bin.install asset => "cmob"
  end

  def caveats
    <<~EOS
      Next steps, in a terminal inside cmux:
        cmob setup            # one time: autostart + Tailscale Serve
        cmob qr --tailscale   # pair your phone
      Needs the cmux app and Tailscale. Run `cmob status` if anything looks off.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cmob --version")
  end
end
