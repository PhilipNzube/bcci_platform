import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/analytics_dashboard_page_controller.dart';
import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/widgets/event_tile.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/action_card.dart';
import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/progress_item.dart';
import 'package:bcci_platform/presentation/screens/notification_page/notification_page.dart';
import 'package:bcci_platform/presentation/screens/settings_page/settings_page.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class AnalyticsDashboardPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AnalyticsDashboardPage({super.key, required this.scaffoldKey});

  @override
  State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final AnalyticsDashboardPageController = Provider.of<AnalyticsDashboardPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => AnalyticsDashboardPageController(),
      child: Consumer<AnalyticsDashboardPageController>(
        builder: (context, AnalyticsDashboardPageController, child) {
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
                      Expanded(
                        flex: 10,
                        child: Text(
                          'Analytics Dashboard',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'GolosText',
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NotificationPage(key: UniqueKey()),
                            ),
                          );
                        },
                        child: Image.asset(
                          'images/notifications_active.png',
                          height: 25,
                        ),
                      ),
                      Gap(20, isHorizontal: true),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SettingsPage(key: UniqueKey()),
                            ),
                          );
                        },
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
                            child: CustomBackground(
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
                      CustomBackground(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and View All
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "images/Spiritual_Goal.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    Gap(8, isHorizontal: true),
                                    Text(
                                      "Spiritual Goals",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Gap(20),

                            ProgressItem(
                              title: "Daily Prayer",
                              img: "images/Daily_Prayer.png",
                              progress: .85,
                              color: Colors.green,
                            ),
                            ProgressItem(
                              title: "Bible Reading",
                              img: "images/Bible_Reading.png",
                              progress: 0.65,
                              color: Colors.red,
                            ),
                            ProgressItem(
                              title: "Community Service",
                              img: "images/Community_Service.png",
                              progress: 0.65,
                              color: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                      Gap(30),
                      CustomBackground(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "images/Calender.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    Gap(8, isHorizontal: true),
                                    Text(
                                      "Upcoming Events",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Gap(16),
                            // Events
                            EventTile(
                              title: "Sunday Service",
                              date: "Jun 22, 2025",
                              time: "9:00 AM",
                            ),
                            Gap(10),
                            EventTile(
                              title: "Cell Meeting",
                              date: "Jun 24, 2025",
                              time: "7:00 AM",
                            ),
                            Gap(10),
                            EventTile(
                              title: "Youth Conference",
                              date: "Jun 28, 2025",
                              time: "6:00 AM",
                            ),
                          ],
                        ),
                      ),
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
