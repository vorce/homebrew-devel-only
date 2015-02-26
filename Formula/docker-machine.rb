require "language/go"

class DockerMachine < Formula
  homepage "https://github.com/docker/machine"

  devel do
    url "https://github.com/docker/machine/archive/v0.1.0.tar.gz"
    version "0.1.0"
    sha1 "fa151f80e126a43cb9b466b21c83d2a2002b1ea0"
  end

  head "https://github.com/docker/machine.git"

  depends_on "go" => :build
  depends_on :hg => :build

  go_resource "github.com/Sirupsen/logrus" do
    url "https://github.com/Sirupsen/logrus.git",
      :revision => "d2f9ffa1d9cf25b25191b221229effac1b6de526"
  end

  go_resource "github.com/codegangsta/cli" do
    url "https://github.com/codegangsta/cli.git",
      :revision => "bf4a526f48af7badd25d2cb02d587e1b01be3b50"
  end

  go_resource "github.com/docker/libtrust" do
    url "https://github.com/docker/libtrust.git",
      :revision => "1dc3c57f6be6c80ea80441e6fb11b320f6da8a6a"
  end

  go_resource "github.com/smartystreets/go-aws-auth" do
    url "https://github.com/smartystreets/go-aws-auth.git",
      :revision => "1f0db8c0ee6362470abe06a94e3385927ed72a4b"
  end

  go_resource "github.com/MSOpenTech/azure-sdk-for-go" do
    url "https://github.com/MSOpenTech/azure-sdk-for-go.git",
      :revision => "5c339391be6b347eccb2addcb779d38940db5b44"
  end

  go_resource "github.com/docker/docker" do
    url "https://github.com/docker/docker.git",
      :revision => "de9783980be2a7b3ca10eb8183ea5989acbd3e7e"
  end

  go_resource "code.google.com/p/goauth2" do
    url "https://code.google.com/p/goauth2",
      :revision => "afe77d958c70", :using => :hg
  end

  go_resource "github.com/digitalocean/godo" do
    url "https://github.com/digitalocean/godo.git",
      :revision => "c467db591ad9218663c089428955f2fad88a0b57"
  end

  go_resource "github.com/google/go-querystring" do
    url "https://github.com/google/go-querystring.git",
      :revision => "d8840cbb2baa915f4836edda4750050a2c0b7aea"
  end

  go_resource "github.com/tent/http-link-go" do
    url "https://github.com/tent/http-link-go.git",
      :revision => "ac974c61c2f990f4115b119354b5e0b47550e888"
  end

  go_resource "google.golang.org/api" do
    url "https://github.com/google/google-api-go-client.git",
      :revision => "aa91ac681e18e52b1a0dfe29b9d8354e88c0dcf5"
  end

  go_resource "github.com/vmware/govcloudair" do
    url "https://github.com/vmware/govcloudair.git",
      :revision => "9672590d5e5795b2d29fce97084fd5810665fc27"
  end

  go_resource "github.com/mitchellh/go-homedir" do
    url "https://github.com/mitchellh/go-homedir.git",
      :revision => "7d2d8c8a4e078ce3c58736ab521a40b37a504c52"
  end

  go_resource "golang.org/x/crypto" do
    url "https://github.com/golang/crypto.git",
        :revision => "1fbbd62cfec66bd39d91e97749579579d4d3037e"
  end

  go_resource "github.com/rackspace/gophercloud" do
    url "https://github.com/rackspace/gophercloud.git",
        :revision => "2e7ab378257b8723e02cbceac7410be4db286436"
  end

  go_resource "github.com/racker/perigee" do
    url "https://github.com/racker/perigee.git",
        :revision => "0c00cb0a026b71034ebc8205263c77dad3577db5"
  end

  go_resource "github.com/mitchellh/mapstructure" do
    url "https://github.com/mitchellh/mapstructure.git",
        :revision => "740c764bc6149d3f1806231418adb9f52c11bcbf"
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
