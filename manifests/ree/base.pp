class passenger::ree::base inherits passenger::base {
  require ruby_enterprise::gems::rake
  require ruby_enterprise::gems::fastthread
  require ruby_enterprise::gems::rack
  Package['rubygem-passenger']{
    ensure => 'absent',
  }
  package{'ree-rubygem-passenger':
    ensure => 'present',
  }
}
