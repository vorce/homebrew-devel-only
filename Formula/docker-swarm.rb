require "language/go"

class DockerSwarm < Formula
  homepage "https://github.com/docker/swarm"

  devel do
    url "https://github.com/docker/swarm/archive/v0.1.0-rc2.tar.gz"
    sha1 "05b8b5a7818d931bfa917839518cde78f3a507ed"
    version "0.1.0_rc2"
  end

  head "https://github.com/docker/swarm.git"

  depends_on "go" => :build

  go_resource "github.com/Sirupsen/logrus" do
    url "https://github.com/Sirupsen/logrus.git",
      :revision => "89efc1fea9b8b47f6f6ce72279a7ed9496b4cdb3"
  end

  go_resource "github.com/armon/consul-api" do
    url "https://github.com/armon/consul-api.git",
      :revision => "dcfedd50ed5334f96adee43fc88518a4f095e15c"
  end

  go_resource "github.com/codegangsta/cli" do
    url "https://github.com/codegangsta/cli.git",
      :revision => "6086d7927ec35315964d9fea46df6c04e6d697c1"
  end

  go_resource "github.com/coreos/etcd" do
    url "https://github.com/coreos/etcd.git",
      :revision => "bdcae31638c0e17e1f51df810d09fc009c672e48"
  end

  go_resource "github.com/coreos/go-etcd" do
    url "https://github.com/coreos/go-etcd.git",
      :revision => "adcbc79ef9ef8ce64b43b63b9fcf9b6cb3c41c7e"
  end

  go_resource "github.com/docker/docker" do
    url "https://github.com/docker/docker.git",
      :revision => "18d8fe12494197773727c5d1a866e2d82d6e5602"
  end

  go_resource "github.com/gorilla/context" do
    url "https://github.com/gorilla/context.git",
      :revision => "215affda49addc4c8ef7e2534915df2c8c35c6cd"
  end

  go_resource "github.com/gorilla/mux" do
    url "https://github.com/gorilla/mux.git",
      :revision => "e444e69cbd2e2e3e0749a2f3c717cec491552bbf"
  end

  go_resource "github.com/samalba/dockerclient" do
    url "https://github.com/samalba/dockerclient.git",
      :revision => "7e4366cfab2f2b44fcb493bee93a156a763d58b6"
  end

  go_resource "github.com/samuel/go-zookeeper" do
    url "https://github.com/samuel/go-zookeeper.git",
      :revision => "fa6674abf3f4580b946a01bf7a1ce4ba8766205b"
  end

  def install
    ENV["GOPATH"] = buildpath
    host = "github.com"
    org_name = "docker"
    repo_name = "swarm"

    mkdir_p buildpath/"src/#{host}/#{org_name}"
    ln_s buildpath, buildpath/"src/#{host}/#{org_name}/#{repo_name}"

    Language::Go.stage_deps resources, buildpath/"src"

    bin_name = "docker-swarm"
    system "go", "build", "-o", bin_name
    bin.install bin_name
  end

  test do
    output = shell_output("#{bin}/docker-swarm -v")
    assert_equal output, "swarm version 0.0.1\n"
  end
end
