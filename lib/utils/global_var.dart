import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import '../models/portfolio_item.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Global {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Global._privateConstructor();

  static final Global _instance = Global._privateConstructor();

  factory Global() => _instance;
}

final List<PortfolioItem> cardList = [
  PortfolioItem(
    title: '_thirdEye',
    description: '_thirdEyeDescription',
    image: 'assets/images/thirdeye-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_lapseLab',
    description: '_lapseLabDescription',
    image: 'assets/images/lapselab-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_avatar',
    description: '_avatarDescription',
    image: 'assets/images/avatar-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_videoGifer',
    description: '_videoGiferDescription',
    image: 'assets/images/videogifer-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_videoShrinker',
    description: '_videoShrinkerDescription',
    image: 'assets/images/video-shirinker-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_blackBerryFr',
    description: '_blackBerryFrDescription',
    image: 'assets/images/blackberry-fr-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_berryIl',
    description: '_berryIlDescription',
    image: 'assets/images/berry-il-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_snap2Share',
    description: '_snap2ShareDescription',
    image: 'assets/images/snap2share-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_superTube',
    description: '_superTubeDescription',
    image: 'assets/images/supertube-featured.png',
    category: CategoryCard.blackBerry,
  ),
  PortfolioItem(
    title: '_wizzy',
    description: '_wizzyDescription',
    image: 'assets/images/wizzy-android.png',
    category: CategoryCard.android,
  ),
  PortfolioItem(
      title: '_selenium',
      description: '_seleniumDescription',
      image: 'assets/images/selenium-featured.png',
      category: CategoryCard.android,
      link:
          'https://play.google.com/store/apps/details?id=com.bavagnoli.selenium&hl=it'),
  PortfolioItem(
      title: '_fatturaElett',
      description: '_fatturaElettDescription',
      image: 'assets/images/fattura-elettronica.png',
      category: CategoryCard.android,
      link:
          'https://play.google.com/store/apps/details?id=com.bavagnoli.fattronica'),
  PortfolioItem(
      title: '_starMenu',
      description: '_starMenuDescription',
      image: 'assets/images/star-menu.jpg',
      category: CategoryCard.flutterPlugins,
      link: 'https://pub.dev/packages/star_menu'),
  PortfolioItem(
      title: '_yoda',
      description: '_yodaDescription',
      image: 'assets/images/yoda.jpg',
      category: CategoryCard.flutterPlugins,
      link: 'https://pub.dev/packages/yoda'),
  PortfolioItem(
      title: '_magnGlass',
      description: '_magnGlassDescription',
      image: 'assets/images/magnifying-glass.jpg',
      category: CategoryCard.flutterPlugins,
      link: 'https://pub.dev/packages/magnifying_glass'),
  PortfolioItem(
      title: '_blurMatrix',
      description: '_blurMatrixDescription',
      image: 'assets/images/blur-matrix.jpg',
      category: CategoryCard.flutterPlugins,
      link: 'https://pub.dev/packages/blur_matrix'),
  PortfolioItem(
      title: '_fingerPainter',
      description: '_fingerPainterDescription',
      image: 'assets/images/finger-painter.jpg',
      category: CategoryCard.flutterPlugins,
      link: 'https://pub.dev/packages/finger_painter'),
];

extension TrimExtension on String {
  String trimAll() => trimLeft().trimRight();
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstOfEach =>
      split(" ").map((str) => str.capitalize()).join(" ");
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
