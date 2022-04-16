import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marco_bavagnoli_web/utils/firebase_config.dart';
import 'package:marco_bavagnoli_web/utils/global_var.dart';
import 'package:marco_bavagnoli_web/views/home/main_view.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:seo_renderer/helpers/robot_detector_vm.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Utils/theme_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  setPathUrlStrategy();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'EN')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'EN'),
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _canBuild = false;
  late bool _visible = true;
  final ThemeData theme = ThemeData();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    Timer(const Duration(milliseconds: 1000), () async {
      if (mounted) {
        setState(() {
          _visible = !_visible;
        });
      }
    });

    Timer(const Duration(milliseconds: 2500), () async {
      if (mounted) {
        setState(() {
          _canBuild = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_canBuild) {
      return RobotDetector(
        debug: true,
        child: TextRenderer(
          text: 'Marco Bavagnoli - Software Developer',
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Marco Bavagnoli - Software Developer',
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
              brightness: Brightness.light,
              primaryColor: mainColor,
              colorScheme: theme.colorScheme
                  .copyWith(primary: mainColor, secondary: accentColor)
                  .copyWith(secondary: accentColor),
            ),
            home: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    onEnd: () {},
                    opacity: _visible ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 700),
                    child: ImageRenderer(
                      alt: 'marco-bavagnoli',
                      src:
                          'https://marcobavagnoli.com/assets/assets/images/splash-screen.png',
                      child: Image.asset(
                        "assets/images/splash-screen.png",
                        width: 310,
                        height: 310,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return RobotDetector(
        debug: true,
        child: TextRenderer(
          text: 'Marco Bavagnoli - Software Developer',
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Marco Bavagnoli - Software Developer',
            theme: ThemeData(
              dividerColor: Colors.transparent,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
              brightness: Brightness.light,
              primaryColor: mainColor,
              colorScheme: theme.colorScheme
                  .copyWith(primary: mainColor, secondary: accentColor)
                  .copyWith(secondary: accentColor),
            ),
            navigatorObservers: <NavigatorObserver>[
              Global.observer,
              seoRouteObserver
            ],
            navigatorKey: Global().navigatorKey,
            home: const MainView(),
            initialRoute: '/',
          ),
        ),
      );
    }
  }
}
