import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/acheivement_page_controller.dart';
import 'package:bcci_platform/presentation/screens/settings_page/widgets/settings_options.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class AcheivementPage extends StatefulWidget {
  const AcheivementPage({super.key});

  @override
  State<AcheivementPage> createState() => _AcheivementPageState();
}

class _AcheivementPageState extends State<AcheivementPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final AcheivementPageController = Provider.of<AcheivementPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => AcheivementPageController(),
      child: Consumer<AcheivementPageController>(
        builder: (context, AcheivementPageController, child) {
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
                        onTap: () => Navigator.pop(context),
                        child: Image.asset('images/Back.png', height: 35),
                      ),

                      Gap(20, isHorizontal: true),
                      Text(
                        'Achievement & Goals',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GolosText',
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface,
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
                        "Gamification and progress tracking",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(20),
                      SettingsOptions(
                        title: "Show Leaderboard",
                        value: AcheivementPageController.showLeaderboard,
                        onChanged: (val) {
                          AcheivementPageController.setShowLeaderboard(val);
                        },
                      ),
                      SettingsOptions(
                        title: "Acheivement Notification",
                        value:
                            AcheivementPageController.acheivementNotification,
                        onChanged: (val) {
                          AcheivementPageController.setAcheivementNotification(
                            val,
                          );
                        },
                      ),
                      SettingsOptions(
                        title: "Weekly Reports",
                        value: AcheivementPageController.weeklyReports,
                        onChanged: (val) {
                          AcheivementPageController.setWeeklyReports(val);
                        },
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
