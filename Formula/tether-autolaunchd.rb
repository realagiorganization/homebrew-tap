class TetherAutolaunchd < Formula
  include Language::Python::Virtualenv

  desc "CLI and systemd user-service scaffold for local Tether autolaunch and auto-attach."
  homepage "https://github.com/realagiorganization/tether-autolaunchd"
  url "https://github.com/realagiorganization/tether-autolaunchd/releases/download/v0.1.4rc1/tether_autolaunchd-0.1.4rc1.tar.gz"
  sha256 "3b127a5d9c29556f1b7ba0d2e408ed1d9a69b03b21a195828289c2e9443eb14f"
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
