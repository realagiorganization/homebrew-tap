class TetherAiRc < Formula
  include Language::Python::Virtualenv
  desc "Tether release candidate"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.5-rc4/tether-ai-rc-v0.3.5-rc4-wheelhouse.tar.gz"
  sha256 "2adee01cf52e2f9fb071a81691b03a7c9ee75ac9d5f612850da28cba20cd7dde"
  version "0.3.5-rc4"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--find-links=#{buildpath}", "tether-ai[discord] @ file://#{buildpath}/tether_ai-0.3.5rc4-py3-none-any.whl"
    bin.install_symlink libexec/"bin/tether" => "tether-rc"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp-rc"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether-rc --help")
  end
end
