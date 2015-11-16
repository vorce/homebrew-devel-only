class Rebar3 < Formula
  desc "Erlang build tool"
  homepage "http://www.rebar3.org"

  devel do
    # We cannot use tar/zip file.
    # It needs git repository for versioning at bootstrap.
    url "https://github.com/rebar/rebar3.git",
        :tag => "beta-4",
        :revision => "356ac5033d12b8b91ed0d6c4d308b00070ab12b9"
    version "3.0.0-beta-4"

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
