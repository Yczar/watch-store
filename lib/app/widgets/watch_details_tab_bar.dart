import 'package:flutter/material.dart';

class WatchDetailsTabBarWidget extends StatelessWidget {
  WatchDetailsTabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  ///
  final List<Tab> _tabs = [
    const Tab(
      text: 'Details',
    ),
    const Tab(
      text: 'Reviews',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      controller: tabController,
      isScrollable: true,
      indicatorColor: const Color(0xFF5B41FF),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 1.5,
          color: Color(0xFF5B41FF),
        ),
        insets: EdgeInsets.only(
          left: 0,
          right: 25,
          bottom: 4,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(
        color: Color(0xFF5B41FF),
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'raleway',
      ),
      unselectedLabelStyle: const TextStyle(
        color: Color(0xFF9095A6),
        fontSize: 14,
        fontFamily: 'raleway',
      ),
      labelColor: const Color(0xFF5B41FF),
      unselectedLabelColor: const Color(0xFF9095A6).withOpacity(0.65),
      tabs: _tabs
          .map((tab) => Builder(builder: (context) {
                final index = _tabs.indexOf(tab);
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? 3 : 18),
                  child: tab,
                );
              }))
          .toList(),
    );
  }
}
