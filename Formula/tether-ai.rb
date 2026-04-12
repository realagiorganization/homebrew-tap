class TetherAi < Formula
  include Language::Python::Virtualenv
  desc "Tether self-contained package"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.7-rc6/tether-ai-v0.3.7-rc6-wheelhouse.tar.gz"
  sha256 "3cae161c50623f02a584811a89305b220643ea600a987984efad5be95140a410"
  version "0.3.7-rc6"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--find-links=#{buildpath}", "tether-ai[discord] @ file://#{buildpath}/tether_ai-0.3.7rc6-py3-none-any.whl"
    bin.install_symlink libexec/"bin/tether" => "tether"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether --help")
  end
end
