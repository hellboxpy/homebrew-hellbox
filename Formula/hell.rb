class Hell < Formula
  desc "Lightweight wrapper around uv for running the Hellbox toolchain"
  homepage "https://github.com/hellboxpy/hell"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-apple-darwin"
      sha256 "981eb1c4b07c2c24e185009af135fb45f2e68839eed5b7794c8930853bf7a090"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-apple-darwin"
      sha256 "c9e633c401b1d6734208ec5acb7f77b3818f262bd25006e6cd7378cd88fb8d4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-unknown-linux-musl"
      sha256 "56fe1e61631fa777cdcb4698a5931b434328edc855052de090f61397ec3c95eb"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-unknown-linux-musl"
      sha256 "b7a73ebdabc349acaf346cee4c258dfc916d2459c520deb4e56d51ea03d40715"
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
