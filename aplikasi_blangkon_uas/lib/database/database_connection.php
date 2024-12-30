<?php 

header("Access-Control-Allow-Origin: *");

$servername = "localhost";
$username = "root";
$password = "";
$databasename = "test";

$conn = new mysqli($servername, $username, $password, $databasename);

if($conn->connect_error){
    die("Connection failed: ".$conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $sql = "SELECT * FROM user";
    $result = $conn->query($sql);

    $users = [];
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }

    echo json_encode($users);
}

// Close connection
$conn->close();

?>