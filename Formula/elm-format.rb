require "language/haskell"

class ElmFormat < Formula
  include Language::Haskell::Cabal
  desc "Elm source code formatter, inspired by gofmt."
  homepage "https://github.com/avh4/elm-format"

  head "https://github.com/avh4/elm-format.git"

  devel do
    url "https://github.com/avh4/elm-format/archive/0.3.0-alpha.tar.gz"
    version "0.3.0-alpha"
    sha256 "b0305b7ea89e7071284dc4a0a16e5013b86ccff2e9e3d47a4b1bb6af535106e6"
  end

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    (buildpath/"elm-format").install Dir["*"]

    # GHC 8 compat
    # Fixes: "cabal: Could not resolve dependencies"
    # Reported 26 May 2016: https://github.com/avh4/elm-format/issues/188
    (buildpath/"cabal.config").write("allow-newer: aeson,base,transformers\n")

    cabal_sandbox do
      cabal_sandbox_add_source "elm-format"
      cabal_install "--only-dependencies", "elm-format"
      cabal_install "--prefix=#{prefix}", "elm-format"
    end
  end

  test do
    src_path = testpath/"Hello.elm"
    src_path.write <<-EOS.undent
      import Html exposing (text)
      main = text "Hello, world!"
    EOS

    system bin/"elm-format", testpath/"Hello.elm", "--yes"
  end
end
