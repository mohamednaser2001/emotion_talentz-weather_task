// connectivity_helper.dart
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> internetConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}
