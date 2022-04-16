import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marco_bavagnoli_web/utils/bouncing_animation.dart';
import '../../../../Utils/theme_color.dart';
import '../../../../models/portfolio_item.dart';
import 'custom_dialog.dart';

class PortfolioCard extends StatefulWidget {
  const PortfolioCard({Key? key, required this.card}) : super(key: key);

  final PortfolioItem card;

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard>
    with TickerProviderStateMixin {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  hoverActivation(hoverState) {
    setState(() {
      _isHovered = hoverState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        hoverActivation(true);
      },
      onExit: (event) {
        hoverActivation(false);
      },
      child: CustomBounce(
        onPressed: () {
          CustomDialog(widget.card).showCustomDialog(context);
        },
        duration: const Duration(milliseconds: 150),
        child: Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.card.image!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(_isHovered ? 0.8 : 0),
                    borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isHovered ? 1 : 0,
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.card.title!.tr(),
                            style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            PortfolioItem.getNameCategory(
                                widget.card.categoryCard!),
                            style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
