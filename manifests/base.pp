class passenger::base {
  require ruby
  package{'rubygem-passenger':
    ensure => installed,
  }
}
