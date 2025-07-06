<?php
require_once __DIR__ . '/../lib/Database.php';
require_once __DIR__ . '/../config/db.php';
class Admin {
    private $db;
    public function __construct() {
        global $mainDB;
        $this->db = new Database($mainDB['host'], $mainDB['dbname'], $mainDB['user'], $mainDB['pass']);
    }
    public function findByLogin($login) {
        $sql = "SELECT * FROM admins WHERE login = ?";
        return $this->db->fetch($sql, [$login]);
    }
    public function verifyPassword($password, $hash) {
        return password_verify($password, $hash);
    }
    public function login($login, $password) {
        $admin = $this->findByLogin($login);
        if ($admin && $this->verifyPassword($password, $admin['password'])) {
            $_SESSION['admin_id'] = $admin['id'];
            $_SESSION['admin_level'] = $admin['level'];
            return true;
        }
        return false;
    }
}