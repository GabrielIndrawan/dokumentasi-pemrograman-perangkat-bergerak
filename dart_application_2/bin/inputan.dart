
import 'dart:io';

void main(){
  stdout.write("Nama Anda : ");
  var nama = stdin.readLineSync();
  stdout.write("Umur      : ");
  var umur = stdin.readLineSync();
  var usia = int.parse('$umur');
  print("Nama      : $nama");
  print("Umur      : $umur");
  print(umur.runtimeType);
  print(usia.runtimeType);
}