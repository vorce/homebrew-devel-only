class Rebar3 < Formula
  desc "Erlang build tool"
  homepage "http://www.rebar3.org"

  devel do
    # We cannot use tar/zip file.
    # It needs git repository for versioning at bootstrap.
    url "https://github.com/rebar/rebar3.git",
        :tag => "3.0.0-beta.3",
        :revision => "4177c75a7c709b615962b1a885c119a51ed0aab0"

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
