import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:metaleader/controller/home_controller.dart';
import 'package:metaleader/util/colors.dart';

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
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 120,
                child: Column(
                  children: [
                    /*Container(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Container(
                                width:250,
                                height: 40,
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Text('TABBAR1'),
                                    SizedBox(width: 120,),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.close)),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                        ],
                      ),
                    ),*/

                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(children: controller.tabs.toList(),)),
                                SizedBox(width: 20,),
                                Container(
                                  width: 120,
                                  child: Row(
                                    children: [
                                      Text('탭'),
                                      SizedBox(width: 58,),
                                      IconButton(onPressed: (){
                                        controller.removeTabs();
                                      }, icon: Icon(Icons.close, color: Colors.black,))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          IconButton(onPressed: () {
                            controller.addTabs();
                          }, icon: Icon(Icons.add))
                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          SizedBox(width: 7),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                          SizedBox(width: 5),
                          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                          SizedBox(width: 5),
                          IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                          const SizedBox(width: 7),
                          const Flexible(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                hintText: 'url',
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          IconButton(onPressed: () {}, icon: Icon(Icons.settings),),
                          SizedBox(width: 5,),
                          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                        ],
                      ),
                    ))
                  ],
                )
            ),
            Expanded(
              flex: 9,
              child:InAppWebView(
                key: controller.webViewKey,
                onWebViewCreated: (web) {
                  controller.webViewController = web;
                },
                initialUrlRequest: URLRequest(
                  url: Uri.parse('https://google.com'),
                ),
                initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(useHybridComposition: true)),
              ),)
          ],
        ),
      ),
    ));
  }
}
