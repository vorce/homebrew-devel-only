class Mlite < Formula
  desc "Lightweight ML-like language"
  homepage "http://t3x.org/mlite/index.html"

  devel do
    url "http://t3x.org/mlite/mlite-20141229.tgz"
    sha256 "54c24e6703baded5076edefb206985a62ad28c6f9575ed5394cf82284934c65a"
  end

  def install
    system "make", "CC=#{ENV.cc}"
    system "make", "test"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.m").write "len ` iota 1000"
    system "#{bin}/mlite", "-f", "test.m"
  end
end
