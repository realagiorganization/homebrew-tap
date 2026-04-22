class TetherAutolaunchd < Formula
  include Language::Python::Virtualenv

  desc "CLI and systemd user-service scaffold for local Tether autolaunch and auto-attach."
  homepage "https://github.com/realagiorganization/tether-autolaunchd"
  url "https://github.com/realagiorganization/tether-autolaunchd/releases/download/v0.1.4rc2/tether_autolaunchd-0.1.4rc2.tar.gz"
  sha256 "852fba0fb3032740f910b369ad41afc6c3a7481bf308aac5ab465f5bd562ab7b"
  license "MIT"
  depends_on "python@3.12"

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42/platformdirs-4.9.6.tar.gz"
    sha256 "3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "TAD_TETHER_BIN=tether", shell_output("#{bin}/tether-autolaunchd print-env")
  end
end
