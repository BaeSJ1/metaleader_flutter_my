import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../data/user_info.dart';
import '../model/repository.dart';
import '../util/screen_path.dart';
import '../view/setting.dart';

class HomeController extends GetxController {
  RxString initPageUrl = 'http://imssam.com'.obs;
  Repository repository = Repository();
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  RxList<WebStateInfo> webStateList = RxList([]);
  RxList<Widget> tabs = RxList([]);
  final url = TextEditingController();

  addTabs() {
    tabs.add(Container(
      width: 120,
      child: Row(
        children: [
          Text('탭'),
          SizedBox(
            width: 58,
          ),
          IconButton(
              onPressed: () {
                removeTabs();
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
    ));
  }

  removeTabs() {
    tabs.removeAt(0);
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

  createWeb(InAppWebViewController web) {
    webViewController = web;
  }

  getInitPage() async{
    initPageUrl(await repository.getInitPage());
    url.text = initPageUrl.value;
  }
}
