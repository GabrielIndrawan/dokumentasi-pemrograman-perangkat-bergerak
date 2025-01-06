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

// Get the raw POST data
$input = file_get_contents('php://input');

// Decode JSON input
$data = json_decode($input, true);

// Validate input
if (isset($data['biaya']) && isset($data['barang'])) {
    $barang = $conn->real_escape_string($data['barang']);
    $biaya = $conn->real_escape_string($data['biaya']);
    
    // SQL query to insert data
    $sql = "INSERT INTO penjualan (barang,biaya) VALUES ('$barang', '$biaya')";

    if ($conn->query($sql) === TRUE) {
        http_response_code(201); // Created
        echo json_encode(["message" => "User added successfully"]);
    } else {
        http_response_code(500); // Internal Server Error
        echo json_encode(["error" => "Error: " . $conn->error]);
    }
} else {
    http_response_code(400); // Bad Request
    echo json_encode(["error" => "Invalid input"]);
}

// Close connection
$conn->close();
?>