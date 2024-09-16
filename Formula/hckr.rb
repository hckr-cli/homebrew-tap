class Hckr < Formula
  include Language::Python::Virtualenv

  desc "Awesome CLI hack for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/15/bf/8ddde0fc73fb028c283ba30c79d4b7b5a07ee71e6a000b6d76a3f8e2b2a5/hckr-0.5.0-py3-none-any.whl"
  sha256 "523c2da97876185d0931d45e303584a18d23038ef6964899b2ed35a8cf33def1"
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
