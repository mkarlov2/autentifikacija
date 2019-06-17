<?php

spl_autoload_register(function ($class) {/*includa sve classe u program*/
    include 'classes/' . $class . '.php';
});

require_once 'functions/sanitize.php';




?>