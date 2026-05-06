class Hell < Formula
  desc "Lightweight wrapper around uv for running the Hellbox toolchain"
  homepage "https://github.com/hellboxpy/hell"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-apple-darwin"
      sha256 "03f5104d9221174622a0c3e65177da82b4e08fc572e921c499505d449ce01848"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-apple-darwin"
      sha256 "7f66d34bb1a618a842e7bd320e19c94cf84c5a4fd6a410ee958b776c5376f324"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-unknown-linux-musl"
      sha256 "6b0398d41b141de5b37f1c6a88d7ba4237c7a6049395f9e1a49c34fe30ab42c3"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-unknown-linux-musl"
      sha256 "27ad4281c35db4935304a66c57ddee700f963f60a85fd66017fdb0caa1fdc35e"
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
