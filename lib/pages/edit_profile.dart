import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/widgets/default_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late SharedPreferences prefs;
  late TextEditingController usernameController = TextEditingController(text: prefs.getString("username")), passwordController = TextEditingController(text: prefs.getString("password"));

  @override
  void initState() {
    super.initState();
    initSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 10,top: 10),
        width: 340,
        child: FutureBuilder(
          future: initSharedPrefs(),
          builder:(context,snapshot) => 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Username baru : "),
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
              const Text("Password baru : "),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.indigo, width: 2)
                ),
                child: TextField(
                  maxLength: 30,
                  controller: passwordController,
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
              Center(
                child: ElevatedButton(
                  onPressed: setSharedPrefs, child: const Text("Edit", style: TextStyle(color: Colors.indigo),)
                ),
              )
            ]
          ),
        )
      )
    );
  }

  Future<void> initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setSharedPrefs() async {
    await prefs.setString("username", usernameController.text);
    await prefs.setString("password", passwordController.text);
    if (mounted) {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    }
  }
}
