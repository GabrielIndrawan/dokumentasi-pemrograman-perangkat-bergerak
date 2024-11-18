import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SQLite Example",
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  open() async {
    final db = await openDatabase(
      "contact_database.db",
      onCreate: (db,version){
        return db.execute('CREATE TABLE contacts IF NOT EXISTS(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, email TEXT, company TEXT)');
      },
      version: 1
    );
    return db;
  }
  
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  late Database db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter SQLite Example')), 
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
        // input email
        TextField(
          controller: idController,
          decoration: InputDecoration(
            labelText: "id",
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)))
        ),
        const Padding(padding: EdgeInsets.only(top: 4)),
        // input password
        TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: "Name",
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)))
        ),
        const Padding(padding: EdgeInsets.only(top: 4)),
        // input password
        TextField(
        controller: phoneController,
        decoration: InputDecoration(
          labelText: "Phone",
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)))
        ),
        const Padding(padding: EdgeInsets.only(top: 4)),
        // input password
        TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: "Email",
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)))
        ),
        const Padding(padding: EdgeInsets.only(top: 4)),
        // input password
        TextField(
        controller: companyController,
        decoration: InputDecoration(
          labelText: "Company",
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)))
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        ElevatedButton(
          child: const Text("Daftar"),
          onPressed: () {
            insertIntoSQLite();
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        ElevatedButton(
          child: const Text("Lihat Kontak"),
          onPressed: () {
            getFromSQLite();
          },
        ),]
      )
    );
  }

 void insertIntoSQLite() async {
  db = await open();
  await db.insert("contacts", {
    "id": int.parse(idController.text),
    "name": nameController.text,
    "phone": phoneController.text,
    "email": emailController.text,
    "company": companyController.text,
  });
 }

 void getFromSQLite() async {
  
 } 

}