import 'package:flutter/material.dart';

import '../core/database_service.dart';
import '../core/network_service.dart';

class SyncManager<T> {
  final DatabaseService<T> db;
  final NetworkService api;
  final String syncUrl;

  SyncManager({required this.db, required this.api, required this.syncUrl});

  Future<void> syncData(String key, T data) async {
    await db.saveData(key, data);

    if (await api.hasInternetConnection()) {
      try {
        await api.uploadData(syncUrl, data);
        await db.clearData();
      } catch (e) {
        debugPrint("Sync error: $e");
      }
    }
  }
}
