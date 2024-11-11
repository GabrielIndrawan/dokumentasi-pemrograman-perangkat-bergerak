import 'package:flutter/material.dart';

class NamedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  const NamedTextField({super.key, required this.controller, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.indigo, width: 2)
          ),
          child: TextField(
            maxLength: 30,
            controller: controller,
            decoration: const InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.indigo, width: 3)
              )
            )
          ),
        )
      ],
    ); 
  }
}