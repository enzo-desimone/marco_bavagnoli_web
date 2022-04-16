import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marco_bavagnoli_web/utils/bouncing_animation.dart';
import 'dart:js' as js;

import '../../../../Utils/theme_color.dart';
import '../../../../models/portfolio_item.dart';

class CustomDialog {
  late final PortfolioItem _card;

  CustomDialog(this._card);

  Future<Widget?> showCustomDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 650,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_card.image!),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(18.0),
                    topLeft: Radius.circular(18.0)),
              ),
              child: Container(
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CustomBounce(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      duration: const Duration(milliseconds: 150),
                      child: Icon(
                        Ionicons.close_circle,
                        color: white,
                      )),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0)),
                ),
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                width: 650,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        if (_card.categoryCard?.index == 0)
                          const Icon(
                            Ionicons.logo_google_playstore,
                            color: Colors.lightGreen,
                          ),
                        if (_card.categoryCard?.index == 1)
                          Image.asset(
                            'assets/images/blackberry-icon.png',
                            color: Colors.deepPurple[600],
                            width: 35,
                            height: 35,
                          ),
                        if (_card.categoryCard?.index == 2)
                          Image.asset(
                            'assets/images/flutter-icon.png',
                            width: 35,
                            height: 35,
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _card.title!.tr(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _card.description!.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (_card.link != null)
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CustomBounce(
                          duration: const Duration(milliseconds: 150),
                          onPressed: () {
                            js.context.callMethod('open', [_card.link]);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Ionicons.link_outline,
                                color: mainColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '_getIt'.tr(),
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                )),
          ],
        );
      },
    );
  }
}
