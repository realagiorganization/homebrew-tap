class AgentSessionsRc < Formula
  include Language::Python::Virtualenv
  desc "agent-sessions release candidate"
  homepage "https://github.com/larsderidder/agent-sessions"
  url "https://github.com/Adminrealagi/agent-sessions/releases/download/v0.2.1-rc2/agent-sessions-rc-v0.2.1-rc2-wheelhouse.tar.gz"
  sha256 "001f81789d15c3d0b934c270a209f794613fc61c549f1ce3abd06028178de93e"
  version "0.2.1-rc2"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--find-links=#{buildpath}", "agent-sessions @ file://#{buildpath}/agent_sessions-0.2.1-py3-none-any.whl"
    bin.install_symlink libexec/"bin/agent-sessions" => "agent-sessions-rc"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/agent-sessions-rc --help")
  end
end
