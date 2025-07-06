<?php
class Database {
    private $connection;
    public function __construct($host, $dbname, $user, $pass) {
        try {
            $this->connection = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Connection failed: " . $e->getMessage());
        }
    }
    public function query($sql, $params = []) {
        $stmt = $this->connection->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }
    public function fetch($sql, $params = []) {
        return $this->query($sql, $params)->fetch(PDO::FETCH_ASSOC);
    }
    public function fetchAll($sql, $params = []) {
        return $this->query($sql, $params)->fetchAll(PDO::FETCH_ASSOC);
    }
    // Другие методы по мере необходимости
}
public function beginTransaction() {
    return $this->connection->beginTransaction();
}

public function commit() {
    return $this->connection->commit();
}

public function rollBack() {
    return $this->connection->rollBack();
}