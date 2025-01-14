class Dcfldd < Formula
  desc "Enhanced version of dd for forensics and security"
  homepage "https://dcfldd.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/dcfldd/dcfldd/1.3.4-1/dcfldd-1.3.4-1.tar.gz"
  sha256 "f5143a184da56fd5ac729d6d8cbcf9f5da8e1cf4604aa9fb97c59553b7e6d5f8"
  license "GPL-2.0-or-later"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "0a1e4bce6c8af34771e2f96e5c15f22f90388a39a7f44022e9efd51e4b007a94"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "985ab7c04a8b19079d969c4984327bd680cf4e03d9352816201c6d0808270e75"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "0467bb8c411c332e45b3dc5c5cfa82a0ee98d7d3c53e73357306986f81cd5b53"
    sha256 cellar: :any_skip_relocation, ventura:        "96920378fc450ebd2f65cb63a78aebadc19356a4af7f60c11266876b306a0215"
    sha256 cellar: :any_skip_relocation, monterey:       "1ef108ea64574e6434232a84245ec5993c4a88667c76e4e4ea29950b6797814b"
    sha256 cellar: :any_skip_relocation, big_sur:        "e9355a9c6885f7c22087b05988e99e5fcf563c1bcd9856ee5de0d207e1dfa54e"
    sha256 cellar: :any_skip_relocation, catalina:       "17bf5e7a79a3453103e9fd5a70f0b12d49c93c5302a6ada8bd021ca918979992"
    sha256 cellar: :any_skip_relocation, mojave:         "63b3928acc96ad685b064fa3de4f44c4b96d1cbb610d4ea8b7c205a41385a4e7"
    sha256 cellar: :any_skip_relocation, high_sierra:    "95b0c080c543745a3a81751cc175fb99a1b75a7e124518d8e5d3337b76a97e72"
    sha256 cellar: :any_skip_relocation, sierra:         "0958d948042f047d4249a7400f8c4f7adfe41f11c20aa04a0dbaac09c718ea2a"
    sha256 cellar: :any_skip_relocation, el_capitan:     "0d5ff357d74fa90a97d80e202ddb5b5554bfec35efa2c4cb6e0f7e6dc9cf8ece"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "319e81385163d7cda46d9000f62a1b28a4c750513a30a3f33cb9fd3ac02895b1"
  end

  def install
    # Workaround for Xcode 14.3
    if DevelopmentTools.clang_build_version >= 1403
      ENV.append_to_cflags "-Wno-implicit-function-declaration -Wno-implicit-int"
    end

    system "./configure", "--mandir=#{man}", *std_configure_args
    system "make", "install"
  end

  test do
    system bin/"dcfldd", "--version"
  end
end
