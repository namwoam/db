<?php
try {
    $pdo = new PDO(
        "pgsql:host=hostname;dbname=database",
        "username",
        "password"
    );
    $pdo->beginTransaction(); // transaction begins

    // tranction details
    $sender_id = "1";
    $receiver_id = "2";
    $amount = 100;

    $stmt = $pdo->prepare("UPDATE accounts SET balance = balance - :amount WHERE account_id = :sender_id;");
    $stmt->bindParam(":sender_id", $sender_id);
    $stmt->bindParam(":amount", $amount);
    $stmt->execute();

    $stmt = $pdo->prepare("SELECT balance FROM accounts WHERE account_id = :account_id FOR UPDATE");
    $stmt->bindParam(':account_id', $sender_id);
    $stmt->execute();
    $sender_balance = $stmt->fetchColumn();

    if ($sender_balance < 0) {
        // Rollback the transaction if there's an insufficient balance
        $pdo->rollBack();
        echo "Transaction failed. Insufficient funds in sender's account.";
    } else {
        $stmt = $pdo->prepare("UPDATE accounts SET balance = balance + :amount WHERE account_id = :receiver_id;");
        $stmt->bindParam(":receiver_id", $receiver_id);
        $stmt->bindParam(":amount", $amount);
        $stmt->execute();
        $pdo->commit();
        echo "Transaction successful. New sender's balance: $newSenderBalance, New receiver's balance: $newReceiverBalance";

    }

} catch (PDOException $e) {
    $pdo->rollBack();
    echo "Error: " . $e->getMessage();
}
?>