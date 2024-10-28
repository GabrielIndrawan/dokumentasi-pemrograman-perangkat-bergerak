import 'classes.dart';
import 'nilaipbb.dart';

void main(){
  Persegi persegi = Persegi(p: 10, l: 5);
  int luas = persegi.getLuas();
  Segitiga segitiga = Segitiga(a: 12, t: 8);
  double kelilingSegitiga = segitiga.getKeliling();
  Lingkaran lingkaran = Lingkaran(r: 14);
  double kelilingLingkaran = lingkaran.getKeliling();
  print(luas);
  print(kelilingSegitiga);
  print(kelilingLingkaran);
  NilaiPPB nilaiPPB = NilaiPPB(nim: "A11.2022.13979", nama: "Gabriel Indrawan", nilaiTugas: 85, nilaiUts: 80, nilaiUas: 85);
  nilaiPPB.hitungNilai();
  nilaiPPB.getPredikat();
  nilaiPPB.cetakNilai();
}