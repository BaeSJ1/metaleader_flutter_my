import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:metaleader/controller/home_controller.dart';
import 'package:metaleader/util/colors.dart';

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
    return  Obx(() => Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: brandColor),
        toolbarHeight: 0,
      ),
      body:SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.arrow_forward_rounded),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.refresh_rounded)
                    ),
                    IconButton(
                      onPressed: (){},
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
                              Expanded(child: TextField(
                                decoration: const InputDecoration(
                                  contentPadding:
                                    EdgeInsets.fromLTRB(25, 0, 25, 0)
                                ),
                                controller: controller.url,
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.search,
                                onSubmitted: (value){
                                  controller.goToURL(value);
                                },
                              ))
                            ],
                          ),
                        ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.settings)),
                  ],
                ),
              ),
              Expanded(
                  child: InAppWebView(
                    initialUrlRequest:
                    URLRequest(url:WebUri(controller.initPageUrl.value)),
                  ),
              ),
            ],
          ))
    ,));
  }
}