
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
    content => template('webserver/mediawiki/LocalSettings.erb'),
  }

  vcsrepo { "/var/www/html/mediawiki":
    ensure   => present,
    provider => git,
    source   => 'https://gerrit.wikimedia.org/r/p/mediawiki/core.git',
    revision => '1.23.6',
  }

  firewall { '100 allow http access':
    port   => [80],
    proto  => tcp,
    action => accept,
  }

}
