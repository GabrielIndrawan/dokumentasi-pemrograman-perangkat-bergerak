import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/produk.dart';
import 'package:flutter_application_1/pages/edit_profile.dart';
import 'package:flutter_application_1/pages/form_pembayaran.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/pages/maps.dart';
import 'package:flutter_application_1/pages/sms.dart';
import 'package:flutter_application_1/pages/telpon.dart';
import 'package:flutter_application_1/widgets/desc_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String user="";
  late SharedPreferences prefs;
  int total = 0;
  List<String> produkDibeli = [];
  late List<double> opa = List.filled(products.length, 1);
  List<Product> products= [
    Product(nama: "Blangkon Yogyakarta", deskripsi: "Bentuk blangkon dengan gaya Yogyakarta memiliki ciri yang mudah ditebak yaitu apabila di bagian belakang terdapat mondolan. Mondolan merupakan istilah yang digunakan untuk menyebut tonjolan yang ada di belakang blangkon. Mondolan itu berbentuk bulatan yang berisi kain dan menonjol sebesar telur, nah berarti itu adalah ciri blangkon model Jogja. Untuk blangkon model ini biasanya dikenakan oleh para bangsawan keraton di wilayah Yogyakarta. Sekarang juga banyak para pengrajin blangkon jogja yang memproduksi untuk dapat dijual atau bisa digunakan sebagai Souvenir perusahaan eksklusif.", harga: 10000, gambar: "assets/products/blangkon-yogyakarta.jpg"),
    Product(nama: "Blangkon Solo", deskripsi: "Blangkon Solo dikenal mulai Pakubuwono III, setelah terjadinya Perjanjian Giyanti. Sebelumnya, blangkon Solo memiliki bentuk seperti blangkon Yogyakarta, salah satunya memiliki ciri mondolan. Jika, Yogyakarta hanya memiliki 1 model blangkon, Solo memiliki 6 model blangkon. Batik yang digunakan untuk blangkon Solo ada beberapa jenis, yaitu motif Solo muda atau motif keprabon, motif kesatrian, motif perbawan, motif dines, maupun motif tempen", harga: 20000, gambar: "assets/products/blangkon-solo.jpg"),
    Product(nama: "Blangkon Banyumasan", deskripsi: "Ciri khas utama belangkon ini adalah motifnya menyerupai batik Pekalongan yang eksotis. Secara garis besar, belangkon Banyumasan terbagi lagi menjadi dua model, yaitu wiriatmajan dan ginoan. Kedua jenis belangkon ini biasa dipakai masyarakat pada acara formal. Namun, masyarakat yang mencari belangkon Banyumasan yang lebih kasual dapat memilih model seodirmanan.", harga: 10000, gambar: "assets/products/blangkon-banyumasan.jpg"),
    Product(nama: "Blangkon Warok", deskripsi: "Blangkon Jawa Timur yang lain adalah blangkon Warok Ponoragan. Ini merupakan blangkon khas dari Kota Ponorogo. Blangkon ini sering kali dipakai oleh sosok warok dalam tradisi Reog Ponorogo. Blangkon Warok Ponoragan ini punya ciri khas yakni warnanya yang didominasi oleh hitam. Aksen batik berwarna putih hanya terlihat di lipatan kain sisi kiri dan kanan blangkon.", harga: 20000, gambar: "assets/products/blangkon-warok.jpg"),
    Product(nama: "Blangkon Ublank", deskripsi: "Ublank merupakan penutup kain khas Jember yang memadukan dua unsur budaya daerah. Ublank merupakan singkatan dari udeng dan blangkon. Udeng sendiri merupakan istilah penutup kepala dalam adat Madura, sementara blangkon adalah penutup kepala yang kental ada Jawa. Karena itu, Ublank Jember ini merupakan salah satu wujud dari budaya pendhalungan atau akulturasi antara budaya Jawa dan Madura. Ublank sendiri awalnya identik digunakan oleh masyarakat kelas menengah ke bawah di pinggiran Kota Jember.", harga: 10000, gambar: "assets/products/blangkon-ublank.jpg"),
    Product(nama: "Blangkon Pacul Guwung Sidoarjo", deskripsi: "Blangkon Pacul Gowang dengan nama unik adalah penutup kepala khas Sidoarjo. Secara bentuk, Blangkon Pacul Gowang ini lebih condong ke arah model udheng dari Madura. Hanya saja, punya ciri khas yakni penutup rambut atau kepala bagian atas yang hanya menutupi setengah dan memiliki lubang. Karena itu, blangkon ini dimakan pacul gowang karena bentuk atasnya yang mirip dengan pacul atau cangkul yang sudah berlubang. Blangkon Pacul Gowang ini juga memiliki warna yang cenderung mencolok seperti merah, hijau, hingga kuning. Dengan variasi corak batik khas Sidoarjo yakni batik beras utah kembang bayeng rawan wungu dan bunga kenanga.", harga: 20000, gambar: "assets/products/blangkon-pacul-gowang-sidoarjo.jpg"),
  ];

  Future fetchProduct() async {
    try{
      var result = await http.get(Uri.parse("http://localhost/server_uas_flutter/fetchProduct.php"));
      if (result.statusCode == 200) {
      // If successful, parse the JSON

      final data = jsonDecode(result.body);
      setState(() {
        products = data;
      });
      print(products);
    } else {
      // If the result is not successful, handle the error
      print('Request failed with status: ${result.statusCode}');
      print('result body: ${result.body}');
    }
  } catch (e) {
    // Catch any other errors, e.g., network issues
    print('Error: $e');
  }
  }

  @override
  void initState() {
    super.initState();
    initSharedPrefs();
    fetchProduct();
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
          FutureBuilder(
            future: initSharedPrefs(),
            builder:(context,snapshot) => IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage(user)));}, icon: const Icon(Icons.history, color: Colors.white, size: 15)),
          ),
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
              child: Text("Halo ! ${user}}",style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 20),),
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
                                produkDibeli.add(products[index].nama);
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
            onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context) => FormPembayaran(cost: total,barangDibeli: produkDibeli,)));},
            child: Text("Total : $total", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),)
          ),
        ),
      ),
    );
  }

  Future<void> initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString("username") ?? "";
    });
  }
}