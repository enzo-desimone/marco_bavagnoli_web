import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marco_bavagnoli_web/models/portfolio_item.dart';
import 'package:marco_bavagnoli_web/views/home/mobile/footer_mobile.dart';
import 'package:marco_bavagnoli_web/views/home/mobile/header_mobile.dart';
import 'package:marco_bavagnoli_web/views/home/desktop/body_desktop.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import '../../utils/global_var.dart';
import '../../utils/theme_color.dart';
import 'custom_widget/portfolio_grid_list.dart';
import 'desktop/footer_desktop.dart';
import 'desktop/header_desktop.dart';
import 'mobile/body_mobile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  final ValueNotifier<int> _indexSelected = ValueNotifier(-1);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  build(BuildContext context) {
    super.build(context);
    return TextRenderer(
      text: '_siteName'.tr(),
      child: Title(
        title: '_siteName'.tr(),
        color: mainColor,
        child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background-home.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      if (MediaQuery.of(context).size.width > 600)
                        const HeaderDesktop(),
                      if (MediaQuery.of(context).size.width <= 600)
                        const HeaderMobile(),
                      const SizedBox(
                        height: 100,
                      ),
                      if (MediaQuery.of(context).size.width > 500)
                        BodyDesktop(
                          indexSelected: _indexSelected,
                        ),
                      if (MediaQuery.of(context).size.width <= 500)
                        BodyMobile(
                          indexSelected: _indexSelected,
                        ),
                      const SizedBox(
                        height: 170,
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _indexSelected,
                  builder: (BuildContext context, int value, Widget? child) {
                    return PortfolioGridList(
                      list: _customList(value),
                    );
                  },
                ),
                if (MediaQuery.of(context).size.width > 600)
                  const FooterDesktop(),
                if (MediaQuery.of(context).size.width <= 600)
                  const FooterMobile()
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PortfolioItem> _customList(int index) => cardList
      .where((element) => (element.categoryCard!.index ==
          (index == -1 ? element.categoryCard!.index : index)))
      .toList();
}
