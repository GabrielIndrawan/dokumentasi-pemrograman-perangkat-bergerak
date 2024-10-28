import 'package:flutter/material.dart';
import 'package:menu_makanan/models/menu.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int total = 0;
  late List<double> opa = List.filled(menus.length, 1);
  List<Menu> menus= [
    Menu(nama: "Ayam geprek", deskripsi: "muantabs", harga: 10000, gambar: "assets/images/ayam_geprek.jpg"),
    Menu(nama: "Ayam goreng", deskripsi: "muantabs", harga: 20000, gambar: "assets/images/ayam_goreng.jpg"),
    Menu(nama: "Ayam bakar", deskripsi: "muantabs", harga: 10000, gambar: "assets/images/ayam_bakar.jpg"),
    Menu(nama: "Ayam madu", deskripsi: "muantabs", harga: 20000, gambar: "assets/images/ayam_madu.jpg"),
    Menu(nama: "Ayam crispy", deskripsi: "muantabs", harga: 10000, gambar: "assets/images/ayam_crispy.jpg"),
    Menu(nama: "Ayam pejantan", deskripsi: "muantabs", harga: 20000, gambar: "assets/images/ayam_pejantan.jpg"),
  ];
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Ayam Ku", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), ),
      ),
      body: GridView.builder(
        
        itemCount: menus.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(menus[index].nama, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),)
                  ),
                  GestureDetector(
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
                        total += menus[index].harga;
                      });
                    },
                    child: Opacity(
                      opacity: opa[index],
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, style: BorderStyle.solid, width: 7),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17.5),
                          child: Image.asset(menus[index].gambar,width: 350, height: 300, fit: BoxFit.fill,)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Harga : ${menus[index].harga}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20))
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Center(
          child: Text("Total : ${total}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
        ),
      ),
    );
  }
}