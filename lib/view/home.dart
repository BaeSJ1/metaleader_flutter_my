import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:metaleader/controller/home_controller.dart';

import '../style/my_color.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class Home extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: brandColor),
            toolbarHeight: 0,
          ),
          body: SafeArea(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 50,
                        child: GetBuilder<HomeController>(
                          builder: (controller) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.tabs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      width: 150,
                                      child: ListTile(
                                        title: Text(controller.tabs[index] as String),
                                        trailing: IconButton(
                                            onPressed: (){
                                              controller.removeTabs(index);
                                            }, icon: Icon(Icons.close_rounded)),
                                        onTap: (){
                                          controller.goToTabPage(index);
                                        },
                                      ),
                                  );
                                },
                            );
                          }
                        ),
                      ),
                  ),
                  IconButton(
                      onPressed: (){
                        controller.addTabs(controller.tabs.length);
                      }, icon: Icon(Icons.add_rounded))
                ],
              ),

              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (await controller.webViewController!.canGoBack()) {
                          controller.webViewController!.goBack();
                        }
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (await controller.webViewController!
                            .canGoForward()) {
                          controller.webViewController!.goForward();
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.webViewController!.reload();
                        },
                        icon: const Icon(Icons.refresh_rounded)),
                    IconButton(
                      onPressed: () {
                        controller.goToHome();
                      },
                      icon: const Icon(Icons.home),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(25, 0, 25, 0),
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              controller: controller.url,
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                controller.goToURL(value);
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.showSetting();
                        },
                        icon: const Icon(Icons.settings)),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: InAppWebView(
                  key: controller.webViewKey,
                  onWebViewCreated: (web) {
                    controller.webViewController = web;
                  },
                  initialUrlRequest:
                      URLRequest(url: WebUri(controller.initPageUrl.value)),
                ),
              )
            ],
          )),
        ));
  }
}
