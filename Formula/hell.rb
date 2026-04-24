class Hell < Formula
  desc "Lightweight wrapper around uv for running the Hellbox toolchain"
  homepage "https://github.com/hellboxpy/hell"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-apple-darwin"
      sha256 "ba3223fa5e10b063edfa9a694af5455d906a34d690c11897fab4d4000a937bda"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-apple-darwin"
      sha256 "631c9d948710eaac8b3728ab5c3996e1d887bb448d20cc201512e8c8982db40e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-unknown-linux-musl"
      sha256 "5eb1520f1d77ca00e1d3647366436f8d8815306af1193fa8d2a6ba519dfff207"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-unknown-linux-musl"
      sha256 "e2291b9770fbaa94361223d904b5041c30fb97b48e53e46244ad7d531e0e71da"
    end
  end

  def install
    os   = OS.mac? ? "apple-darwin" : "unknown-linux-musl"
    arch = Hardware::CPU.intel? ? "x86_64" : "aarch64"
    bin.install "hell-#{arch}-#{os}" => "hell"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hell environment 2>&1")
  end
end
