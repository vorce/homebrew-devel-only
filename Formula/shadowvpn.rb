class Shadowvpn < Formula
  desc "Fast, safe VPN based on libsodium"
  homepage "https://shadowvpn.org/"

  devel do
    url "https://github.com/clowwindy/ShadowVPN/releases/download/0.1.7/shadowvpn-0.1.7.tar.gz"
    sha256 "e95d0cb7b4ce5489ec9392acb57af7cb4ccfe6f9dc87e0f2937006ec3cabfb03"
  end

  depends_on :tuntap
  # Check the below again on the next release.
  depends_on :macos => :mavericks

  def install
    # Conflicts with libsodium, due to shipping internally.
    # Rather than conflict, install in libexec.
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
    output = shell_output("#{bin}/shadowvpn -h; true")
    assert_match /usage: shadowvpn -c config_file/, output
  end
end
