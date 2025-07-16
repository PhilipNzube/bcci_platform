import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/gamification_page_controller.dart';
import 'package:bcci_platform/presentation/screens/gamification_page/widgets/acheivement_card.dart';
import 'package:bcci_platform/presentation/screens/gamification_page/widgets/active_challenges_card.dart';
import 'package:bcci_platform/presentation/screens/gamification_page/widgets/leaderboard_card.dart';
import 'package:bcci_platform/presentation/screens/gamification_page/widgets/progress_item.dart';
import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/presentation/screens/home_page/widgets/info_card.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class GamificationPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const GamificationPage({super.key, required this.scaffoldKey});

  @override
  State<GamificationPage> createState() => _GamificationPageState();
}

class _GamificationPageState extends State<GamificationPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final GamificationPageController = Provider.of<GamificationPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => GamificationPageController(),
      child: Consumer<GamificationPageController>(
        builder: (context, GamificationPageController, child) {
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
                          'Gamification',
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
                      Gap(4),
                      const Text(
                        "Track your progress and celebrate milestones",
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
                            value: "Level 3",
                            label: "Current Level",
                            img: "images/Star.png",
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
                                Text(
                                  "Level Progress",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDCFCE7),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Level 3",
                                    style: TextStyle(color: Color(0xFF008000)),
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),

                            ProgressItem(
                              title: "Progress to Level 4",
                              progress: .750,
                              color: Colors.black,
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
                                Text(
                                  "Active Challenges",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
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
                            ActiveChallengesCard(
                              title: "7 Days of Gratitude",
                              subText:
                                  "Write down 3 things you’re grateful for each day",
                              progressBarTitle: "45",
                              progress: .60,
                              progressColor: Colors.black,
                              giftPoints: "500",
                              endDate: "Ends 2025-06-25",
                            ),
                            ActiveChallengesCard(
                              title: "Scripture Memory Challenge",
                              subText: "Memorize 5 Bible verses this month",
                              progressBarTitle: "32",
                              progress: .40,
                              progressColor: Colors.black,
                              giftPoints: "500",
                              endDate: "Ends 2025-06-25",
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
                                Text(
                                  "Acheivements",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),

                                Text(
                                  "View All",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Gap(16),

                            AcheivementCard(
                              title: 'Prayer Warrior',
                              badgeText: 'Prayer',
                              subText: 'Completed 30 days of daily prayers',
                              earnedTimeStamp: 'Earned 2025-05-15',
                              points: '500',
                              progressBarTitle: 'Progress to Level 4',
                              progress: .3,
                              progressColor: Colors.black,
                            ),
                            AcheivementCard(
                              title: 'Scripture Scholar',
                              badgeText: 'Reading',
                              subText: 'Read 10 Complete books of the Bible',
                              earnedTimeStamp: 'Earned 2025-05-15',
                              points: '700',
                              progressBarTitle: 'Progress to Level 4',
                              progress: .3,
                              progressColor: Colors.black,
                            ),
                            AcheivementCard(
                              title: 'Faithful Attendee',
                              badgeText: 'Attendance',
                              subText: 'Attended 20 consecutive services',
                              earnedTimeStamp: 'Earned 2025-05-15',
                              points: '800',
                              progressBarTitle: 'Progress to Level 4',
                              progress: .3,
                              progressColor: Colors.black,
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
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Community Leaderboard",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                                Text(
                                  "Full Rankings",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Gap(16),
                            LeaderboardCard(
                              points: '2850',
                              position: 1,
                              name: 'Sarmie Phoenix',
                            ),
                            LeaderboardCard(
                              points: '2850',
                              position: 2,
                              name: 'Sarmie Phoenix',
                            ),
                            LeaderboardCard(
                              points: '2850',
                              position: 3,
                              name: 'Sarmie Phoenix',
                            ),
                            LeaderboardCard(
                              points: '2850',
                              position: 4,
                              name: 'Sarmie Phoenix',
                            ),
                          ],
                        ),
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
