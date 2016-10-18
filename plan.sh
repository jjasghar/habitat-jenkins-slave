pkg_origin=jjasghar
pkg_name=jenkins-slave
pkg_version=2.9
pkg_maintainer="JJ Asghar <jj@chef.io>"
pkg_license=("Apache 2")
pkg_source=https://www.google.com/blank.html
pkg_deps=(core/jre8 core/gcc-libs core/glibc core/busybox core/openssh)
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(22)

do_install() {
  mkdir -p /hab/svc/openssh/config
  if [ ! -f /hab/svc/openssh/config/sshd_config ] ; then
    ln -s /hab/svc/jenkins-slave/config/sshd_config /hab/svc/openssh/config/sshd_config
  fi
  mkdir -p ${pkg_prefix}/etc/ssh

  prog=$(basename $0)
  logger="logger -t $prog"
  rsa_key="${pkg_prefix}/etc/ssh/ssh_host_rsa_key"
  dsa_key="${pkg_prefix}/etc/ssh/ssh_host_dsa_key"
  ecdsa_key="${pkg_prefix}/etc/ssh/ssh_host_ecdsa_key"

  # Exit if the hostkeys already exist
  if [ -f $rsa_key -a -f $dsa_key -a -f $ecdsa_key ]; then
    return 0
  fi

  # Generate the ssh host keys
  [ -f $rsa_key ] || ssh-keygen -f $rsa_key -t rsa -C 'host' -N ''
  [ -f $dsa_key ] || ssh-keygen -f $dsa_key -t dsa -C 'host' -N ''
  [ -f $ecdsa_key ] || ssh-keygen -f $ecdsa_key -t ecdsa -C 'host' -N ''

  # Output the public keys to the console
  # This allows user to get host keys securely through console log
  echo "-----BEGIN SSH HOST KEY FINGERPRINTS-----" | $logger
  ssh-keygen -l -f $rsa_key.pub | $logger
  ssh-keygen -l -f $dsa_key.pub | $logger
  ssh-keygen -l -f $ecdsa_key.pub | $logger
  echo "------END SSH HOST KEY FINGERPRINTS------" | $logger

  if [ ! -f ${pkg_prefix}/etc/ssh/ssh_host_ecdsa_key ] ; then
    ln -s /etc/ssh/ssh_host_ecdsa_key ${pkg_prefix}/etc/ssh/ssh_host_ecdsa_key
  fi
}
