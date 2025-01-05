import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/admin_dashboard.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<dynamic> users = [];
  Future<void> fetchUsers() async {
  try{
      var result = await http.get(Uri.parse("http://localhost/server_uas_flutter/connection.php"));
      if (result.statusCode == 200) {
      // If successful, parse the JSON
      final data = jsonDecode(result.body);
      setState(() {
        users = data;
      });
      print(users);
    } else {
      // If the result is not successful, handle the error
      print('Request failed with status: ${result.statusCode}');
      print('result body: ${result.body}');
    }
  } catch (e) {
    // Catch any other errors, e.g., network issues
    print('Error: $e');
  }
  }

  Future<void> addUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost/server_uas_flutter/addUser.php"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard()));
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to add user: ${response.body}'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      // Handle network error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  String warning = "";

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Login Blangkon-Ku", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 10,top: 10),
        width: 340,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Username : "),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo, width: 2)
              ),
              child: TextField(
                maxLength: 30,
                controller: usernameController,
                decoration: const InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.indigo, width: 3)
                  )
                )
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Password : "),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo, width: 2)
              ),
              child: TextField(
                maxLength: 30,
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.indigo, width: 3)
                  )
                )
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    getFromSharedPreferences();
                  }, 
                  child: const Text("Create User")
                ),
                ElevatedButton(
                  onPressed: (){
                    setFromSharedPreferences();
                  }, 
                  child: const Text("Login")
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text(warning,style: const TextStyle(color: Colors.indigo),)
          ],
        ),
      ),
    );
  }

  void setFromSharedPreferences(){
    if(usernameController.text == "admin" && passwordController.text == "123"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
    }else{
      users.forEach((user) async {
        if(usernameController.text == user["username"] && passwordController.text == user["password"]){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("username",usernameController.text);
          await prefs.setString("password",passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard()));
        }
      });
      setState(() {
          warning = "Akun tersebut tidak ditemukan...";
      });
    }
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username",usernameController.text);
    await prefs.setString("password",passwordController.text);
    addUser(usernameController.text, passwordController.text);
  }
}