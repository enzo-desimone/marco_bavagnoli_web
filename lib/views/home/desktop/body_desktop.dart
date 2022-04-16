import 'package:flutter/material.dart';
import 'package:marco_bavagnoli_web/utils/bouncing_animation.dart';
import '../../../../Utils/theme_color.dart';

class BodyDesktop extends StatefulWidget {
  const BodyDesktop({Key? key, required this.indexSelected}) : super(key: key);

  final ValueNotifier<int> indexSelected;

  @override
  _BodyDesktopState createState() => _BodyDesktopState();
}

class _BodyDesktopState extends State<BodyDesktop>
    with TickerProviderStateMixin {
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
                    'Marco',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                      color: white,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Bavagnoli',
                    style: TextStyle(
                      fontSize: 50,
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
                'I\'m Marco Bavagnoli, an Italian software developer. Currently I am involved in developing apps \nfor mobile. Take a look at my portfolio.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _categoryButton('All', -1),
            const SizedBox(
              width: 20,
            ),
            _categoryButton('Android', 0),
            const SizedBox(
              width: 20,
            ),
            _categoryButton('BlackBerry', 1),
            const SizedBox(
              width: 20,
            ),
            _categoryButton('Flutter Plugins', 2),
          ],
        ),
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
                  top: 14, bottom: 14, left: 16, right: 16)),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomBounce(
                duration: const Duration(milliseconds: 150),
                onPressed: () {
                  widget.indexSelected.value = index;
                },
                child: Text(title,
                    style: TextStyle(color: Colors.white.withAlpha(220)))),
          ),
        );
      },
    );
  }
}
