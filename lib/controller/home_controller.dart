import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../data/user_info.dart';
import '../model/mytabpage.dart';
import '../model/repository.dart';
import '../util/screen_path.dart';
import '../view/setting.dart';

class HomeController extends GetxController {
  RxString initPageUrl = 'http://imssam.com'.obs;
  Repository repository = Repository();
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  RxList<WebStateInfo> webStateList = RxList([]);
  //RxList<Widget> tabs = RxList([]);
  final url = TextEditingController();
  var tabs = List.generate(1, (index) => '탭 ${index + 1}');
  final Map<int, Widget> tabPages = {};

  addTabs(int index) {
    tabs.add('탭 ${index + 1}');
    tabPages[index] = MyTabPage(tabIndex: index);
    update();
  }

  removeTabs(int index) {
    tabs.removeAt(index);
    update();
  }

  showSetting() {
    Get.toNamed(ScreenPath.setting)!.whenComplete(() => getInitPage());
  }

  goToURL(String url) {
    webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
  }

  goToHome() {
    webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(initPageUrl.value)));
  }

  goToTabPage(int tabIndex){
    if(tabPages.containsKey(tabIndex)){
      Get.to(() => tabPages[tabIndex]!);
    }
  }

  createWeb(InAppWebViewController web) {
    webViewController = web;
  }

  getInitPage() async{
    initPageUrl(await repository.getInitPage());
    url.text = initPageUrl.value;
  }
}
