import 'package:flutter/material.dart';
import 'package:app_blangkon_sqflite/models/produk.dart';
import 'package:app_blangkon_sqflite/pages/edit_profile.dart';
import 'package:app_blangkon_sqflite/pages/form_pembayaran.dart';
import 'package:app_blangkon_sqflite/pages/maps.dart';
import 'package:app_blangkon_sqflite/pages/sms.dart';
import 'package:app_blangkon_sqflite/pages/telpon.dart';
import 'package:app_blangkon_sqflite/widgets/desc_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late SharedPreferences prefs;
  int total = 0;
  late List<double> opa = List.filled(products.length, 1);
  

  @override
  void initState() {
    super.initState();
    initSharedPrefs();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text("Blangkon", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 15), ),
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Sms()));}, icon: const Icon(Icons.call, color: Colors.white, size: 15,)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Telephone()));}, icon: const Icon(Icons.sms, color: Colors.white, size: 15)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Maps()));}, icon: const Icon(Icons.map, color: Colors.white, size: 15)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));}, icon: const Icon(Icons.account_box, color: Colors.white, size: 15)),
        ],
        leading: Center(
          child: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: initSharedPrefs(),
            builder:(context,snapshot) => Container(
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Text("Halo ! ${prefs.getString("username")}",style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 20),),
            ),
          ),
          SizedBox(
            height: 532.5,
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.825,),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return DescDialog(title: products[index].nama,image: products[index].gambar,description: products[index].deskripsi);
                              });
                            },
                            child: Text(products[index].nama, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15,),textAlign: TextAlign.center,)
                          )
                        ),
                        SizedBox(
                          height: 120,
                          child: GestureDetector(
                            onTapUp: (details) {
                              setState(() {
                                opa[index] = 1;
                              });
                            },
                            onTapDown:(details) {
                              setState(() {
                                opa[index] = 0.7;
                              });
                            },
                            onTap: (){
                              setState(() {
                                total += products[index].harga;
                              });
                            },
                            child: Opacity(
                              opacity: opa[index],
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, style: BorderStyle.solid, width: 5),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(17.5),
                                  child: Image.asset(products[index].gambar,width: 120, fit: BoxFit.fill,)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("Harga : ${products[index].harga}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15))
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        height: 60,
        child: Center(
          child: GestureDetector(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context) => FormPembayaran(cost: total,)));},
            child: Text("Total : $total", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),)
          ),
        ),
      ),
    );
  }

  Future<void> initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}