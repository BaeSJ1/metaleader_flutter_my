import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metaleader/controller/setting_controller.dart';

import '../style/my_color.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}

class Setting extends GetView<SettingController> {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: splashColor),
            title: const Text('기본 설정'),
          ),
          body: SafeArea(
              child: Container(
                  margin: EdgeInsets.fromLTRB(
                      Get.width * 0.25, 60, Get.width * 0.25, 0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          '기본설정',
                          style: TextStyle(color: a7aac8, fontSize: 30),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            '홈 설정',
                            style: TextStyle(color: brandColor, fontSize: 20),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: controller.homePage.value),
                          // controller: controller.textEditingController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.url,
                          onChanged: (value) {
                            if (controller.formKey.currentState!.validate()) {
                              controller.formKey.currentState!.save();
                            }
                          },
                          validator: (value) {
                            value = value ?? '';
                            if (!value.startsWith('http://') &&
                                !value.startsWith('https://')) {
                              value = 'https://$value';
                            }
                            RegExp urlRegExp = RegExp(
                              r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$",
                              caseSensitive: false, //대소문자 구분
                              multiLine: false,
                            );

                            if (value.isEmpty) {
                              return 'URL 값을 입력 해주세요.';
                            } else if (!urlRegExp.hasMatch(value)) {
                              return 'URL 형식을 확인 해주세요.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            controller.setInitPage(newValue ?? '');
                          },
                        )
                      ],
                    ),
                  ))),
        ));
  }
}
