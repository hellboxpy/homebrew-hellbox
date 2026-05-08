class Hell < Formula
  desc "Lightweight wrapper around uv for running the Hellbox toolchain"
  homepage "https://github.com/hellboxpy/hell"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-apple-darwin"
      sha256 "8236a70c29a5a212f7a5b4947d471d5b3993c5c90d11765a899b137d7d038b26"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-apple-darwin"
      sha256 "5ff1ea19f23319dc47f1a928f2e8483e759f7cf5514a7eb1ac5e4ad4e9f05b6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-aarch64-unknown-linux-musl"
      sha256 "655a649c93d8ccab68d6b94a0bb03e80989cede04b75103fe271c7beab2404d0"
    end
    on_intel do
      url "https://github.com/hellboxpy/hell/releases/download/v#{version}/hell-x86_64-unknown-linux-musl"
      sha256 "e34626be7f016864df3ce1c540f7095dd29db193053cc3114fdbc52fc6126eff"
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
