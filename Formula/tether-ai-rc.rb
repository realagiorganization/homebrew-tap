class TetherAiRc < Formula
  include Language::Python::Virtualenv
  desc "Tether release candidate"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.5-rc3/tether-ai-rc-v0.3.5-rc3-wheelhouse.tar.gz"
  sha256 "ef4dad7700416dce63b15b6b99e746167f4ea9c21cbbeaddefc725f69b948920"
  version "0.3.5-rc3"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-index", "--find-links=#{buildpath}", "tether-ai[discord] @ file://#{buildpath}/tether_ai-0.3.5rc3-py3-none-any.whl"
    bin.install_symlink libexec/"bin/tether" => "tether-rc"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp-rc"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether-rc --help")
  end
end
