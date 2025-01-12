
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  String user;
  HistoryPage(this.user);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    String url = 'http://Abelepic3.infinityfreeapp.com/server_uas_flutter/history.php'; // Replace with real API

    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'pelanggan': widget.user,
        }));

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
        title: const Text("Histori Nota", style: const TextStyle(color: Colors.white)),
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Text(getTitle(index)),
              title: Text(getSubtitle(index)),
              subtitle: Text(data[index]["barang"]),
            ),
          );
        },
      ),

    );
  }

  String getTitle(int index) {
    return data[index]['pembeli'] ?? 'Unknown pembeli';
  }

  String getSubtitle(int index) {
    return 'Biaya: ${data[index]['biaya']}' ?? '0';
  }
}