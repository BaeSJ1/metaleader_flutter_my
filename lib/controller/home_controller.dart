import 'package:get/get.dart';

import '../model/repository.dart';
import '../util/config.dart';

class HomeController extends GetxController {
  RxString message = ''.obs;
  Repository repository = Repository();

  textchange() {
    message('test');
    message('aaaaa');
  }
}