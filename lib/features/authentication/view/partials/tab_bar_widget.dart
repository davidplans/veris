import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required TabController controller,
    required this.tabLength,
    required this.activeTabIndex,
  }) : _controller = controller;

  final TabController _controller;
  final int tabLength;
  final int activeTabIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      indicatorColor: Colors.transparent,
      controller: _controller,
      dividerHeight: 0,
      indicatorWeight: 0.1,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: List.generate(tabLength, (index) {
        return Tab(
          height: 4,
          child: Container(
            width: width / tabLength,
            decoration: BoxDecoration(
              color: activeTabIndex >= index
                  ? ColorConstants.progressBarPrimaryColor
                  : ColorConstants.separatorPrimaryColor,
            ),
          ),
        );
      }),
    );
  }
}
