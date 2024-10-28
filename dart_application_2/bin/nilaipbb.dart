class NilaiPPB{
  String nim = "", nama ="", huruf="", predikat="";
  double nilaiUts =0,
  nilaiUas =0,
  nilaiTugas =0,
  pNilaiUts =0,
  pNilaiUas =0,
  pnilaiTugas =0,
  Nilaiakhir =0;

  NilaiPPB({required this.nim, required this.nama, required this.nilaiTugas, required this.nilaiUts, required this.nilaiUas});

  void cetakNilai(){
    print("~~~~~ Nilai Mahasiswa ~~~~~");
    print("NIM         : $nim");
    print("Nama        : $nama");
    print("Nilai akhir : $Nilaiakhir");
    print("Huruf       : $huruf");
    print("Predikat    : $predikat");
  }

  double callName(){
    return Nilaiakhir;
  }
  
  void hitungNilai(){
    pnilaiTugas = 0.35 * nilaiTugas;
    pNilaiUts = 0.3 * nilaiUts;
    pNilaiUas = 0.35 * nilaiUas;
    Nilaiakhir = pNilaiUas + pNilaiUts + pnilaiTugas;
  }

  String getPredikat(){
    if(Nilaiakhir<50){
      huruf = "E";
    }else if(Nilaiakhir<=60){
      huruf = "D";
    }else if(Nilaiakhir<65){
      huruf = "C";
    }else if(Nilaiakhir<70){
      huruf = "BC";
    }else if(Nilaiakhir<80){
      huruf = "B";
    }else if(Nilaiakhir<85){
      huruf = "AB";
    }else{
      huruf = "A";
    }

    switch(huruf){
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