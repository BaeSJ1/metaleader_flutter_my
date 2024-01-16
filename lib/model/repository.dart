import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../util/config.dart';

class Repository extends GetConnect {
  final remoteApi = RemoteAPI();
  final localApi = LocalAPI();

  setInitPage(String url) => localApi.setInitPage(url);
  getInitPage() => localApi.getInitPage();

}

class LocalAPI {
  late SharedPreferences sharedPreferences;

  setInitPage(String url) async{
    sharedPreferences = await SharedPreferences.getInstance();
    bool isSuccess = await sharedPreferences.setString(Config.INIT_URL, url);
    return isSuccess;
  }

  getInitPage() async{
    sharedPreferences = await SharedPreferences.getInstance();
    String? url = sharedPreferences.getString(Config.INIT_URL);
    if(url == null){
      return 'http://home.imssam.com/';
    } else {
      return url;
    }
  }


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