<?php
// controllers/ErrorController.php

class ErrorController {
    public function notFound() {
        http_response_code(404);
        include '../views/errors/404.php';
        exit;
    }
    
    public function serverError() {
        http_response_code(500);
        include '../views/errors/500.php';
        exit;
    }
    
    public function accessDenied() {
        http_response_code(403);
        include '../views/errors/403.php';
        exit;
    }
}