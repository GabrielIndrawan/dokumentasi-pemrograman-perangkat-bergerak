import 'package:app_blangkon_sqflite/models/produk.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBInstance{
  Database? _database;
  final _instance = DBInstance();
  final String tableName = 'produk';
  final String columnId = 'id';
  final String columnNama = 'nama';
  final String columnDeskripsi = 'deskripsi';
  final String columnHarga = 'harga';
  final String columnGambar = 'gambar';

  DBInstance();

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'product.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql =
        "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, "
        "$columnNama TEXT,"
        "$columnDeskripsi TEXT,"
        "$columnHarga TEXT,"
        "$columnGambar TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveProduk(Product product) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, product.toMap());
  }

//read database
  Future<List?> getAllProduk() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnNama,
      columnDeskripsi,
      columnHarga,
      columnGambar
    ]);
    return result.toList();
  }

//update database
  Future<int?> updateProduk(Product product) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, product.toMap(),
        where: '$columnId = ?', whereArgs: [product.getId]);
  }

//hapus database
  Future<int?> deleteProduk(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}