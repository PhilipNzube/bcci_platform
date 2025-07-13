import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/home_page_controller.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/action_card.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/goal_card.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/upcoming_events_card.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomePage({super.key, required this.scaffoldKey});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final homePageController = Provider.of<HomePageController>(context);
    return ChangeNotifierProvider(
      create: (context) => HomePageController(),
      child: Consumer<HomePageController>(
        builder: (context, homePageController, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            widget.scaffoldKey.currentState?.openDrawer(),
                        child: Image.asset('images/Menu.png', height: 35),
                      ),

                      Gap(20, isHorizontal: true),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GolosText',
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'images/notifications_active.png',
                          height: 25,
                        ),
                      ),
                      Gap(20, isHorizontal: true),
                      InkWell(
                        onTap: () {},
                        child: Image.asset('images/settings.png', height: 25),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 3,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: const Icon(
                                    Icons.mic,
                                    color: Colors.red,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(10, isHorizontal: true),
                          InkWell(
                            onTap: () {},
                            child: Image.asset('images/filter.png', height: 50),
                          ),
                        ],
                      ),
                      Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoCard(
                            value: "1250",
                            label: "Points",
                            img: "images/Trophy.png",
                            iconColor: Colors.amber,
                          ),
                          Gap(10, isHorizontal: true),
                          InfoCard(
                            value: "12",
                            label: "Days Streak",
                            img: "images/Calender.png",
                            iconColor: Colors.black,
                          ),
                        ],
                      ),
                      Gap(30),
                      GoalCard(),
                      Gap(30),
                      UpcomingEventsCard(),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ActionCard(
                            label: "Daily Reading",
                            img: "images/Daily_Reading.png",
                          ),
                          Gap(10, isHorizontal: true),
                          ActionCard(label: "Prayer", img: "images/Prayer.png"),
                          Gap(10, isHorizontal: true),
                          ActionCard(
                            label: "Fellowship",
                            img: "images/Fellowship.png",
                          ),
                        ],
                      ),
                      Gap(10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
