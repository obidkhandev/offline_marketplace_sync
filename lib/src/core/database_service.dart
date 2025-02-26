import 'package:hive/hive.dart';

class DatabaseService<T> {
  final String boxName;

  DatabaseService(this.boxName);

  /// **Ma'lumotni saqlash**
  Future<void> saveData(String key, T data) async {
    var box = await Hive.openBox<T>(boxName);
    await box.put(key, data);
  }

  /// **Ma'lumotni olish**
  Future<T?> getData(String key) async {
    var box = await Hive.openBox<T>(boxName);
    return box.get(key);
  }

  /// **Barcha ma'lumotlarni olish**
  Future<List<T>> getAllData() async {
    var box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }

  /// **Ma'lumotni o'chirish**
  Future<void> deleteData(String key) async {
    var box = await Hive.openBox<T>(boxName);
    await box.delete(key);
  }

  /// **Barcha ma'lumotlarni tozalash**
  Future<void> clearData() async {
    var box = await Hive.openBox<T>(boxName);
    await box.clear();
  }
}
