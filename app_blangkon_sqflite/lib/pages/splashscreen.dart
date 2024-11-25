import 'package:app_blangkon_sqflite/pages/login_page.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin()async{
    await Future.delayed(const Duration(seconds: 3),(){});
    if(mounted){
      Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => const LoginPage())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/splash.png",width: 150,height: 150,),
            const Text("Selamat datang di Blangkon-Ku", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}