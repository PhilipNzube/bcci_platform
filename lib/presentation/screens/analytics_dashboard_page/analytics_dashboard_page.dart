import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/analytics_dashboard_page_controller.dart';
import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/widgets/action_card.dart';
import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/widgets/cell_group.dart';
import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/widgets/engagement_progress.dart';
import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/analytics_dashboard_page/widgets/progress_item.dart';
import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';
import 'package:bcci_platform/core/widgets/filter_chip.dart';

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
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          left: 1,
                          right: 1,
                          top: 2,
                          bottom: 2,
                        ),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FilterChipWidget(
                              title: "Week",
                              selectedFilter: AnalyticsDashboardPageController
                                  .selectedFilter,
                            ),

                            FilterChipWidget(
                              title: "Month",
                              selectedFilter: AnalyticsDashboardPageController
                                  .selectedFilter,
                            ),

                            FilterChipWidget(
                              title: "Year",
                              selectedFilter: AnalyticsDashboardPageController
                                  .selectedFilter,
                            ),
                            CustomButton(
                              text: "Export",
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              img: "images/save.png",
                              imgColor: Colors.black,
                              imgHeight: 20,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoCard(
                            value: "1250",
                            label: "Total Members",
                            img: "images/Active_Users.png",
                            iconColor: Colors.black,
                            stat: '-12 this month',
                          ),
                          Gap(10, isHorizontal: true),
                          InfoCard(
                            value: "82",
                            label: "Days Streak",
                            img: "images/Stats.png",
                            iconColor: Colors.black,
                            isPercentage: true,
                            stat: '+5% vs last month',
                          ),
                        ],
                      ),
                      Gap(30),
                      CustomBackground(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Weekly Attendance Trends",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                                Text(
                                  "Last 7 days",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Gap(20),

                            ProgressItem(title: "Jun 15", progress: .85),
                            ProgressItem(title: "Jun 16", progress: .75),
                            ProgressItem(title: "Jun 17", progress: .95),
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
                                Expanded(
                                  child: Text(
                                    "Cell Group Performance",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Gap(16),
                            // Events
                            CellGroup(
                              title: "Victory Cell",
                              members: "16",
                              stat: "+1",
                              growthStat: "85",
                            ),
                            CellGroup(
                              title: "Grace Cell",
                              members: "16",
                              stat: "+1",
                              growthStat: "85",
                            ),
                            CellGroup(
                              title: "Faith Cell",
                              members: "16",
                              stat: "+3",
                              growthStat: "85",
                            ),
                          ],
                        ),
                      ),
                      Gap(30),
                      CustomBackground(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Engagement by Category",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),

                            Gap(20),

                            EngagementProgress(
                              title: "Sunday Service",
                              progress: .85,
                              isIncreasing: true,
                              upImagePath: "images/digital_adoption.png",
                              downImagePath:
                                  "images/reverse_digital_adoption.png",
                            ),
                            EngagementProgress(
                              title: "Call Meetings",
                              progress: .45,
                              isIncreasing: false,
                              upImagePath: "images/digital_adoption.png",
                              downImagePath:
                                  "images/reverse_digital_adoption.png",
                            ),
                          ],
                        ),
                      ),
                      Gap(30),
                      Row(
                        children: const [
                          ActionCard(
                            label: "8 Events This Month",
                            img: "images/Calender2.png",
                          ),

                          ActionCard(
                            label: "16/18 Active Cell Groups",
                            img: "images/Marker.png",
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
