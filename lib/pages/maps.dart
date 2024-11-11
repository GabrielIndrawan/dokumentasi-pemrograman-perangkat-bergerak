import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/default_app_bar.dart';

class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Image.asset("assets/maps.png",width: 500,height: 300,fit: BoxFit.cover,),
      ),
    );
  }
}