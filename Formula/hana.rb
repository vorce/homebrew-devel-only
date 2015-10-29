class Hana < Formula
  desc "The Boost.Hana C++14 metaprogramming library"
  homepage "https://github.com/boostorg/hana"
  head "https://github.com/boostorg/hana.git", :branch => "develop"

  devel do
    url "https://github.com/boostorg/hana/archive/v0.5.0.tar.gz"
    sha256 "4c712a0ea08c4142b682c2bd4603db0cd64de2634c2e2487d19c9e8e043ca966"
  end

  depends_on "cmake" => :build
  depends_on :macos => :yosemite

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include <boost/hana.hpp>

      constexpr auto xs = boost::hana::make_tuple(1, '2', 3.3);
      static_assert(xs[boost::hana::size_c<0>] == 1, "");
      static_assert(xs[boost::hana::size_c<1>] == '2', "");
      static_assert(xs[boost::hana::size_c<2>] == 3.3, "");

      int main() { }
    EOS

    system ENV.cxx, "test.cpp", "-std=c++1y", "-I#{include}", "-otest", *ENV.cppflags
    system "./test"
  end
end
