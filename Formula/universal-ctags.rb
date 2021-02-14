class UniversalCtags < Formula
  desc "Universal Ctags - a multi-language source code indexing tool"
  homepage "http://ctags.io"
  url "https://github.com/universal-ctags/ctags/archive/0ccd81f6e20ae7f0f0c3c2fe72a8656e9a9b042a.tar.gz"
  version "20210213-2009"
  sha256 "3bce8ad116799ebfc8a51a7b5e86d335bd55e6da4524142087de5fd90ea52ef0"
  license "GPL-2.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "jansson" => :build
  depends_on "jansson"
  depends_on "libxml2" => :build
  depends_on "libxml2"
  depends_on "libyaml" => :build
  depends_on "libyaml"
  depends_on "pkg-config" => :build
  depends_on "docutils" => :build

  conflicts_with "ctags", :because => "universal-ctags is a maintained fork of exuberent-ctags"

  def install
    # ENV.deparallelize

    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--program-prefix=",
                          "--sysconfdir=/etc",
                          "--localstatedir=/var",
                          "--sharedstatedir=/var/lib"

    system "make", "-j2",
                   "V=1",
                   "VERBOSE=1",
                   "install"
  end

  test do
    system "#{bin}/ctags", "--help"
  end
end
