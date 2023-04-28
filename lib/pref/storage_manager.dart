import 'package:get_storage/get_storage.dart';

class StorageManager {
  final GetStorage _pref = GetStorage();

  Future<void> storePref(dynamic keyName, dynamic keyValue) async {
    await _pref.write(keyName, keyValue);
  }

  dynamic getPref(dynamic keyName) {
    return _pref.read(keyName);
  }
  Future<void> removePref() async {
   await _pref.erase();
  }
}
