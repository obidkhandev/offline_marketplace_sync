import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkService {
  /// **Internet mavjudligini tekshirish**
  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// **Ma'lumotlarni serverga yuklash**
  Future<void> uploadData(String url, dynamic data) async {
    if (!await hasInternetConnection()) {
      throw Exception("Internet mavjud emas");
    }
    await http.post(Uri.parse(url), body: data);
  }
}