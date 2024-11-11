import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text("Resto Padang Maju", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Image.asset("assets/rumah makan padang.jpg",height: 200,width: 300,fit: BoxFit.cover,)
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 100,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.email, color: Colors.black,size: 30,),
                    Icon(Icons.map, color: Colors.black,size: 30,)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Deskripsi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    Text("lorem lorem lorem lorem lorem"),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("List Menu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Text("Makanan $index");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alamat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    Text("lorem lorem lorem lorem lorem"),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jam buka", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    Text("lorem lorem lorem lorem lorem"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
