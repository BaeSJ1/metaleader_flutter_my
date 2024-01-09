import 'package:flutter/material.dart';
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
    return  Scaffold(
      backgroundColor: CustomColors.backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text("tabbar1"),
                        Text("tabbar2"),
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
                        SizedBox(width: 7),
                        Flexible(
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
              )
              ,flex: 1,),
            Expanded(
              child:Container(child: Center(child: Text('webview'),),) ,flex: 9,)
          ],
        ),
      ),
    );
  }
}
