class TetherAutolaunchd < Formula
  include Language::Python::Virtualenv

  desc "CLI and systemd user-service scaffold for local Tether autolaunch and auto-attach."
  homepage "https://github.com/realagiorganization/tether-autolaunchd"
  url "https://github.com/realagiorganization/tether-autolaunchd/releases/download/v0.1.0/tether_autolaunchd-0.1.0.tar.gz"
  sha256 "deb1a3c16e77398fced4128e2457495ed3084059e70dfb32bee1e22911c3fe4b"
  license "MIT"
  depends_on "python@3.12"

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/19/56/8d4c30c8a1d07013911a8fdbd8f89440ef9f08d07a1b50ab8ca8be5a20f9/platformdirs-4.9.4.tar.gz"
    sha256 "1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "TAD_TETHER_BIN=tether", shell_output("#{bin}/tether-autolaunchd print-env")
  end
end
