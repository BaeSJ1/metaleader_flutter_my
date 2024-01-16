import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metaleader/model/repository.dart';

class SettingController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  Repository repository = Repository();
  RxString initPage = ''.obs;
  RxString homePage ='http://home.imssam.com'.obs;

  setInitPage(String url) async{
    await repository.setInitPage(url);
  }

  getInitpage() async {
    textEditingController.text = await repository.getInitPage();
  }

  @override
  void onInit() {
    super.onInit();
  }

}