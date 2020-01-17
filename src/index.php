<?php
	session_start();
	##############
	# INCLUSIONS #
	##############
	//On va inclure l'ensemble des fichiers necessaires
	require_once(__DIR__.'/mvc/constants.php');
	require_once(__DIR__.'/mvc/autoload.php');
	require_once(__DIR__.'/mvc/conn_bdd.php');
	require_once(__DIR__.'/mvc/secho.php');
	require_once(__DIR__.'/mvc/Controller.php');
	require_once(__DIR__.'/mvc/Router.php');
	require_once(__DIR__.'/mvc/Model.php');

	#########
	# MODEL #
	#########
	//On va appeler un modèle, est l'initialiser
	$db = new DataBase($bdd);;

	//On va ajouter les réglages globaux de RaspiSMS modifiables via l'interface
	$settings = $db->getFromTableWhere('settings');
	foreach ($settings as $setting)
	{
		define('RASPISMS_SETTINGS_' . mb_convert_case($setting['name'],  MB_CASE_UPPER), $setting['value']);
	}


	###########
	# ROUTAGE #
	###########
	//Partie gérant l'appel des controlleurs
	$router = new Router($_SERVER['REQUEST_URI']);
	$router->loadRoute($_SERVER['REQUEST_URI']);


