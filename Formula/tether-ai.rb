class TetherAi < Formula
  include Language::Python::Virtualenv
  desc "Tether self-contained package"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.7-rc3/tether-ai-v0.3.7-rc3-wheelhouse.tar.gz"
  sha256 "4cd6f503f289d638b99a8332b4f9785c73776b38d8b0f95f863082aff626c102"
  version "0.3.7-rc3"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--find-links=#{buildpath}", "tether-ai[discord] @ file://#{buildpath}/tether_ai-0.3.7rc3-py3-none-any.whl"
    bin.install_symlink libexec/"bin/tether" => "tether"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether --help")
  end
end
