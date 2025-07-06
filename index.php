<?php
// index.php

// Настройка безопасности
header("Content-Security-Policy: default-src 'self'; script-src 'self' cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' cdnjs.cloudflare.com; img-src 'self' data:");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");

// Отключение вывода ошибок в продакшене
ini_set('display_errors', 0);
error_reporting(E_ALL);

// Конфигурация
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/lib/Database.php';
require_once __DIR__ . '/models/Admin.php';

// Автозагрузка классов
spl_autoload_register(function ($className) {
    $file = __DIR__ . '/controllers/' . $className . '.php';
    if (file_exists($file)) {
        require $file;
    }
});

// Инициализация сессии
session_start();
session_regenerate_id(true);

// Подключение к базам данных
try {
    $mainDB = new Database(
        $dbConfig['main']['host'],
        $dbConfig['main']['dbname'],
        $dbConfig['main']['user'],
        $dbConfig['main']['pass']
    );
    
    $logsDB = new Database(
        $dbConfig['logs']['host'],
        $dbConfig['logs']['dbname'],
        $dbConfig['logs']['user'],
        $dbConfig['logs']['pass']
    );
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Обработка маршрута
$request = $_SERVER['REQUEST_URI'];
$basePath = '/';
$requestPath = parse_url($request, PHP_URL_PATH);
$route = substr($requestPath, strlen($basePath));
$uriSegments = explode('/', trim($route, '/'));

// Определение контроллера и действия
$controllerName = 'Dashboard';
$action = 'index';
$params = [];

if (!empty($uriSegments[0])) {
    $controllerName = ucfirst($uriSegments[0]) . 'Controller';
    
    if (!empty($uriSegments[1])) {
        if (is_numeric($uriSegments[1])) {
            $params[] = $uriSegments[1];
            $action = !empty($uriSegments[2]) ? $uriSegments[2] : 'view';
        } else {
            $action = $uriSegments[1];
        }
        
        // Дополнительные параметры
        for ($i = 2; $i < count($uriSegments); $i++) {
            if (is_numeric($uriSegments[$i])) {
                $params[] = $uriSegments[$i];
            }
        }
    }
}

// Проверка существования контроллера
if (!class_exists($controllerName)) {
    $controllerName = 'ErrorController';
    $action = 'notFound';
}

// Создание экземпляра контроллера
try {
    switch ($controllerName) {
        case 'LoginController':
            $controller = new LoginController($mainDB);
            break;
        case 'DashboardController':
            $controller = new DashboardController($mainDB, $logsDB);
            break;
        case 'PlayersController':
            $controller = new PlayersController($mainDB, $logsDB);
            break;
        case 'LogsController':
            $controller = new LogsController($logsDB);
            break;
        default:
            $controller = new $controllerName($mainDB, $logsDB);
    }
    
    // Вызов действия
    if (method_exists($controller, $action)) {
        call_user_func_array([$controller, $action], $params);
    } else {
        throw new Exception("Action $action not found in $controllerName");
    }
} catch (Exception $e) {
    // Логирование ошибки
    error_log("Controller error: " . $e->getMessage());
    
    // Показ страницы ошибки
    $errorController = new ErrorController();
    $errorController->serverError();
}