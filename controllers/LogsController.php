<?php
// controllers/LogsController.php
// Заголовки безопасности
header("Content-Security-Policy: default-src 'self'; script-src 'self' cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' cdnjs.cloudflare.com; img-src 'self' data:");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");
class LogsController {
    private $logsDb;

    public function __construct($logsDb) {
        $this->logsDb = $logsDb;
        $this->checkAuth();
    }

    private function checkAuth() {
        session_start();
        if (!isset($_SESSION['admin_logged_in'])) {
            header('Location: /login');
            exit;
        }
        
        // Для просмотра логов нужен уровень 6+
        if ($_SESSION['admin_level'] < 6) {
            die('Доступ запрещен. Недостаточно прав.');
        }
    }

    public function adminLogs() {
        $page = $_GET['page'] ?? 1;
        $perPage = 50;
        $offset = ($page - 1) * $perPage;

        // Фильтры
        $admin = $_GET['admin'] ?? '';
        $action = $_GET['action'] ?? '';
        $dateFrom = $_GET['date_from'] ?? '';
        $dateTo = $_GET['date_to'] ?? '';

        $where = [];
        $params = [];

        if (!empty($admin)) {
            $where[] = "admin LIKE :admin";
            $params[':admin'] = "%$admin%";
        }

        if (!empty($action)) {
            $where[] = "action LIKE :action";
            $params[':action'] = "%$action%";
        }

        if (!empty($dateFrom)) {
            $where[] = "time >= :date_from";
            $params[':date_from'] = $dateFrom;
        }

        if (!empty($dateTo)) {
            $where[] = "time <= :date_to";
            $params[':date_to'] = $dateTo . ' 23:59:59';
        }

        $whereClause = $where ? 'WHERE ' . implode(' AND ', $where) : '';

        // Получаем логи
        $stmt = $this->logsDb->prepare("SELECT * FROM adminlog $whereClause ORDER BY time DESC LIMIT :offset, :perPage");
        
        foreach ($params as $key => $value) {
            $stmt->bindValue($key, $value);
        }
        
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindValue(':perPage', $perPage, PDO::PARAM_INT);
        $stmt->execute();
        $logs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Общее количество
        $stmt = $this->logsDb->prepare("SELECT COUNT(*) FROM adminlog $whereClause");
        foreach ($params as $key => $value) {
            $stmt->bindValue($key, $value);
        }
        $stmt->execute();
        $total = $stmt->fetchColumn();
        $totalPages = ceil($total / $perPage);

        include '../views/logs_admin.php';
    }

    public function serverLogs() {
        $page = $_GET['page'] ?? 1;
        $perPage = 50;
        $offset = ($page - 1) * $perPage;

        // Фильтры
        $type = $_GET['type'] ?? '';
        $login = $_GET['login'] ?? '';
        $dateFrom = $_GET['date_from'] ?? '';
        $dateTo = $_GET['date_to'] ?? '';

        $where = [];
        $params = [];

        if (!empty($type)) {
            $where[] = "action = :type";
            $params[':type'] = $type;
        }

        if (!empty($login)) {
            $where[] = "login LIKE :login";
            $params[':login'] = "%$login%";
        }

        if (!empty($dateFrom)) {
            $where[] = "time >= :date_from";
            $params[':date_from'] = $dateFrom;
        }

        if (!empty($dateTo)) {
            $where[] = "time <= :date_to";
            $params[':date_to'] = $dateTo . ' 23:59:59';
        }

        $whereClause = $where ? 'WHERE ' . implode(' AND ', $where) : '';

        // Получаем логи
        $stmt = $this->logsDb->prepare("SELECT * FROM acclog $whereClause ORDER BY time DESC LIMIT :offset, :perPage");
        
        foreach ($params as $key => $value) {
            $stmt->bindValue($key, $value);
        }
        
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindValue(':perPage', $perPage, PDO::PARAM_INT);
        $stmt->execute();
        $logs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Общее количество
        $stmt = $this->logsDb->prepare("SELECT COUNT(*) FROM acclog $whereClause");
        foreach ($params as $key => $value) {
            $stmt->bindValue($key, $value);
        }
        $stmt->execute();
        $total = $stmt->fetchColumn();
        $totalPages = ceil($total / $perPage);

        include '../views/logs_server.php';
    }
}