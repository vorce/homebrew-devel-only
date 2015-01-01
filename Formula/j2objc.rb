class J2objc < Formula
  homepage "http://j2objc.org/"
  url "https://github.com/google/j2objc/releases/download/0.9.5/j2objc-0.9.5.zip"
  sha1 "6b53c2b47c9cd4c6678d0fee75b00039b83fc120"

  depends_on :xcode
  depends_on :macos => :mavericks
  depends_on :java => "1.7"

  def install
    # Building from source is a nightmare right now, so use the shipped binaries.
    # It doesn't ship with a bin folder, so script things instead to avoid tantrum.
    prefix.install_metafiles
    libexec.install Dir["*"]

    bin.write_exec_script libexec/"cycle_finder"
    bin.write_exec_script libexec/"j2objc"
    bin.write_exec_script libexec/"j2objcc"
  end

  test do
    system "#{bin}/j2objc", "-h"
  end
end
