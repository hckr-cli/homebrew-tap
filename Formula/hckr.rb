class Hckr < Formula
  include Language::Python::Virtualenv

  desc "Awesome CLI hack for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/01/3f/525f57e9e3cdcc91383e0f3106b3003a8b7bc5ab1aa3b6c90ffbdf526647/hckr-0.2.5.tar.gz"
  sha256 "ec4fd367818f26a459bd98db04b49f985800a45716a1f1a5678a202e2aadcc80"
  license "MIT"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "pip"
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/hckr"
  end

  test do
    (testpath/"foo.txt").write("Nobody inspects the spammish repetition\n")
    assert_match "SHA1: 55cd84c899a3d9f41d5a4d1be4ac57b37551db00",
                 shell_output("#{bin}/hckr hash sha1 -f #{testpath}/foo.txt")
  end
end
