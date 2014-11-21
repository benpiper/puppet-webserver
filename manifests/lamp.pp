class webserver::lamp (
  $rootpw = 'training',
) {

  class { 'webserver::apache': }

  class { '::mysql::server':
    root_password    => $rootpw,
  }

  $php = $operatingsystem ? {
    centos => 'php',
    ubuntu => 'php5',
  }

  package { $php:
    ensure => 'installed',
  }

  $components = $operatingsystem ? {
    centos => ['php-mysql', 'php-xml'],
    ubuntu => ['libapache2-mod-php5', 'php5-mcrypt', 'php5-mysql', 'libapache2-mod-auth-mysql'],
  }

}
