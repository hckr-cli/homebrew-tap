class Hckr < Formula
  include Language::Python::Virtualenv

  desc "Awesome CLI hack for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/38/39/c411253dcdd76aeede04c3e91fa95c155629f48462ea631710aa80bca8cb/hckr-0.4.0.tar.gz"
  sha256 "d73a3c9aa1a1f5b66979bbd58754d0218b9c28652600689bd2d71660b59d70d5"
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
