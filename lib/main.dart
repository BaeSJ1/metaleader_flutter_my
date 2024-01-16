import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:metaleader/style/my_color.dart';
import 'package:metaleader/util/screen_path.dart';
import 'package:metaleader/view/setting.dart';

import 'view/home.dart';

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
      title: 'Webby Test',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: brandColor),
      ),
      getPages: [
        GetPage(
            name: ScreenPath.home, page: () => Home(), binding: HomeBinding()),
        GetPage(
          name: ScreenPath.setting, page: () => Setting(), binding: SettingBinding(),
        )
      ],
      initialRoute: '/home',
    );
  }
}
