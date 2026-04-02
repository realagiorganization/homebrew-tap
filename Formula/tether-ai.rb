class TetherAi < Formula
  include Language::Python::Virtualenv
  desc "Tether self-contained package"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.7-rc1/tether-ai-v0.3.7-rc1-wheelhouse.tar.gz"
  sha256 "ecf82818a9720dbbacf48790c43fe2ad8a5bc642eae128569625eb377a8aed78"
  version "0.3.7-rc1"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--find-links=#{buildpath}", "tether-ai[discord] @ file://#{buildpath}/tether_ai-0.3.7rc1-py3-none-any.whl"
    bin.install_symlink libexec/"bin/tether" => "tether"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether --help")
  end
end
