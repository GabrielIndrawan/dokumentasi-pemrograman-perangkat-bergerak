import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FormulirNilai extends StatefulWidget {
 const FormulirNilai({super.key});
 @override
 State<StatefulWidget> createState() => _FormulirNilaiState();
}
class _FormulirNilaiState extends State<FormulirNilai> {
 final tugasController =
 TextEditingController.fromValue(TextEditingValue(text:
0.toString())),
 utsController =
 TextEditingController.fromValue(TextEditingValue(text:
0.toString())),
 uasController =
 TextEditingController.fromValue(TextEditingValue(text:
0.toString())),
 mhs = Mahasiswa(0, 0, 0);
 @override
 Widget build(BuildContext context) {
 return Column(crossAxisAlignment: CrossAxisAlignment.start,
children: [
 TextField(
 decoration: const InputDecoration(
 border: OutlineInputBorder(),
 labelText: "NIM Mahasiswa",
 )),
 const SizedBox(height: 7),
 TextField(
 decoration: const InputDecoration(
 border: OutlineInputBorder(),
 labelText: "Nama Mahasiswa",
 )),
 const SizedBox(height: 7),
 TextField(
 controller: tugasController,
 onChanged: (value) {
 updateNilai("tugas", double.tryParse(value) ?? 0.0);
 },
 decoration: const InputDecoration(
 border: OutlineInputBorder(),
 labelText: "Nilai Tugas",
 )),
 const SizedBox(height: 7),
 TextField(
 controller: utsController,
 onChanged: (value) {
 updateNilai("uts", double.tryParse(value) ?? 0.0);
 },
 decoration: const InputDecoration(
 border: OutlineInputBorder(),
 labelText: "Nilai UTS",
 )),
 const SizedBox(height: 7),
 TextField(
 controller: uasController,
 onChanged: (value) {
 updateNilai("uas", double.tryParse(value) ?? 0.0);
 },
 decoration: const InputDecoration(
 border: OutlineInputBorder(),
 labelText: "Nilai UAS",
 )),
 const SizedBox(height: 7),
 Text("Nilai Akhir", style:
Theme.of(context).textTheme.labelSmall),
 Text("${mhs.nilaiAkhir}", style:
Theme.of(context).textTheme.bodyLarge),
 const SizedBox(height: 7),
 Text("Nilai Huruf", style:
Theme.of(context).textTheme.labelSmall),
 Text("${mhs.nilaiHuruf}", style:
Theme.of(context).textTheme.bodyLarge),
 const SizedBox(height: 7),
 Text("Predikat", style: Theme.of(context).textTheme.labelSmall),
 Text("${mhs.predikat}", style:
Theme.of(context).textTheme.bodyLarge),
 ]);
 }
 void updateNilai(String key, double value) {
 setState(() {
 switch (key) {
 case "tugas":
 mhs.nilaiTugas = value;
 break;
 case "uts":
 mhs.nilaiUts = value;
 break;
 case "uas":
 mhs.nilaiUas = value;
 break;
 }
 mhs.hitungNilai();
 });
 }
}

class Mahasiswa {
 // atribut inisial
 double nilaiTugas, nilaiUts, nilaiUas;
 // atribut komposit
 String? nilaiHuruf, predikat;
 double? pNilaiTugas, pNilaiUts, pNilaiUas, nilaiAkhir;
 Mahasiswa(this.nilaiTugas, this.nilaiUts, this.nilaiUas) {
 hitungNilai();
 }
 void hitungNilai() {
 pNilaiTugas = 35 / 100 * nilaiTugas;
 pNilaiUts = 30 / 100 * nilaiUts;
 pNilaiUas = 35 / 100 * nilaiUas;
 nilaiAkhir = pNilaiTugas! + pNilaiUts! + pNilaiUas!;
 if (nilaiAkhir! > 85) {
 nilaiHuruf = 'A';
 predikat = "Sempoerna";
 } else if (nilaiAkhir! > 80) {
 nilaiHuruf = 'AB';
 predikat = "Sangat Baik";
 } else if (nilaiAkhir! > 70) {
 nilaiHuruf = 'B';
 predikat = "Baik";
 } else if (nilaiAkhir! > 60){
 nilaiHuruf = 'C';
 predikat = "Cukup";
 }else{
  nilaiHuruf = 'D';
  predikat = "Kurang";
 }
 }
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
  debugShowCheckedModeBanner: false,
 title: 'Flutter Demo',
 theme: ThemeData(
 // This is the theme of your application.
 //
 // TRY THIS: Try running your application with "flutter run". You'll see
 // the application has a blue toolbar. Then, without quittingthe app,
 // try changing the seedColor in the colorScheme below toColors.green
 // and then invoke "hot reload" (save your changes or press the"hot
 // reload" button in a Flutter-supported IDE, or press "r" ifyou used
 // the command line to start the app).
 //
 // Notice that the counter didn't reset back to zero; theapplication
 // state is not lost during the reload. To reset the state, usehot
 // restart instead.
 //
 // This works for code too, not just values: Most code changes can be
 // tested with just a hot reload.
 colorScheme: ColorScheme.fromSeed(seedColor:
Colors.deepPurple),
 useMaterial3: true,
 ),
 home: const Scaffold(
 body: Padding(padding: EdgeInsets.all(7), child:
FormulirNilai())),
 );
 }
}