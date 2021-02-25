<?php

// Find the f3 library installed by composer in the parent vendor directory and create an instance
require(__DIR__.'/../vendor/autoload.php');
$f3 = Base::instance();

$f3->config(__DIR__.'/../app/config.ini');
$f3->config(__DIR__.'/../app/routes.ini');

$f3->run();
