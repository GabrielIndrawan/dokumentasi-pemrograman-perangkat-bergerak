import 'package:flutter/material.dart';
import 'package:flutter_application_pertemuan_7/pages/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String warning = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Aplikasi Login Toko Ayam", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 10,top: 10),
        width: 350,
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
            Text(warning)
          ],
        ),
      ),
    );
  }

  void setFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username",usernameController.text);
    await prefs.setString("password",passwordController.text);
    setState(() {
      warning = "Anda berhasil masuk...";
      Navigator.push(context, MaterialPageRoute(builder:(context) => const MainPage(),));
    });
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("username") == usernameController.text || prefs.getString("password") == passwordController.text){
      setState(() {
        warning = "Anda berhasil masuk...";
      });
      Navigator.push(context, MaterialPageRoute(builder:(context) => const MainPage(),));
    }else{
      setState(() {
        warning = "Tidak ada akun tersebut...";
      });
    }
  }
}
