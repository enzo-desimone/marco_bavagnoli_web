import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marco_bavagnoli_web/utils/bouncing_animation.dart';
import '../../../Utils/theme_color.dart';
import 'dart:js' as js;

class HeaderMobile extends StatefulWidget {
  const HeaderMobile({Key? key}) : super(key: key);

  @override
  _HeaderMobileState createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<HeaderMobile>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 110,
              height: 110,
              color: white,
            ),
          ],
        ),
        Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: CustomBounce(
                onPressed: () {
                  js.context.callMethod('open', [
                    'https://play.google.com/store/apps/dev?id=8956124947025569709&hl=it'
                  ]);
                },
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Ionicons.logo_google_playstore,
                  color: white,
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: CustomBounce(
                onPressed: () {
                  js.context.callMethod(
                      'open', ['https://www.facebook.com/marcobavagnolidev/']);
                },
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Ionicons.logo_facebook,
                  color: white,
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: CustomBounce(
                onPressed: () {
                  js.context
                      .callMethod('open', ['https://twitter.com/lildeimos']);
                },
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Ionicons.logo_twitter,
                  color: white,
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: CustomBounce(
                onPressed: () {
                  js.context.callMethod('open', ['https://github.com/alnitak']);
                },
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Ionicons.logo_github,
                  color: white,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
          ],
        )
      ],
    );
  }
}
