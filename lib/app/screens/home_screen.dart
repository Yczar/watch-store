import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/app/models/watch.dart';
import 'package:watch_store/app/screens/watch_details.dart';
import 'package:watch_store/src/assets/svgs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = [
    const Tab(
      text: 'Smart watch',
    ),
    const Tab(
      text: 'Casio',
    ),
    const Tab(
      text: 'Tissot',
    ),
    const Tab(
      text: 'Seiko',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      kHomeMenuSvg,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: const Color(0xFF9095A6).withOpacity(0.5),
                          ),
                        ),
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            kHomeSearchSvg,
                            height: 20,
                          ),
                        ),
                        hintText: 'Search Product',
                        hintStyle: TextStyle(
                          color: const Color(0xFF1B153D).withOpacity(0.55),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Find your suitable\nwatch now.',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Color(0xFF1B153D),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TabBar(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              controller: _tabController,
              isScrollable: true,
              indicatorColor: const Color(0xFF5B41FF),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Color(0xFF5B41FF),
                ),
                insets: EdgeInsets.only(
                  left: 0,
                  right: 40,
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
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.79,
                  crossAxisSpacing: 21,
                  mainAxisSpacing: 20,
                ),
                itemCount: watchList.length,
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                itemBuilder: (
                  _,
                  index,
                ) =>
                    InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => WatchDetailsScreen(
                          watch: watchList[0],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF171439).withOpacity(0.04),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: watchList[0].name,
                          child: Container(
                            height: 101,
                            margin: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC8B7),
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                image: AssetImage(
                                  watchList[0].image,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: '${watchList[0].name}series',
                                child: Material(
                                  child: Text(
                                    watchList[0].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1B153D),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                watchList[0].series,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF9095A6),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Hero(
                                tag:
                                    '${watchList[index].name}${watchList[index].price}price',
                                child: Text(
                                  '\$${watchList[0].price}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5B41FF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
