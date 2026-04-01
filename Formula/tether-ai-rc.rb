class TetherAiRc < Formula
  include Language::Python::Virtualenv
  desc "Tether release candidate"
  homepage "https://gettether.dev"
  url "https://github.com/Adminrealagi/tether/releases/download/v0.3.5-rc1/tether-ai-rc-v0.3.5-rc1-wheelhouse.tar.gz"
  sha256 "7aa21c45857d153ff91d406ade7dbaa08426256c7db9b20f41f9377de6423c28"
  version "0.3.5-rc1"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-index", "--find-links=#{buildpath}", "tether-ai[discord]==0.3.4"
    bin.install_symlink libexec/"bin/tether" => "tether-rc"
    bin.install_symlink libexec/"bin/tether-mcp" => "tether-mcp-rc"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tether-rc --help")
  end
end
