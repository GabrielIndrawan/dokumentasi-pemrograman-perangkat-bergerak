import 'package:app_blangkon_sqflite/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class Telephone extends StatelessWidget {
  const Telephone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top:10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Our Number :", style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              Text("889-xxxx-xxx", style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}