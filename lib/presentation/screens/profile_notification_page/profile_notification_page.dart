import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/profile_notification_page_controller.dart';
import 'package:bcci_platform/presentation/screens/settings_page/widgets/settings_options.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class ProfileNotificationPage extends StatefulWidget {
  const ProfileNotificationPage({super.key});

  @override
  State<ProfileNotificationPage> createState() =>
      _ProfileNotificationPageState();
}

class _ProfileNotificationPageState extends State<ProfileNotificationPage>
    with TickerProviderStateMixin, RouteAware {
  bool eventReminders = false;
  bool cellUpdates = false;
  bool spiritualGoals = true;
  bool acheivements = true;
  bool communityNews = false;
  bool prayerRequest = false;

  @override
  Widget build(BuildContext context) {
    //final ProfileNotificationPageController = Provider.of<ProfileNotificationPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => ProfileNotificationPageController(),
      child: Consumer<ProfileNotificationPageController>(
        builder: (context, ProfileNotificationPageController, child) {
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
                        'Notification',
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
                        "Control what notification you receive",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(20),
                      SettingsOptions(
                        title: "Event Reminders",
                        value: eventReminders,
                        onChanged: (val) {
                          setState(() {
                            eventReminders = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "Cell Updates",
                        value: cellUpdates,
                        onChanged: (val) {
                          setState(() {
                            cellUpdates = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "Spiritual Goals",
                        value: spiritualGoals,
                        onChanged: (val) {
                          setState(() {
                            spiritualGoals = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "Acheivements",
                        value: acheivements,
                        onChanged: (val) {
                          setState(() {
                            acheivements = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "Community News",
                        value: communityNews,
                        onChanged: (val) {
                          setState(() {
                            communityNews = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "Prayer Request",
                        value: prayerRequest,
                        onChanged: (val) {
                          setState(() {
                            prayerRequest = val;
                          });
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
