class Contact {
  int _id=0;
  String _name="";
  String _phone="";
  String _email="";
  String _company="";
  // konstruktor versi 1
  Contact(this._name, this._phone, this._email, this._company);
  // konstruktor versi 2: konversi dari Map ke Contact
  Contact.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _phone = map['phone'];
    _email = map['email'];
    _company = map['company'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get email => _email;
  String get company => _company;
  // setter
  set name(String value) {
   _name = value;
  }
  set phone(String value) {
   _phone = value;
  }
  set email(String value) {
   _email = value;
  }
  set company(String value) {
   _company = value;
  }
  
  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
   Map<String, dynamic> map = Map<String, dynamic>();
   map['id'] = _id;
   map['name'] = name;
   map['phone'] = phone;
   map['email'] = email;
   map['company'] = company;
   return map;
  }
}