class { 'webserver::mediawiki':
  sitename      => "test site",
  namespace     => "test_wiki",
  siteurl       => "http://testwiki",
  dbname        => "test_wiki",
  dbuser        => "test",
  dbpassword    => "test",
  settingsfile  => "/var/www/html/mediawiki/LocalSettings.php",
}
