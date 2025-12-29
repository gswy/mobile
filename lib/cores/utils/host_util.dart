
import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/value/host_constants.dart';

class HostUtil {
  HostUtil._();

  static Future<void> store(String host) async {
    await LocalStore.setString(HostConstants.hostKey, host);
  }

  static Future<void> clean() async {
    await LocalStore.remove(HostConstants.hostKey);
  }

  static String getHost() {
    return LocalStore.getString(HostConstants.hostKey) ?? '';
  }

  static String getHttp() {
    final host = LocalStore.getString(HostConstants.hostKey);
    return 'https://$host';
  }

  static String getWS() {
    final host = LocalStore.getString(HostConstants.hostKey);
    if (host == null) {
      return '';
    }
    return 'wss://$host/ws';
  }

}