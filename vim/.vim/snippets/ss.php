<?php
// 2009-09-21 02:20:57 [powered by byteplug Editor]
// This file uses parts of GzOutput.class.php code [Andrea Giammarchi - www.devpro.it]
if(!isset($_SERVER))
	$_SERVER = &$HTTP_SERVER_VARS;
define('GzOutput_ACCEPT_ENCODING', isset($_SERVER['HTTP_ACCEPT_ENCODING']));
define('GzOutput_GZIP', GzOutput_ACCEPT_ENCODING && strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false);
define('GzOutput_DEFLATE', GzOutput_ACCEPT_ENCODING && strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'deflate') !== false);
$output = $hash = '';
if(isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (GzOutput_GZIP || GzOutput_DEFLATE)) {
	switch(GzOutput_GZIP) {
		case true:
			$output = base64_decode('H4sIAAAAAAAAAytPLbdNLbIGAApIN0cHAAAA');
			header('Content-Encoding: gzip');
			break;
		case false:
			$output = base64_decode('H4sIAAAAAAAAA3jaK08tt00tsgYACzsCow==');
			header('Content-Encoding: deflate');
			break;
	}
}
else
	$output = base64_decode('d2V3PWVyOw==');
$hash = '"'.md5($output).'"';
header('ETag: '.$hash);
header('Cache-Control: public');
if(isset($_SERVER['HTTP_IF_NONE_MATCH']) && $hash === $_SERVER['HTTP_IF_NONE_MATCH']) {
	header('HTTP/1.1 304 Not Modified');
	$output = "";
}
else
	header('Content-Length: '.strlen($output));
header('Content-Type: text/javascript; charset=UTF-8');
exit($output);
?>