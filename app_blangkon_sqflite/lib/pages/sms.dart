import 'package:app_blangkon_sqflite/widgets/default_app_bar.dart';
import 'package:app_blangkon_sqflite/widgets/named_text_field.dart';
import 'package:flutter/material.dart';

class Sms extends StatefulWidget {
  const Sms({super.key});

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  final TextEditingController smsController = TextEditingController(text: "");
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Container(
        margin: const EdgeInsets.all(8),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NamedTextField(controller: smsController, name: "Ketik Chat/SMS : "),
            const SizedBox(height: 30,),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    message = smsController.text;
                  });
                }, 
                child: const Text("Chat",style: TextStyle(color: Colors.indigo),)
              ),
            ),
            const SizedBox(height: 30,),
            Text(message,style: const TextStyle(color: Colors.indigo, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}