<?php

$product = $argv[1];

switch ($product) {
	case 'PhpStorm':
		$product = 'PS';
		break;
	case 'WebStorm':
		$product = 'WS';
		break;
	case 'PyCharm':
		$product = 'PCP';
		break;
	default:
		echo "Invalid";
		exit();
}

$ch = curl_init();
$headers = ['Accept: application/json', 'Content-Type: application/json'];
curl_setopt($ch, CURLOPT_URL, 'https://data.services.jetbrains.com/products/releases?code='.$product.'&latest=true&type=release&build=');
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$versionResponse = curl_exec($ch);

$version = json_decode($versionResponse, true);

// return $version;
echo $version[$product][0]['version'];
exit();
