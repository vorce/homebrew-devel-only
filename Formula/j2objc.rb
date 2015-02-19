class J2objc < Formula
  homepage "http://j2objc.org/"

  devel do
    url "https://github.com/google/j2objc/releases/download/0.9.6.1/j2objc-0.9.6.1.zip"
    sha1 "e4688c50adc169599b01789b3e6ee9d8c750092a"
  end

  depends_on :xcode
  depends_on :macos => :mavericks
  depends_on :java => "1.7+"

  def install
    # Building from source is a nightmare right now, so use the shipped binaries.
    # It doesn't ship with a bin folder, so script things instead to avoid tantrum.
    prefix.install_metafiles
    libexec.install Dir["*"]

    bin.write_exec_script libexec/"cycle_finder"
    bin.write_exec_script libexec/"j2objc"
    bin.write_exec_script libexec/"j2objcc"
    man1.install_symlink libexec/"man/man1/j2objc.1"
    man1.install_symlink libexec/"man/man1/j2objcc.1"
  end

  test do
    system "#{bin}/j2objc", "-h"
  end
end
