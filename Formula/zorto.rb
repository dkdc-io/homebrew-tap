class Zorto < Formula
  desc "AI-native static site generator (SSG) with executable code blocks"
  homepage "https://zorto.dev"
  url "https://github.com/dkdc-io/zorto/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "a3faf3081c8c568d0db8e1bcf669cb523b5c0c4f8984d590d2cba584e821f8cb"
  license "MIT"
  head "https://github.com/dkdc-io/zorto.git", branch: "main"

  depends_on "rust" => :build
  depends_on "python@3.14"

  def install
    ENV["PYO3_PYTHON"] = Formula["python@3.14"].opt_bin/"python3.14"
    system "cargo", "install", *std_cargo_args(path: "crates/zorto-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zorto --version")
  end
end
