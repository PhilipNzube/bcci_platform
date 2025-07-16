import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/digital_transformation_page_controller.dart';
import 'package:bcci_platform/presentation/screens/digital_transformation_page/widgets/info_card.dart';
import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/presentation/screens/digital_transformation_page/widgets/quick_action.dart';
import 'package:bcci_platform/presentation/screens/digital_transformation_page/widgets/recent_card.dart';
import 'package:bcci_platform/presentation/screens/digital_transformation_page/widgets/transformation_card.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class DigitalTransformationPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DigitalTransformationPage({super.key, required this.scaffoldKey});

  @override
  State<DigitalTransformationPage> createState() =>
      _DigitalTransformationPageState();
}

class _DigitalTransformationPageState extends State<DigitalTransformationPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final DigitalTransformationPageController = Provider.of<DigitalTransformationPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => DigitalTransformationPageController(),
      child: Consumer<DigitalTransformationPageController>(
        builder: (context, DigitalTransformationPageController, child) {
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
                          'Digital Transformation',
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
                        "Modernizing ministry through technology and data-driven insights.",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(30),

                      Column(
                        children: [
                          InfoCard(
                            value: "78",
                            label: "Digital Adoption",
                            img: "images/digital_adoption.png",
                            iconColor: Colors.black,
                            isPercentage: true,
                          ),
                          InfoCard(
                            value: "2,450",
                            label: "Active Users",
                            img: "images/Active_Users.png",
                            iconColor: Colors.black,
                          ),
                          InfoCard(
                            value: "+15",
                            label: "Growth Rate",
                            img: "images/Spiritual_Goal.png",
                            iconColor: Colors.black,
                            isPercentage: true,
                          ),
                          InfoCard(
                            value: "+32",
                            label: "Efficiency Gain",
                            img: "images/Efficiency.png",
                            iconColor: Colors.black,
                            isPercentage: true,
                          ),
                        ],
                      ),
                      Gap(30),

                      CustomBackground(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transformation Areas",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Gap(5),
                            Text(
                              "Track progress across key digital transformation initiatives",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                            Gap(16),
                            TransformationCard(
                              title: 'Digital Engagement',
                              img: 'images/Phone.png',
                              subText:
                                  'Online worship, streaming, and digital community building',
                              progressBarTitle: '1250/1500',
                              progress: .75,
                              progressColor: Colors.black,
                              progressBarSuffixTitle: 'active users',
                              status: "In Progress",
                            ),
                            TransformationCard(
                              title: 'Data Analytics',
                              img: 'images/Stats.png',
                              subText:
                                  'Member insights, attendance tracking, and growth analytics',
                              progressBarTitle: '8/12',
                              progress: .60,
                              progressColor: Colors.black,
                              progressBarSuffixTitle: 'key metrics',
                              status: "In Progress",
                            ),
                            TransformationCard(
                              title: 'Global Connectivity',
                              img: 'images/Global.png',
                              subText:
                                  'Multi-location coordination and remote participation',
                              progressBarTitle: '3/8',
                              progress: .45,
                              progressColor: Colors.black,
                              progressBarSuffixTitle: 'location',
                              status: "Planning",
                            ),
                            TransformationCard(
                              title: 'Automation',
                              img: 'images/Efficiency.png',
                              subText:
                                  'Streamlined processes and automated workflows',
                              progressBarTitle: '2/10',
                              progress: .30,
                              progressColor: Colors.black,
                              progressBarSuffixTitle: 'processes',
                              status: "Planning",
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
                              "Recent Initiatives",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Gap(5),
                            Text(
                              "Latest digital transformation projects and their impact",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                            Gap(16),
                            RecentCard(
                              title: 'Mobile App Launch',
                              subText: 'Increased engagement by 40%',

                              status: "Completed",
                              timeStamp: "2024-01-05",
                            ),
                            RecentCard(
                              title: 'Digital Discipleship Platform',
                              subText: 'Increased engagement by 40%',
                              status: "In Progress",
                              timeStamp: "2024-01-05",
                            ),
                            RecentCard(
                              title: 'AI-Powered Analytics',
                              subText:
                                  'Predictive insights for growth strategies',
                              status: "In Progress",
                              timeStamp: "2024-01-05",
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
                              "Quick Actions",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Gap(5),
                            Text(
                              "Key actions to accelerate digital transformation",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                            Gap(16),
                            QuickAction(
                              title: 'Launch New Initiative',
                              subText: 'Start a new transformation project',
                            ),
                            QuickAction(
                              title: 'View Analysis',
                              subText: 'Detailed transformation metrics',
                            ),
                            QuickAction(
                              title: 'Resource Planning',
                              subText: 'Allocate resources effectively',
                            ),
                            QuickAction(
                              title: 'Training Programs',
                              subText: 'Digital skills development',
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
