import 'dart:convert';
import 'dart:core';

class WebStateInfo {
  WebStateInfo({required this.key,
    required this.url
  });

  int key;
  String url;

  factory WebStateInfo.fromJson(Map<String, dynamic> json) => WebStateInfo(
      key: json["key"] ?? '',
      url: json["url"] ?? ''
  );

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'url': url
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}