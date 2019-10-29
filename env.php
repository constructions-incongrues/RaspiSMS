<?php
	/*
        This file define constants and options for the app
	*/

    $env = [
        'ENV' => 'dev',
        'SESSION_NAME' => 'raspisms',

        //RaspiSMS settings
        'WEBSITE_TITLE' => 'RaspiSMS',
        'WEBSITE_DESCRIPTION' => '',
        'WEBSITE_AUTHOR' => 'Raspbian-France',
        'PWD_SCRIPTS' => PWD . '/scripts',
        'APP_SECRET' => 'retyuijokplmrtè34567890',

        //E-mail types
        'EMAIL_RESET_PASSWORD' => [
            'type' => 'email_reset_password',
            'subject' => 'Réinitialisation de votre mot de passe',
            'template' => 'email/reset-password',  
        ],
        'EMAIL_CREATE_USER' => [
            'type' => 'email_create_user',
            'subject' => 'Création de votre compte RaspiSMS',
            'template' => 'email/create-user',  
        ],
	];

