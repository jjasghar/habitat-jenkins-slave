pkg_origin=jjasghar
pkg_name=jenkins-slave
pkg_version=0.1.0
pkg_maintainer="JJ Asghar <jj@chef.io>"
pkg_license=("Apache 2")
pkg_source=https://www.google.com/blank.html
pkg_shasum=e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
pkg_deps=(core/jre8 core/gcc-libs core/glibc core/busybox-static core/openssh)
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(22)
pkg_svc_user=root

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  return 0
}
