class DiscordCapsCopyPaste < Formula
  desc "Launch a fresh Codex CLI prompt in a random installed terminal and attach it to Discord via Tether."
  homepage "https://github.com/realagiorganization/discord-caps-copy-paste"
  url "https://github.com/realagiorganization/discord-caps-copy-paste/releases/download/v0.1.3/discord-caps-copy-paste-0.1.3-source.tar.gz"
  sha256 "e3fd038621867b58e9d6bd15832f8cf2fab9994b5044635234bc2e640095186d"
  license "MIT"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "Prompt", shell_output("#{bin}/discord-caps-copy-paste --help")
  end
end
