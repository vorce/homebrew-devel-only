require "language/go"

class DockerMachine < Formula
  homepage "https://github.com/docker/machine"

  devel do
    url "https://github.com/docker/machine/archive/0.0.2.tar.gz"
    sha1 "adcc7128abdbaae60ba3c58d6485df939c7e5510"
  end

  head "https://github.com/docker/machine.git"

  depends_on "go" => :build
  depends_on :hg => :build

  go_resource "github.com/Sirupsen/logrus" do
    url "https://github.com/Sirupsen/logrus.git",
      :revision => "d2f9ffa1d9cf25b25191b221229effac1b6de526"
    sha1 "6bea8782b80870e25c52f7b00bf979c5480bc389"
  end

  go_resource "github.com/codegangsta/cli" do
    url "https://github.com/codegangsta/cli.git",
      :revision => "bf4a526f48af7badd25d2cb02d587e1b01be3b50"
    sha1 "e690eecdeacefa4d28a5c7530e528ed8bfe8d381"
  end

  go_resource "github.com/docker/libtrust" do
    url "https://github.com/docker/libtrust.git",
      :revision => "1dc3c57f6be6c80ea80441e6fb11b320f6da8a6a"
    sha1 "7ecf67aeab864a54869b8f9b7da97e50d678d0f8"
  end

  go_resource "github.com/smartystreets/go-aws-auth" do
    url "https://github.com/smartystreets/go-aws-auth.git",
      :revision => "1f0db8c0ee6362470abe06a94e3385927ed72a4b"
    sha1 "e3593081ca0a12ff968d06232256f9bb9e7fb0c0"
  end

  go_resource "github.com/MSOpenTech/azure-sdk-for-go" do
    url "https://github.com/MSOpenTech/azure-sdk-for-go.git",
      :revision => "5c339391be6b347eccb2addcb779d38940db5b44"
    sha1 "13b94c4fd4c6ac8f6326c4c8d52268317625bb2b"
  end

  go_resource "github.com/docker/docker" do
    url "https://github.com/docker/docker.git",
      :revision => "de9783980be2a7b3ca10eb8183ea5989acbd3e7e"
    sha1 "591c500625fbb426a041fdff045c2e4b9586c228"
  end

  go_resource "code.google.com/p/goauth2" do
    url "https://code.google.com/p/goauth2",
      :revision => "afe77d958c70", :using => :hg
  end

  go_resource "github.com/digitalocean/godo" do
    url "https://github.com/digitalocean/godo.git",
      :revision => "c467db591ad9218663c089428955f2fad88a0b57"
    sha1 "11398e6c2f7e906fa873ed4fc5a78c7600051157"
  end

  go_resource "github.com/google/go-querystring" do
    url "https://github.com/google/go-querystring.git",
      :revision => "d8840cbb2baa915f4836edda4750050a2c0b7aea"
    sha1 "50f5d210a166c0d5208888669636225d56c94f47"
  end

  go_resource "github.com/tent/http-link-go" do
    url "https://github.com/tent/http-link-go.git",
      :revision => "ac974c61c2f990f4115b119354b5e0b47550e888"
    sha1 "02c0cf2c1eabe256dfbfde5fa22016232125b148"
  end

  go_resource "google.golang.org/api" do
    url "https://github.com/google/google-api-go-client.git",
      :revision => "aa91ac681e18e52b1a0dfe29b9d8354e88c0dcf5"
    sha1 "9ce4b47192ac50b1f05d242694a114f52f04f7e0"
  end

  go_resource "github.com/vmware/govcloudair" do
    url "https://github.com/vmware/govcloudair.git",
      :revision => "9672590d5e5795b2d29fce97084fd5810665fc27"
    sha1 "542ed2cf2df456d2876010dc0cede0d50f185621"
  end

  go_resource "github.com/mitchellh/go-homedir" do
    url "https://github.com/mitchellh/go-homedir.git",
      :revision => "7d2d8c8a4e078ce3c58736ab521a40b37a504c52"
  end

  def install
    ENV["GOPATH"] = buildpath
    host = "github.com"
    org_name = "docker"
    repo_name = "machine"

    mkdir_p buildpath/"src/#{host}/#{org_name}"
    ln_s buildpath, buildpath/"src/#{host}/#{org_name}/#{repo_name}"

    Language::Go.stage_deps resources, buildpath/"src"

    bin_name = "docker-machine"
    system "go", "build", "-o", bin_name
    bin.install bin_name
  end

  test do
    output = shell_output("#{bin}/docker-machine ls")
    assert output.include? "NAME   ACTIVE   DRIVER   STATE   URL"
  end
end
