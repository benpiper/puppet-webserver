
# == Class: webserver::mediawiki
#

class webserver::mediawiki (
  $sitename       = "Generic wiki site",
  $namespace      = "generic_wiki",
  $siteurl        = "http://mediawiki",
  $dbname         = "my_wiki",
  $dbuser         = "root",
  $dbpassword     = "training",
  $settingsfile   = "/var/www/html/mediawiki/LocalSettings.php",
  ) {

  file { $settingsfile:
    ensure => file,
    content => template('mediawiki/LocalSettings.erb'),
  }

  class { webserver: }

  vcsrepo { "/var/www/html/mediawiki":
    ensure   => present,
    provider => git,
    source   => 'https://gerrit.wikimedia.org/r/p/mediawiki/core.git',
    revision => '1.23.6',
  }


}
