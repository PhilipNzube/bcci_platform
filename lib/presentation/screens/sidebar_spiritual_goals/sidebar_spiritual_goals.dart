import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/sidebar_spiritual_goals_controller.dart';
import 'package:bcci_platform/presentation/screens/sidebar_spiritual_goals/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/sidebar_spiritual_goals/widgets/section_card.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class SidebarSpiritualGoals extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SidebarSpiritualGoals({super.key, required this.scaffoldKey});

  @override
  State<SidebarSpiritualGoals> createState() => _SidebarSpiritualGoalsState();
}

class _SidebarSpiritualGoalsState extends State<SidebarSpiritualGoals>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final SidebarSpiritualGoalsController = Provider.of<SidebarSpiritualGoalsController>(context);
    return ChangeNotifierProvider(
      create: (context) => SidebarSpiritualGoalsController(),
      child: Consumer<SidebarSpiritualGoalsController>(
        builder: (context, SidebarSpiritualGoalsController, child) {
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
                          'Spiritual Goals',
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
                        "Track your spiritual growth and discipleship journey",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(30),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InfoCard(
                                  value: "3",
                                  label: "Total Goals",
                                  img: "images/Spiritual_Goal.png",
                                  iconColor: Colors.black,
                                ),
                              ),
                              Gap(16, isHorizontal: true),
                              Expanded(
                                child: InfoCard(
                                  value: "1",
                                  label: "Completed",
                                  img: "images/circle-tick.png",
                                  iconColor: Color(0xFF008000),
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InfoCard(
                                  value: "2",
                                  label: "In Progress",
                                  img: "images/history-rounded.png",
                                  iconColor: Color(0xFFFF0000),
                                ),
                              ),
                              Gap(16, isHorizontal: true),
                              Expanded(
                                child: InfoCard(
                                  value: "75",
                                  label: "Avg. Progress",
                                  img: "images/Trophy.png",
                                  iconColor: Color(0xFFFFD700),
                                  isPercentage: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Gap(10),
                      CustomButton(
                        width: double.infinity,
                        height: 50,
                        text: "Add New Spiritual Goal",
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      Gap(30),
                      SectionCard(
                        title: "Daily Prayer Time",
                        subText: "Maintain consistent daily prayer practice.",
                        progressBarSuffixText: "Days",
                        progressBarDivisorText: 30,
                        progress: 12,
                        endDate: "12/31/2024",
                        badgeText: "Prayer",
                        status: "In Progress",
                      ),
                      SectionCard(
                        title: "Community Service",
                        subText: "Volunteer in community outreach programs",
                        progressBarSuffixText: "Hours",
                        progressBarDivisorText: 50,
                        progress: 40,
                        endDate: "12/31/2024",
                        badgeText: "Service",
                        status: "Completed",
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
