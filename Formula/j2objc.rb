class J2objc < Formula
  desc "Command-line tool to translate Java to Objective-C"
  homepage "http://j2objc.org/"

  devel do
    url "https://github.com/google/j2objc/releases/download/0.9.8.1/j2objc-0.9.8.1.zip"
    sha256 "3edff65fbfaa0a99fdb36dad97059070ba09b77ace7753573771204395dd862b"
  end

  depends_on :xcode
  depends_on :macos => :mavericks
  depends_on :java => "1.7+"

  def install
    # Building from source is a nightmare right now, so use the shipped binaries.
    # It doesn't ship with a bin folder, so script things instead to avoid tantrum.
    libexec.install Dir["*"]

    bin.write_exec_script libexec/"cycle_finder"
    bin.write_exec_script libexec/"j2objc"
    bin.write_exec_script libexec/"j2objcc"
    bin.write_exec_script libexec/"j2objc_protoc"
    man1.install_symlink Dir["#{libexec}/man/man1/*.1"]
  end

  test do
    system "#{bin}/j2objc", "-h"
  end
end
