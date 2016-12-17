class passenger::base {
  require ruby
  if versioncmp($::operatingsystemmajrelease,'6') > 0 {
    package{'passenger':
      ensure => installed,
    }
  } else {
    package{'rubygem-passenger':
      ensure => installed,
    }
  }
}
