<?php
// controllers/PlayersController.php
// Заголовки безопасности
header("Content-Security-Policy: default-src 'self'; script-src 'self' cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' cdnjs.cloudflare.com; img-src 'self' data:");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");
class PlayersController {
    private $db;
    private $logsDb;

    public function __construct($db, $logsDb) {
        $this->db = $db;
        $this->logsDb = $logsDb;
        $this->checkAuth();
    }

    private function checkAuth() {
        session_start();
        if (!isset($_SESSION['admin_logged_in'])) {
            header('Location: /login');
            exit;
        }
    }

    public function index() {
        // Проверка уровня доступа
        if ($_SESSION['admin_level'] < 3) {
            die('Доступ запрещен. Недостаточно прав.');
        }

        // Параметры пагинации
        $page = $_GET['page'] ?? 1;
        $perPage = 20;
        $offset = ($page - 1) * $perPage;

        // Поиск и фильтрация
        $search = $_GET['search'] ?? '';
        $where = '';
        $params = [];

        if (!empty($search)) {
            $where = "WHERE firstname LIKE :search OR lastname LIKE :search";
            $params[':search'] = "%$search%";
        }

        // Получаем игроков
        $stmt = $this->db->prepare("SELECT * FROM characters $where ORDER BY uuid DESC LIMIT :offset, :perPage");
        foreach ($params as $key => $value) {
            $stmt->bindValue($key, $value);
        }
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindValue(':perPage', $perPage, PDO::PARAM_INT);
        $stmt->execute();
        $players = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Общее количество
        $stmt = $this->db->prepare("SELECT COUNT(*) FROM characters $where");
        foreach ($params as $key => $value) {
            $stmt->bindValue($key, $value);
        }
        $stmt->execute();
        $total = $stmt->fetchColumn();
        $totalPages = ceil($total / $perPage);

        include '../views/players.php';
    }

    public function view($uuid) {
        // Проверка уровня доступа
        if ($_SESSION['admin_level'] < 3) {
            die('Доступ запрещен. Недостаточно прав.');
        }

        // Получаем данные игрока
        $stmt = $this->db->prepare("SELECT * FROM characters WHERE uuid = :uuid");
        $stmt->bindParam(':uuid', $uuid);
        $stmt->execute();
        $player = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$player) {
            die('Игрок не найден');
        }

        // Получаем инвентарь
        $inventory = $this->getPlayerInventory($uuid);

        // Получаем транспорт
        $vehicles = $this->getPlayerVehicles($uuid);

        // Получаем логи игрока
        $logs = $this->getPlayerLogs($uuid);

        include '../views/player_view.php';
    }

    public function edit($uuid) {
        // Проверка уровня доступа
        if ($_SESSION['admin_level'] < 9) {
            die('Доступ запрещен. Недостаточно прав.');
        }

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->updatePlayer($uuid);
            header("Location: /players/view/$uuid");
            exit;
        }

        // Получаем данные игрока для формы
        $stmt = $this->db->prepare("SELECT * FROM characters WHERE uuid = :uuid");
        $stmt->bindParam(':uuid', $uuid);
        $stmt->execute();
        $player = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$player) {
            die('Игрок не найден');
        }

        include '../views/player_edit.php';
    }

    private function getPlayerInventory($uuid) {
        $stmt = $this->db->prepare("SELECT * FROM items_data WHERE location = 'player' AND holder = :uuid");
        $stmt->bindParam(':uuid', $uuid);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    private function getPlayerVehicles($uuid) {
        $stmt = $this->db->prepare("SELECT * FROM vehicles WHERE holder = :uuid");
        $stmt->bindParam(':uuid', $uuid);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    private function getPlayerLogs($uuid) {
        $stmt = $this->logsDb->prepare("SELECT * FROM acclog WHERE uuid = :uuid ORDER BY time DESC LIMIT 50");
        $stmt->bindParam(':uuid', $uuid);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    private function updatePlayer($uuid) {
        $money = $_POST['money'] ?? 0;
        $bank = $_POST['bank'] ?? 0;
        $level = $_POST['level'] ?? 0;
        $adminLevel = $_POST['admin_level'] ?? 0;

        $stmt = $this->db->prepare("UPDATE characters SET 
            money = :money, 
            bank = :bank, 
            lvl = :level,
            admin_level = :admin_level 
            WHERE uuid = :uuid");

        $stmt->bindParam(':money', $money);
        $stmt->bindParam(':bank', $bank);
        $stmt->bindParam(':level', $level);
        $stmt->bindParam(':admin_level', $adminLevel);
        $stmt->bindParam(':uuid', $uuid);
        $stmt->execute();

        // Логируем действие
        $this->logAdminAction($_SESSION['admin_name'], "Редактирование игрока #$uuid");
    }

    private function logAdminAction($admin, $action) {
        $stmt = $this->logsDb->prepare("INSERT INTO adminlog (admin, action, time) VALUES (:admin, :action, NOW())");
        $stmt->bindParam(':admin', $admin);
        $stmt->bindParam(':action', $action);
        $stmt->execute();
    }
}
public function addItem($uuid) {
    if ($_SESSION['admin_level'] < 9) die('Доступ запрещен');
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $itemId = $_POST['item_id'];
        $count = $_POST['count'];
        $data = $_POST['data'] ?? '';
        
        $this->db->beginTransaction();
        try {
            $stmt = $this->db->prepare("INSERT INTO items_data (data_id, item_id, item_count, item_data, location, slotId) 
                                        VALUES (:uuid, :item_id, :count, :data, 'player', 0)");
            $stmt->bindParam(':uuid', $uuid);
            $stmt->bindParam(':item_id', $itemId);
            $stmt->bindParam(':count', $count);
            $stmt->bindParam(':data', $data);
            $stmt->execute();
            
            $this->db->commit();
            $this->logAdminAction($_SESSION['admin_name'], "Добавлен предмет $itemId игроку #$uuid");
        } catch (Exception $e) {
            $this->db->rollBack();
            die("Ошибка: " . $e->getMessage());
        }
        
        header("Location: /players/view/$uuid");
    } else {
        include '../views/add_item.php';
    }
}
private function logAdminAction($admin, $action) {
    $stmt = $this->logsDb->prepare("INSERT INTO adminlog (time, admin, action, player) 
                                    VALUES (NOW(), :admin, :action, 'Система')");
    $stmt->bindParam(':admin', $admin);
    $stmt->bindParam(':action', $action);
    $stmt->execute();
}

public function editVehicle($vehicleId) {
    if ($_SESSION['admin_level'] < 9) die('Доступ запрещен');
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $model = $_POST['model'];
        $fuel = $_POST['fuel'];
        $components = $_POST['components'];
        
        $stmt = $this->db->prepare("UPDATE vehicles SET model = :model, fuel = :fuel, components = :components WHERE auto_id = :id");
        $stmt->bindParam(':model', $model);
        $stmt->bindParam(':fuel', $fuel);
        $stmt->bindParam(':components', $components);
        $stmt->bindParam(':id', $vehicleId);
        $stmt->execute();
        
        $this->logAdminAction($_SESSION['admin_name'], "Изменен транспорт #$vehicleId");
        header("Location: /players/view/{$_POST['player_uuid']}");
    } else {
        $stmt = $this->db->prepare("SELECT * FROM vehicles WHERE auto_id = :id");
        $stmt->bindParam(':id', $vehicleId);
        $stmt->execute();
        $vehicle = $stmt->fetch(PDO::FETCH_ASSOC);
        
        include '../views/edit_vehicle.php';
    }
}