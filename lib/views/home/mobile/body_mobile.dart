import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marco_bavagnoli_web/utils/bouncing_animation.dart';
import '../../../../Utils/theme_color.dart';

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key, required this.indexSelected}) : super(key: key);

  final ValueNotifier<int> indexSelected;

  @override
  _BodyMobileState createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '_name'.tr(),
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w100,
                      color: white,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '_surname'.tr(),
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '_portfolioDescription'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        SizedBox(
          height: 44,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 16,
              ),
              _categoryButton('_all', -1),
              const SizedBox(
                width: 16,
              ),
              _categoryButton('_android', 0),
              const SizedBox(
                width: 16,
              ),
              _categoryButton('_blackBerry', 1),
              const SizedBox(
                width: 16,
              ),
              _categoryButton('_flutterPlugins', 2),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _categoryButton(String title, int index) {
    return ValueListenableBuilder(
      valueListenable: widget.indexSelected,
      builder: (BuildContext context, int value, Widget? child) {
        return TextButton(
          onPressed: () {
            widget.indexSelected.value = index;
          },
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: value == index ? mainColor : Colors.white24,
                  )),
              backgroundColor: value == index ? mainColor : Colors.transparent,
              padding: const EdgeInsets.only(
                  top: 0, bottom: 0, left: 16, right: 16)),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomBounce(
                duration: const Duration(milliseconds: 150),
                onPressed: () {
                  widget.indexSelected.value = index;
                },
                child: Text(title.tr(),
                    style: TextStyle(
                        fontSize: 12, color: Colors.white.withAlpha(220)))),
          ),
        );
      },
    );
  }
}
