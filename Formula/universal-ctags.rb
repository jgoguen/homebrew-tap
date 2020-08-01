class UniversalCtags < Formula
  desc "Universal Ctags - a multi-language source code indexing tool"
  homepage "http://ctags.io"
  url "https://github.com/universal-ctags/ctags/archive/3f0ea94c60552fc4983472f6e40e375357093364.tar.gz"
  version "20200729-2009"
  sha256 "39f9242d1426c6a7ae81b30ce355d5351e22746b0e34b2a1e19b859116bf8a32"
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
