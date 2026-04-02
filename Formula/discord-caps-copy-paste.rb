class DiscordCapsCopyPaste < Formula
  desc "Launch a fresh Codex CLI prompt in a random installed terminal and attach it to Discord via Tether."
  homepage "https://github.com/realagiorganization/discord-caps-copy-paste"
  url "https://github.com/realagiorganization/discord-caps-copy-paste/releases/download/v0.1.1/discord-caps-copy-paste-0.1.1-source.tar.gz"
  sha256 "35ca074fc864d06318b22154226225907a47b577c4a8bb525dc22f1210278a81"
  license "MIT"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "."), "--locked"
  end

  test do
    assert_match "Prompt", shell_output("#{bin}/discord-caps-copy-paste --help")
  end
end
