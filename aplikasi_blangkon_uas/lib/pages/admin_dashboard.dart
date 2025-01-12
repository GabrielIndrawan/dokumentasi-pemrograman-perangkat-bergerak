import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
          Navigator.of(context).pop();
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

  String convertToCSV(List<List<dynamic>> data){
    String csvData = const ListToCsvConverter().convert(data);
    return csvData;
  }

  fetchData() async {
    String url = '';
    switch (widget.listType) {
      case 'User List':
        url = 'http://Abelepic3.infinityfreeapp.com/server_uas_flutter/connection.php';
        break;
      case 'Product List':
        url = 'http://Abelepic3.infinityfreeapp.com/server_uas_flutter/fetchProduct.php'; // Example URL
        break;
      case 'Customer List':
        url = 'http://Abelepic3.infinityfreeapp.com/server_uas_flutter/customers.php'; // Replace with real API
        break;
      case 'Sells List/Details':
        url = 'http://Abelepic3.infinityfreeapp.com/server_uas_flutter/sells.php'; // Replace with real API
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

  Future<void> downloadCSV(String csvData) async {
    final directory = await getExternalStorageDirectory();
    final filePath = directory!.path + "/data.csv";
    File file = File(filePath);
    await file.writeAsString(csvData);
    print("CSV saved at: ${filePath}");
  }

  void generateAndSaveCSV() {
    // Assuming `data` is a list of maps, convert it to List<List<dynamic>>
    List<List<dynamic>> csvData = [];
    
    // Add headers if needed
    if (data.isNotEmpty) {
      List<dynamic> headers = data[0].keys.toList(); // Extract headers from the first object
      csvData.add(headers);

      // Add data rows
      for (var row in data) {
        List<dynamic> rowData = row.values.toList();
        csvData.add(rowData);
      }
    }

    // Convert and save to CSV
    String csv = convertToCSV(csvData);
    downloadCSV(csv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(widget.listType, style: const TextStyle(color: Colors.white)),
        automaticallyImplyLeading: true,
      ),
      body:
          Column(
            children: [
              ElevatedButton(onPressed: (){
                generateAndSaveCSV();
              }, child: const Text("Download CSV")),
              Container(
                height: 400,
                child: ListView.builder(
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
                            SizedBox(
                              child:(widget.listType=="Sells List/Details")?
                              Image.network("http://192.168.100.67/server_uas_flutter/"+data[index]["bukti"])
                              :
                              const SizedBox(),
                            )
                            ,
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
              ),
            ],
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

