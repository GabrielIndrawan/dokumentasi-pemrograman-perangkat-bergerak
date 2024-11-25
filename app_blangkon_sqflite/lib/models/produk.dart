class Product {
  int _id = 0;
  String _nama;
  String _deskripsi;
  int _harga;
  String _gambar;

  Product(
   this._id,
   this._nama,
   this._deskripsi,
   this._harga,
   this._gambar,
  );

  int get getId => _id;
  String get getNama => _nama;
  String get getDeskripsi => _deskripsi;
  int get getHarga => _harga;
  String get getGambar => _gambar;
// setter

  set setNama(String value) {
    _nama = value;
  }

  set setDeskripsi(String value) {
    _deskripsi = value;
  }

  set setHarga(int value) {
    _harga = value;
  }

  set setGambar(String value) {
    _gambar = value;
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['nama'] = _nama;
    map['deskripsi'] = _deskripsi;
    map['harga'] = _harga;
    map['gambar'] = _gambar;
    return map;

  }
}