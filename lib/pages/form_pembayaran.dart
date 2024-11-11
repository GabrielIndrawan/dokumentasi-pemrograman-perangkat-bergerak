
import 'package:flutter/material.dart';

class FormPembayaran extends StatefulWidget {
  final int cost;
  const FormPembayaran({super.key,required this.cost});

  @override
  State<FormPembayaran> createState() => _FormPembayaranState();
}

class _FormPembayaranState extends State<FormPembayaran> {
  TextEditingController controller = TextEditingController(text: "0"), controllerAlamat = TextEditingController();
  String warning = "";
  late int kembalian;
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
            const Text("Alamat pembeli : "),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo, width: 2)
              ),
              child: TextField(
                controller: controllerAlamat,
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
            Center(
              child: ElevatedButton(
                onPressed: bayar, 
                child: const Text("Bayar", style: TextStyle(color: Colors.indigo),)
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Kembalian : ${(kembalian<0)?"0":kembalian.toString()}", style: const TextStyle(color: Colors.indigo),),
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

  void bayar(){
    if(widget.cost<=int.parse(controller.text)){
      setState(() {
        kembalian = int.parse(controller.text)-widget.cost;
        warning = "Transaksi berhasil. Barang akan dikirim ke ${controllerAlamat.text}";
      });
    }else{
      setState(() {
        warning = "Maaf dana tidak mencukupi...";
      });
    }
  }
}