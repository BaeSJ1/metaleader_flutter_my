import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../util/config.dart';

class Repository extends GetConnect {
  final remoteApi = RemoteAPI();
  final localApi = LocalAPI();

}

class LocalAPI {
  late SharedPreferences sharedPreferences;


}

class RemoteAPI {
  static var client = http.Client();
  final GetConnect connect = GetConnect(
    timeout: const Duration(seconds: 10),
  );

  Map<String, String> getHeader() {
    print(Config.TOKEN);
    if (Config.TOKEN == '') {
      return {'X-AppKey': Config.APP_KEY};
    } else {
      return {
        'X-AppKey': Config.APP_KEY,
        'X-Authorization': Config.TOKEN,
      };
    }
  }
}
