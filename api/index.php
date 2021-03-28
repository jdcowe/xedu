<?php

// Find the f3 library installed by composer in the parent vendor directory and create an instance
require(__DIR__.'/../vendor/autoload.php');
$f3 = Base::instance();

$f3->config(__DIR__.'/../app/config.ini');
$f3->config(__DIR__.'/../app/routes.ini');

$db = DatabaseConnection::connect();		// defined as autoloaded class in AboveWebRoot/autoload/
$f3->set('DB', $db);
$f3->set('CORS.origin', '*');

$f3->run();
