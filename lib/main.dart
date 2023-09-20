import 'package:cringe_miner/home.dart';
import 'package:cringe_miner/setup.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

  ValueNotifier<double> money = ValueNotifier<double>(0);

class _MyAppState extends State<MyApp> {
  var loggedIn = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
    return CupertinoApp(
      title: 'Flutter Demo',
      // theme: CupertinoThemeData(
      //   primaryColor: lightColorScheme?.primary ?? CupertinoColors.activeBlue,
      //   primaryContrastingColor: lightColorScheme?.onPrimary ?? CupertinoColors.activeBlue,
      //   scaffoldBackgroundColor:
      //       lightColorScheme?.background ?? CupertinoColors.black,
      // ),
      // darkTheme: ThemeData(
      //   colorScheme: darkColorScheme ??
      //       ColorScheme.fromSwatch(brightness: Brightness.dark),
      //   useMaterial3: true,
      //   pageTransitionsTheme: PageTransitionsTheme(builders: {
      //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      //   }),
      // ),
      routes: {
        '/start': (context) => CupertinoScaffold(body: SetupPage()),
        '/': (context) => CupertinoScaffold(body: HomePage()),
      },
      initialRoute:
          // FirebaseAuth.instance.currentUser == null ? '/start' : '/',
          '/',
    );
    // });
  }
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
