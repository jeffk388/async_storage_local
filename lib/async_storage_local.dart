library async_storage_local;

import 'package:shared_preferences/shared_preferences.dart';


class AsyncStorageLocal {
  final String keyFile;

  AsyncStorageLocal({
    required this.keyFile,
  });

  Future<String> saveString(String dataString) async {
    final storage=await SharedPreferences.getInstance();
    storage.setString(keyFile,dataString);
    return dataString;
  }

  Future<String> readString() async {
    final storage=await SharedPreferences.getInstance();
    String data='';
    data =storage.getString(keyFile) ?? '';
    return data;
  }

  Future<String> delete() async {
    final storage=await SharedPreferences.getInstance();
    await storage.remove(keyFile);
    return keyFile;
  }
}

