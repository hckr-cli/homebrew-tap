class Hckr < Formula
  include Language::Python::Virtualenv

  desc "Awesome CLI hack for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/ee/20/202a47fce08644cba4925241afd09d94dace0ae09c464bf9053985b08757/hckr-0.3.0.tar.gz"
  sha256 "920ed99a82f1f3b6deb6f4cc54147e45d226be9a0d8d5a0a202b27f2acfd2dbc"
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
