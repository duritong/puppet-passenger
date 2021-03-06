# prepare passenger for apache
class passenger::apache{
  require ::passenger
  include ::apache
  package{'mod_passenger':
    ensure  => installed,
    require => Package['apache'],
  } -> file{'/var/www/passenger_buffer':
    ensure => directory,
    owner  => apache,
    group  => 0,
    mode   => '0600';
  } -> file{'/etc/httpd/conf.d/mod_passenger_custom.conf':
    content => "PassengerUploadBufferDir /var/www/passenger_buffer\n",
    notify  => Service['apache'],
    owner   => root,
    group   => 0,
    mode    => '0644';
  }
  if str2bool($facts['selinux']) {
    selinux::fcontext{
      '/var/www/passenger_buffer(/.*)?':
        setype => 'httpd_sys_rw_content_t',
    } -> File['/var/www/passenger_buffer']{
      seltype => 'httpd_sys_rw_content_t',
    }
  }
}
