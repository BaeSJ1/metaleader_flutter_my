import 'dart:convert';
import 'dart:core';


List<UserInfo> userInfoFromJson(String str) =>
    List<UserInfo>.from(json.decode(str).map((x) => UserInfo.fromJson(x)));

String userInfoToJson(List<UserInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserInfo {
  UserInfo(
      {required this.userCode,
        required this.userPhone,
        required this.userPhotoUrl,
        required this.clubRole,
        required this.userName,
        required this.userNameEn,
        required this.clubName,
        required this.companyName,
        required this.companyAddress,
        required this.companyRole,
        required this.companyCategory,
        required this.companyImageUrl});

  String userCode = '';
  String userPhone = '';
  String userPhotoUrl = '';
  String clubRole = '';
  String userName = '';
  String userNameEn = '';
  String clubName = '';

  String companyName = '';
  String companyAddress = '';
  String companyRole = '';
  String companyCategory = '';
  String companyImageUrl = '';


  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    userCode: json["userCode"] ?? '',
    userPhone: json["userPhone"] ?? '',
    userPhotoUrl: json["userPhotoUrl"] ?? '',
    clubRole: json["clubRole"] ?? '',
    userName: json["userName"] ?? '',
    userNameEn: json["userNameEn"] ?? '',
    clubName: json["clubName"] ?? '',
    companyName: json["companyName"] ?? '',
    companyAddress: json["companyAddress"] ?? '',
    companyRole: json["companyRole"] ?? '',
    companyCategory: json["companyCategory"] ?? '',
    companyImageUrl: json["companyImageUrl"] ?? '',
  );

  Map<String, dynamic> toJson() {
    return {
      'userCode': userCode,
      'userPhone': userPhone,
      'userPhotoUrl': userPhotoUrl,
      'clubRole': clubRole,
      'userName': userName,
      'userNameEn': userNameEn,
      'clubName': clubName,
      'companyName': companyName,
      'companyAddress': companyAddress,
      'companyRole': companyRole,
      'companyCategory': companyCategory,
      'companyImageUrl': companyImageUrl,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
