
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/model_kota.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';

class FormPembayaran extends StatefulWidget {
  final int cost;
  final List<String> barangDibeli;
  var strKey = "ec2b3da1632cf17996a1324eef63e3b7";
  var strKotaAsal = "398";
  var strKotaTujuan;
  var strEkspedisi = "jne";
  FormPembayaran({super.key,required this.cost, required this.barangDibeli});

  @override
  State<FormPembayaran> createState() => _FormPembayaranState();
}

class _FormPembayaranState extends State<FormPembayaran> {
  TextEditingController controller = TextEditingController(text: "0");
  String warning = "";
  int kembalian = 0;
  var ongkos;
  Future getData() async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://api.rajaongkir.com/starter/cost",
        ),
        body: {
          "key": widget.strKey,
          "origin": widget.strKotaAsal,
          "destination": widget.strKotaTujuan,
          "weight": (100*widget.barangDibeli.length).toString(),
          "courier": widget.strEkspedisi,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        setState(() {
          ongkos = data['rajaongkir']['results'][0]['costs'];
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future get() async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://api.rajaongkir.com/starter/cost",
        ),
        body: {
          "key": widget.strKey,
          "origin": widget.strKotaAsal,
          "destination": widget.strKotaTujuan,
          "weight": (100*widget.barangDibeli.length).toString(),
          "courier": widget.strEkspedisi,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        setState(() {
          ongkos = data['rajaongkir']['results'][0]['costs'];
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future addData() async {
    try {
      final response = await http.post(
        Uri.parse(
          "http://localhost/server_uas_flutter/addSells.php",
        ),
        body: {
          "barang": widget.barangDibeli,
          "biaya": widget.cost,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        setState(() {
          ongkos = data['rajaongkir']['results'][0]['costs'];
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back, color: Colors.white,)
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 10,top: 10),
        width: 340,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Total Pembelian : "),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo, width: 2)
              ),
              child: TextField(
                controller: TextEditingController(text: widget.cost.toString()),
                readOnly: true,
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
            const Text("Uang yang dibayarkan : "),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo, width: 2)
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo, width: 2)
              ),
              child: DropdownSearch<ModelKota>(
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Kota Anda",
                    hintText: "Pilih Kota Anda",
                  ),
                ),
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                onChanged: (value) {
                  widget.strKotaTujuan = value?.cityId;
                },
                itemAsString: (item) => "${item.type} ${item.cityName}",
                asyncItems: (text) async {
                  var response = await http.get(Uri.parse("https://api.rajaongkir.com/starter/city?key=${widget.strKey}"));
                  List allKota = (jsonDecode(response.body) as Map<String, dynamic>)['rajaongkir']['results'];
                  var dataKota = ModelKota.fromJsonList(allKota);
                  return dataKota;
                },
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                onPressed: bayar, 
                child: const Text("Bayar", style: TextStyle(color: Colors.indigo),)
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    // File details
                    String fileName = result.files.single.name;
                    String? filePath = result.files.single.path;

                    print("File Name: $fileName");
                    print("File Path: $filePath");
                  } else {
                    // User canceled the picker
                    print("No file selected.");
                  }
                },
                child: Text("Pick a File"),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Kembalian : ${(kembalian<0)?"0":kembalian.toString()}", style: const TextStyle(color: Colors.indigo),),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Ongkos kirim : ${(ongkos==null)?0:ongkos[1]['cost'][0]['value']}", style: const TextStyle(color: Colors.indigo),),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(warning, style: const TextStyle(color: Colors.indigo),),
            )
          ]
        ),
      )
    );
  }

  void bayar()async{
    if(widget.cost<=int.parse(controller.text)){
      await getData();
      addData();
      setState(() {
        kembalian = int.parse(controller.text)-widget.cost;
        warning = "Transaksi berhasil. Nota telah dibuat";
      });
    }else{
      setState(() {
        warning = "Maaf dana tidak mencukupi...";
      });
    }
  }
}