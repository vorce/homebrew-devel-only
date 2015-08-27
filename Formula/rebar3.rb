class Rebar3 < Formula
  desc "Erlang build tool"
  homepage "http://www.rebar3.org"

  devel do
    url "https://github.com/rebar/rebar3/archive/beta-2.tar.gz"
    version "3.0.0-beta-2"
    sha256 "0aa014290f5d971206fc79f48d0e3047266e09a6124f044b7e6f7a396b10d831"

    depends_on "erlang"
  end

  def install
    system "./bootstrap"
    bin.install "rebar3"
  end

  test do
    system bin/"rebar3", "--version"
  end
end
