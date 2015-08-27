class Shadowvpn < Formula
  desc "Fast, safe VPN based on libsodium"
  homepage "https://shadowvpn.org/"

  devel do
    # The former 0.2.0 tag:
    # http://webcache.googleusercontent.com/search?q=cache:rhtxTpStLTQJ:https://github.com/clowwindy/ShadowVPN/releases+&cd=2&hl=en&ct=clnk&gl=us
    # Requested addition in:
    # https://github.com/Long-live-shadowsocks/ShadowVPN/issues/2
    url "https://github.com/Long-live-shadowsocks/ShadowVPN.git",
      :revision => "bb19e13a4d3cbc4ec25f88bbeeaef5c81edfe3ef"
    version "0.2.0"
  end

  depends_on :tuntap
  depends_on "libtool" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  # Check the below again on the next release.
  depends_on :macos => :mavericks

  def install
    # Conflicts with libsodium, due to shipping internally.
    # Rather than conflict, install in libexec.
    system "./autogen.sh"
    system "./configure", "--prefix=#{libexec}", "--sysconfdir=#{etc}",
                          "--localstatedir=#{var}", "--disable-dependency-tracking"
    system "make", "install"
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    You will also need to correct the tun references in #{etc}/shadowvpn/*.conf
    to fit the tun/tap interface on your system.
    EOS
  end

  test do
    output = shell_output("#{bin}/shadowvpn -h", 1)
    assert_match(/usage: shadowvpn -c config_file/, output)
  end
end
