import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marco_bavagnoli_web/utils/bouncing_animation.dart';
import '../../../../../Utils/theme_color.dart';
import 'dart:js' as js;

class FooterDesktop extends StatefulWidget {
  const FooterDesktop({Key? key}) : super(key: key);

  @override
  _FooterDesktopState createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop>
    with TickerProviderStateMixin {
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
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
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  '_footerText'.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                MouseRegion(
                  onEnter: (event) {
                    _isHovered.value = true;
                  },
                  onExit: (event) {
                    _isHovered.value = false;
                  },
                  child: ValueListenableBuilder(
                    valueListenable: _isHovered,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CustomBounce(
                          duration: const Duration(milliseconds: 150),
                          onPressed: () {
                            js.context.callMethod(
                                'open', ['https://instagram.com/besimsoft']);
                          },
                          child: Text(
                            '_besimSoft'.tr(),
                            style: TextStyle(
                                color: value ? mainColor : white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CustomBounce(
                    onPressed: () {
                      js.context.callMethod('open',
                          ['https://www.facebook.com/marcobavagnolidev/']);
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
                      js.context.callMethod(
                          'open', ['https://twitter.com/lildeimos']);
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
                      js.context
                          .callMethod('open', ['https://github.com/alnitak']);
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
        ));
  }
}
