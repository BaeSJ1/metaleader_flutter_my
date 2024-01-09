import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/repository.dart';
import '../util/config.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  RxString message = ''.obs;
  Repository repository = Repository();


  textchange() {
    message('test');
    message('aaaaa');
  }
}