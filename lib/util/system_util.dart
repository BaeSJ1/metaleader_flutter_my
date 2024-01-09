import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:metaleader/util/colors.dart';

class SystemUtil {
  static String get getServerUrl {
    bool isDebug = false;

    assert(isDebug = true);
    return isDebug
        ? 'http://dev.itnj.co.kr:14649'
        : 'http://meta.itnj.co.kr:9800';
  }
  // http://dev.itnj.co.kr:14649
  // http://meta.itnj.co.kr:9800
  static void showSnackBar(BuildContext context, String title, String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
          colorText: CustomColors.textColor,
          borderRadius: 5,
          backgroundColor: CustomColors.pointColor);
    }
  }

  static String makeDday(String baseDate, DateTimeResult type) {
    try {
      DateTime base = DateTime.parse(baseDate);
      DateTime current = DateTime.now();
      Duration gap = base.difference(current);
      switch (type) {
        case DateTimeResult.DDAY:
          base = DateTime(base.year, base.month, base.day, 0, 0, 0);
          current = DateTime(current.year, current.month, current.day, 0, 0, 0);
          gap = base.difference(current);
          if (gap.inDays == 0) {
            if (base.day > current.day) {
              return 'D+1';
            } else if (base.day < current.day) {
              return 'D-1';
            } else {
              return 'D-Day';
            }
          }
          if (gap.inDays <= 0) {
            return 'D+${gap.inDays.abs()}';
          } else {
            return 'D-${gap.inDays.abs()}';
          }

        case DateTimeResult.TIME:
          if (gap.inDays < 0) {
            return '${gap.inDays.abs()}일 전';
          }
          if (gap.inHours < 0) {
            return '${gap.inHours.abs()}시간 전';
          }
          if (gap.inMinutes < 0) {
            return '${gap.inMinutes.abs()}분 전';
          }
          if (gap.inSeconds < 0) {
            return '${gap.inSeconds.abs()}초 전';
          }

          if (gap.inDays > 0) {
            return '${gap.inDays.abs()}일 후';
          }
          if (gap.inHours > 0) {
            return '${gap.inHours.abs()}시간 후';
          }
          if (gap.inMinutes > 0) {
            return '${gap.inMinutes.abs()}분 후';
          }
          if (gap.inSeconds > 0) {
            return '${gap.inSeconds.abs()}초 후';
          }
          return '';
        case DateTimeResult.DATETIME:
          return DateFormat('yyyy.MM.dd', 'ko').format(base);
        default:
          return '';
      }
    } catch (e) {
      return '';
    }
  }
  static String makePhoneFormatted(String value){
    return value.replaceAllMapped(RegExp(r'(\d{3})(\d{3,4})(\d{4})'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
  }
}
enum DateTimeResult { DDAY, TIME, DATETIME }