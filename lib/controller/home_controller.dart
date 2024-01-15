import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../data/user_info.dart';
import '../model/repository.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString initPageUrl = ''.obs;
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
          SizedBox(width: 58,),
          IconButton(onPressed: (){
            removeTabs();
          }, icon: Icon(Icons.close, color: Colors.black,))
        ],
      ),
    )
    );
  }

  removeTabs() {
    tabs.removeAt(0);
  }

 goToURL(String url){
    webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
 }

  createWeb(InAppWebViewController web) {
    webViewController = web;
  }

}