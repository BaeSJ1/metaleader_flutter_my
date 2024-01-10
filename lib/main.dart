import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:metaleader/util/colors.dart';
import 'package:metaleader/view/home/home.dart';

final localhostServer = InAppLocalhostServer(documentRoot: 'assets');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.getDefaultUserAgent();
    //setWebContentsDebuggingEnabled(kDebugMode);
  }

  if (!kIsWeb) {
    await localhostServer.start();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'WEB VIEW',
      color: Colors.white,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NotoSansCKJ",
          iconTheme: const IconThemeData(
            color: CustomColors.iconColor,
          ),
          textTheme: const TextTheme(
              displayMedium: TextStyle(color: CustomColors.textColor))),
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/home', page: () => Home(), binding: HomeBinding()),
      ],
    );
  }
}
