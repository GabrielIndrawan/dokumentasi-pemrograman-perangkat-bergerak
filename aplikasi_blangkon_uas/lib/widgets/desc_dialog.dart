import 'package:flutter/material.dart';

class DescDialog extends Dialog{
  final String title;
  final String image;
  final String description;
  const DescDialog({super.key,required this.title,required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset(image,width: 300,height: 260,fit: BoxFit.fill,),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(3),
                child: Text(title,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              )
            ),
            Container(
              height: 330,
              padding: const EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Text(description, textAlign: TextAlign.justify,)
              )
            ),
          ],
        ),
      ),
    );
  }
}