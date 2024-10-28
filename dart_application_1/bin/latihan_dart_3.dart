void main(List<String> arguments){
  var mahasiswa = Mahasiswa(nim: "A11.2022.66666", nama: "Joni", nilaiUTS: 90, nilaiTugas: 75, nilaiUAS: 75);
  mahasiswa.cetakNilai();
  print(mahasiswa.getPredikat());
}

class Mahasiswa{
  String nim, nama;
  double nilaiUTS, nilaiTugas, nilaiUAS;
  late double nilaiAkhir;
  late String nHuruf, predikat;

  Mahasiswa({required this.nim, required this.nama, required this.nilaiUTS, required this.nilaiTugas, required this.nilaiUAS});

  double hitungNilai(){
    return 0.3*nilaiUTS+0.35*nilaiTugas+0.35*nilaiUAS;
  }

  void cetakNilai(){
    print(this.hitungNilai());
  }

  String getPredikat(){
    if(hitungNilai()<50){
      nHuruf = "E";
    }else if(hitungNilai()<=60){
      nHuruf = "D";
    }else if(hitungNilai()<65){
      nHuruf = "C";
    }else if(hitungNilai()<70){
      nHuruf = "BC";
    }else if(hitungNilai()<80){
      nHuruf = "B";
    }else if(hitungNilai()<85){
      nHuruf = "AB";
    }else{
      nHuruf = "A";
    }

    switch(nHuruf){
      case 'E' :
        predikat = "sangat buruk";
        break;
      case 'D' :
        predikat = "buruk";
        break;
      case 'C' :
        predikat = "kurang";
        break;
      case 'BC' :
        predikat = "cukup";
        break;
      case 'B' :
        predikat = "baik";
        break;
      case 'AB' :
        predikat = "sangat baik";
        break;
      case 'A' :
        predikat = "sempurna";
        break;    
    }
    return predikat;
  }
}