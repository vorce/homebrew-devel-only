class Shadowvpn < Formula
  homepage "https://shadowvpn.org/"
  url "https://github.com/clowwindy/ShadowVPN/releases/download/0.1.5/shadowvpn-0.1.5.tar.gz"
  sha256 "dcfabac906730fcc1439a14eab1d4bcf553450981df695b6974c83b13e5f5987"

  depends_on :tuntap

  def install
    # Conflicts with libsodium, due to shipping internally. libexec it all.
    system "./configure", "--prefix=#{libexec}", "--sysconfdir=#{etc}",
                          "--localstatedir=#{var}", "--disable-dependency-tracking"
    system "make", "install"
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    Running the executable currently requires sudo.
    If you aren't root, you cannot use the binary at this point in time.

    You will also need to correct the tun references in #{etc}/shadowvpn/*.conf
    to fit the tun/tap interface on your system.
    EOS
  end

  test do
    output = shell_output("#{bin}/shadowvpn -h; true")
    assert output.include?("usage: shadowvpn -c config_file [-s start/stop/restart]")
  end
end
