import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Admin Dashboard', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('User List', context),
            const SizedBox(height: 20),
            _buildButton('Product List', context),
            const SizedBox(height: 20),
            _buildButton('Customer List', context),
            const SizedBox(height: 20),
            _buildButton('Sells List/Details', context),
            const SizedBox(height: 20),
            _buildButton('Logout', context),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == 'Logout') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logging out...')),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListPage(text)),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  final String listType;

  ListPage(this.listType);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    String url = '';
    switch (widget.listType) {
      case 'User List':
        url = 'http://localhost/server-uas-flutter/connection.php';
        break;
      case 'Product List':
        url = 'http://localhost/server-uas-flutter/fetchProduct.php'; // Example URL
        break;
      case 'Customer List':
        url = 'http://localhost/server-uas-flutter/customers.php'; // Replace with real API
        break;
      case 'Sells List/Details':
        url = 'http://localhost/server-uas-flutter/sells.php'; // Replace with real API
        break;
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(widget.listType, style: const TextStyle(color: Colors.white)),
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(getTitle(index)),
              subtitle: Text(getSubtitle(index)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Editing item ${index + 1}')),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        data.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Deleted item ${index + 1}')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Adding new item to ${widget.listType}')),
          );
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
      ),
    );
  }

  String getTitle(int index) {
    switch (widget.listType) {
      case 'User List':
        return data[index]['username'] ?? 'Unknown User';
      case 'Product List':
        return data[index]['nama'] ?? 'Unnamed Product';
      case 'Customer List':
        return data[index]['nama'] ?? 'Unknown Customer';
      case 'Sells List/Details':
        return data[index]['pembeli'] ?? 'Unknown Sale';
      default:
        return 'No title';
    }
  }

  String getSubtitle(int index) {
    switch (widget.listType) {
      case 'User List':
        return data[index]['password'] ?? 'No password';
      case 'Product List':
        return 'Price: \$${data[index]['harga']}'; // Adjust according to your API
      case 'Customer List':
        return data[index]['id'] ?? 'No Address';
      case 'Sells List/Details':
        return 'Post ID: ${data[index]['biaya']}';
      default:
        return 'No subtitle';
    }
  }
}

