<?php
try {
    $pdo = new PDO(
        "pgsql:host=hostname;dbname=database",
        "username",
        "password"
    );
    $pdo->beginTransaction(); // transaction begins
    $stmt = $pdo->prepare("SELECT balance FROM accounts WHERE account_id = 1 FOR UPDATE");
    $stmt->execute();
    $stmt = $pdo->prepare("UPDATE accounts SET balance = balance + 50 WHERE account_id = 1");
    $stmt->execute();
    $pdo->commit();

} catch (PDOException $e) {
    $pdo->rollBack();
    echo "Error: " . $e->getMessage();
}
?>