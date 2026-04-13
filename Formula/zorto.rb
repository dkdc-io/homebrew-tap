class Zorto < Formula
  desc "AI-native static site generator (SSG) with executable code blocks"
  homepage "https://zorto.dev"
  url "https://github.com/dkdc-io/zorto/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "f7b3ae8707c50f9ec727a77426d28bce45745fee51802360fcce52725eda46c7"
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
