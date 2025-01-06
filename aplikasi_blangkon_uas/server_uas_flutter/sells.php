<?php
// Database configuration
$host = "localhost";     // Change to your host
$username = "root";      // Your MySQL username
$password = "";          // Your MySQL password
$database = "blangkon2"; // Your database name

// Create a connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to fetch all data
$sql = "SELECT * FROM penjualan"; // Replace with your table name
$result = $conn->query($sql);

$data = [];

if ($result->num_rows > 0) {
    // Fetch data into an array
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($data);

// Close the connection
$conn->close();
?>