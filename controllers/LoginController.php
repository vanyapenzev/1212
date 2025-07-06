<?php
// controllers/LoginController.php
// Заголовки безопасности
header("Content-Security-Policy: default-src 'self'; script-src 'self' cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' cdnjs.cloudflare.com; img-src 'self' data:");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");
class LoginController {
    private $db;

    public function __construct($db) {
        $this->db = $db;
        session_start();
    }

    public function index() {
        // Если пользователь уже авторизован, перенаправляем на главную
        if (isset($_SESSION['admin_logged_in'])) {
            header('Location: /dashboard');
            exit;
        }
        
        // Показать форму входа
        include '../views/login.php';
    }

    public function login() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $login = $_POST['login'] ?? '';
            $password = $_POST['password'] ?? '';

            // Проверяем учетные данные
            $stmt = $this->db->prepare("SELECT * FROM accounts WHERE login = :login");
            $stmt->bindParam(':login', $login);
            $stmt->execute();
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            // Проверяем пароль и уровень админа
            if ($user && password_verify($password, $user['password']) && $user['admin_level'] >= 3) {
                // Устанавливаем сессию
                $_SESSION['admin_logged_in'] = true;
                $_SESSION['admin_login'] = $user['login'];
                $_SESSION['admin_level'] = $user['admin_level'];
                $_SESSION['admin_name'] = $user['login'];

                header('Location: /dashboard');
                exit;
            } else {
                // Ошибка входа
                $_SESSION['login_error'] = 'Неверный логин, пароль или недостаточный уровень доступа';
                header('Location: /login');
                exit;
            }
        }
    }

    public function logout() {
        // Уничтожаем сессию
        session_destroy();
        header('Location: /login');
        exit;
    }
}