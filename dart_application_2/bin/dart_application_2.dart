
void main(List<String> arguments) {
  Mahasiswa mhs = Mahasiswa();
  mhs.nim ="A11.2022.13979";
  mhs.nama = "Gabriel Indrawan";
  mhs.ipk = 3.57;
  mhs.view();
  Mahasiswa mhs2 = Mahasiswa();
  mhs2.nim ="A11.2022.13980";
  mhs2.nama = "Ucup Surucup";
  mhs2.ipk = 3.8;
  mhs2.view();
}

class Mahasiswa{
  String nim="", nama="";
  double ipk = 0;

  Mahasiswa(){
    print("~~~~ Data Mahasiswa ~~~~");
  }

  void view(){
    print("NIM  : $nim");
    print("Nama : $nama");
    print("IPK  : $ipk");
  }
}