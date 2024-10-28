

void main(List<String> arguments) {
  double hitungPersegi({required double panjangSisi, bool keliling = false}) {
    if(keliling){
      return panjangSisi*4;
    }else{
      return panjangSisi*panjangSisi;
    }
  }

  double hitungLingkaran({required double jarijari, bool keliling = false}) {
    if(keliling){
      return jarijari*2*22/7;
    }else{
      return jarijari*jarijari*22/7;
    }
  }
  double hitungKubus({required double panjangSisi, bool luasPermukaan = false}) {
    if(luasPermukaan){
      return panjangSisi*panjangSisi*6;
    }else{
      return panjangSisi*panjangSisi*panjangSisi;
    }
  }

  int a = 5, t = 7;
  double luas;
  luas = 0.5 * a * t;
  print("Alas   : $a");
  print("Tinggi : $t");
  print("Luas   : $luas");
  print(hitungPersegi(panjangSisi: 7));
  print(hitungLingkaran(jarijari: 7));
  print(hitungKubus(panjangSisi: 6));
}
