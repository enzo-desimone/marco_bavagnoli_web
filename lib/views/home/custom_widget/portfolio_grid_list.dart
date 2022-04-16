import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import '../../../../models/portfolio_item.dart';
import 'protfolio_card.dart';

class PortfolioGridList extends StatefulWidget {
  const PortfolioGridList({Key? key, required this.list}) : super(key: key);

  final List<PortfolioItem> list;

  @override
  _PortfolioGridListState createState() => _PortfolioGridListState();
}

class _PortfolioGridListState extends State<PortfolioGridList>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -80.0),
      child: Container(
        height: _getHeight(),
        width: 1250,
        color: Colors.transparent,
        child: Center(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
                physics: const NeverScrollableScrollPhysics()),
            child: LiveGrid.options(
              options: options,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 900
                    ? 3
                    : MediaQuery.of(context).size.width > 600
                        ? 2
                        : 1,
                childAspectRatio: 12 / 8,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
              ),
              itemCount: widget.list.length,
              itemBuilder: buildAnimatedItem,
              padding: const EdgeInsets.only(left: 15, right: 15),
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ),
      ),
    );
  }

  final options = const LiveOptions(
    delay: Duration(milliseconds: 300),
    showItemInterval: Duration(milliseconds: 100),
    showItemDuration: Duration(milliseconds: 400),
    visibleFraction: 0.25,
    reAnimateOnVisibility: false,
  );

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.05),
            end: Offset.zero,
          ).animate(animation),
          child: PortfolioCard(
            card: widget.list[index],
          ),
        ),
      );

  double _getHeightWidth(int index, double startH) {
    double start = 590;
    if (index == 10) {
      if (MediaQuery.of(context).size.width < start) {
        double temp = (start - MediaQuery.of(context).size.width) / 10;
        return startH - temp * 117;
      }
    } else if (index == 9) {
      if (MediaQuery.of(context).size.width < start) {
        double temp = (start - MediaQuery.of(context).size.width) / 10;
        return startH - temp * 65;
      }
    } else if (index == 5) {
      if (MediaQuery.of(context).size.width < start) {
        double temp = (start - MediaQuery.of(context).size.width) / 10;
        return startH - temp * 35;
      }
    } else {
      if (MediaQuery.of(context).size.width < start) {
        double temp = (start - MediaQuery.of(context).size.width) / 10;
        return startH - temp * 22;
      }
    }
    return startH;
  }

  double _getHeight() {
    return widget.list.length > 9
        ? (MediaQuery.of(context).size.width > 900
            ? 1730
            : MediaQuery.of(context).size.width > 600
                ? 2750
                : _getHeightWidth(10, 6880))
        : widget.list.length > 5
            ? (MediaQuery.of(context).size.width > 900
                ? 850
                : MediaQuery.of(context).size.width > 600
                    ? 1520
                    : _getHeightWidth(9, 3700))
            : widget.list.length > 3
                ? (MediaQuery.of(context).size.width > 900
                    ? 570
                    : MediaQuery.of(context).size.width > 600
                        ? 900
                        : _getHeightWidth(5, 2050))
                : (MediaQuery.of(context).size.width > 900
                    ? 270
                    : MediaQuery.of(context).size.width > 600
                        ? 600
                        : _getHeightWidth(3, 1220));
  }
}
