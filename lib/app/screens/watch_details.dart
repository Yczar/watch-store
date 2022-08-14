import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/app/widgets/cart_button.dart';
import 'package:watch_store/app/widgets/colors_list_widget.dart';
import 'package:watch_store/app/widgets/watch_details_tab_bar.dart';

import '../../src/assets/svgs.dart';
import '../models/watch.dart';

class WatchDetailsScreen extends StatefulWidget {
  const WatchDetailsScreen({
    Key? key,
    required this.watch,
  }) : super(key: key);
  final Watch watch;

  @override
  State<WatchDetailsScreen> createState() => _WatchDetailsScreenState();
}

class _WatchDetailsScreenState extends State<WatchDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationController.forward();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xFFFFC8B7),
            ),
            child: Material(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            kWatchesBackArrowSvg,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Hero(
                        tag: watchList[0].name,
                        child: Image.asset(
                          watchList[0].image,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: '${widget.watch.name}series',
                                  child: Material(
                                    child: Text(
                                      '${widget.watch.name} ${widget.watch.series}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1B153D),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  '( With solo loop )',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF9095A6),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Hero(
                            tag:
                                '${widget.watch.name}${widget.watch.price}price',
                            child: Material(
                              child: Text(
                                '\$${widget.watch.price}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5B41FF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: const Text(
                          'Colors',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B153D),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ColorsListWidget(
                        animationController: _animationController,
                        watch: widget.watch,
                      )
                    ],
                  ),
                ),
                WatchDetailsTabBarWidget(
                  tabController: _tabController,
                ),
                const SizedBox(
                  height: 8,
                ),
                CartButtonWidget(
                  animationController: _animationController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
