<?php
// controllers/DashboardController.php
// Заголовки безопасности
header("Content-Security-Policy: default-src 'self'; script-src 'self' cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' cdnjs.cloudflare.com; img-src 'self' data:");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");
class DashboardController {
    private $db;
    private $logsDb;

    public function __construct($db, $logsDb) {
        $this->db = $db;
        $this->logsDb = $logsDb;
        $this->checkAuth();
    }

    private function checkAuth() {
        session_start();
        if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_level'] < 3) {
            header('Location: /login');
            exit;
        }
    }

    public function index() {
        // Получаем статистику для дашборда
        $stats = [
            'online_players' => $this->getOnlinePlayersCount(),
            'total_players' => $this->getTotalPlayersCount(),
            'vehicles' => $this->getVehiclesCount(),
            'houses' => $this->getHousesCount()
        ];

        // Получаем последние действия администраторов
        $adminActions = $this->getRecentAdminActions(5);

        // Получаем последние логи сервера
        $serverLogs = $this->getRecentServerLogs(5);

        include '../views/dashboard.php';
    }

    private function getOnlinePlayersCount() {
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM characters WHERE online = 1");
        $stmt->execute();
        return $stmt->fetchColumn();
    }

    private function getTotalPlayersCount() {
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM characters");
        $stmt->execute();
        return $stmt->fetchColumn();
    }

    private function getVehiclesCount() {
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM vehicles");
        $stmt->execute();
        return $stmt->fetchColumn();
    }

    private function getHousesCount() {
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM houses");
        $stmt->execute();
        return $stmt->fetchColumn();
    }

    private function getRecentAdminActions($limit = 5) {
        $stmt = $this->logsDb->prepare("SELECT * FROM adminlog ORDER BY time DESC LIMIT :limit");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    private function getRecentServerLogs($limit = 5) {
        $stmt = $this->logsDb->prepare("SELECT * FROM acclog ORDER BY time DESC LIMIT :limit");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}