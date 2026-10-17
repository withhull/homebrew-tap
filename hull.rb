# typed: strict
# frozen_string_literal: true

# Hull installs the platform-specific Hull Code CLI release.
class Hull < Formula
  desc "AI coding agent for the terminal"
  homepage "https://withhull.com"
  version "0.1.4"
  license :cannot_represent

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/withhull/hullcode-releases/releases/download/v0.1.4/hull-darwin-x64.zip"
      sha256 "6753f3db8c95887d783d74e277d086a76c0891c9ec5582e28be1efffbde9b098"
    else
      url "https://github.com/withhull/hullcode-releases/releases/download/v0.1.4/hull-darwin-arm64.zip"
      sha256 "6eeeaadeb31b5a912490e607de8bec812a8dcdccaba2b54e47fbad171b5970ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/withhull/hullcode-releases/releases/download/v0.1.4/hull-linux-x64.tar.gz"
      sha256 "47015fda1463ff27607b11005ea5fe059de0676818af15e18f851385fb38c18a"
    else
      url "https://github.com/withhull/hullcode-releases/releases/download/v0.1.4/hull-linux-arm64.tar.gz"
      sha256 "4370804cf5f19672f1f5ec52c33376fe08984dda2a85eebd81c93d9ba13318fd"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"hull").write_env_script libexec/"hull", HULL_TREE_SITTER_WASM_DIR: libexec/"tree-sitter"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hull --version").strip
  end
end
