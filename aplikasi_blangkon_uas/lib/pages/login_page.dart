import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
      var result = await http.get(Uri.parse("localhost/database/database_connection.php"));
      if (result.statusCode == 200) {
      // If successful, parse the JSON
      final data = jsonDecode(result.body);
      print(data);
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
                    setFromSharedPreferences();
                  }, 
                  child: const Text("Create User")
                ),
                ElevatedButton(
                  onPressed: (){
                    getFromSharedPreferences();
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

  void setFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    if(usernameController.text == prefs.getString("username") && passwordController.text == prefs.getString("password")){
      setState(() {
        warning = "Akun tersebut telah dibuat sebelumnya, jika itu anda bisa langsung klik login...";
      });
    }else{
      await prefs.setString("username",usernameController.text);
      await prefs.setString("password",passwordController.text);
      if(mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard()));
      }
    }  
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("username") == usernameController.text && prefs.getString("password") == passwordController.text){
      if(mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard()));
      }
    }else{
      setState(() {
        warning = "Tidak ada akun tersebut...";
      });
    }
  }
}