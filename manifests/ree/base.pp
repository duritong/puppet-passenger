class passenger::ree::base inherits passenger::base {
    require ruby-enterprise
    Package['rubygem-passenger']{
        ensure => 'absent',
    }
    package{'ree-rubygem-passenger':
        ensure => 'present',
    }
}
