class TetherAiRc < Formula
  include Language::Python::Virtualenv
  desc "Tether release candidate"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.4-rc2/tether-ai-rc-v0.3.4-rc2-wheelhouse.tar.gz"
  sha256 "9edee515a31d504c5243e258d2e99e769197820c68747cbea0c2a489e0a00844"
  version "0.3.4-rc2"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--find-links=#{buildpath}", "tether-ai[discord] @ file://#{buildpath}/tether_ai-0.3.4-py3-none-any.whl"
    bin.install_symlink libexec/"bin/tether" => "tether-rc"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp-rc"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether-rc --help")
  end
end
