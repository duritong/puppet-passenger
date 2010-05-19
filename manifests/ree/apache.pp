class passenger::ree::apache inherits passenger::apache {
  include passenger::ree
  Package['mod_passenger']{
    ensure => absent,
    require => [ Package['apache'], Package['rubygem-passenger'] ],
  }

  package{'ree-mod_passenger':
    ensure => installed,
    require => [ Package['apache'], Package['ree-rubygem-passenger'] ],
  }

  File['/var/www/passenger_buffer']{
    require +> Package['ree-mod_passenger'],
  }
}
