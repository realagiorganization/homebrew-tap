class DiscordCapsCopyPaste < Formula
  desc "Launch a fresh Codex CLI prompt in a random installed terminal and attach it to Discord via Tether."
  homepage "https://github.com/realagiorganization/discord-caps-copy-paste"
  url "https://github.com/realagiorganization/discord-caps-copy-paste/releases/download/v0.1.2/discord-caps-copy-paste-0.1.2-source.tar.gz"
  sha256 "3e0737c10da2833af6e89110326d94172588555dffd11cc87bbec3ac9371fb21"
  license "MIT"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "."), "--locked"
  end

  test do
    assert_match "Prompt", shell_output("#{bin}/discord-caps-copy-paste --help")
  end
end
