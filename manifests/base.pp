class passenger::base {
  require ruby
  if versioncmp($::operatingsystemmajrelease,'6') > 0 {
    package{'mod_passenger':
      ensure => installed,
    }
  } else {
    package{'rubygem-passenger':
      ensure => installed,
    }
  }
}
