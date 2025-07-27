import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/settings_page_controller.dart';
import 'package:bcci_platform/presentation/screens/settings_page/widgets/settings_options.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final SettingsPageController = Provider.of<SettingsPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => SettingsPageController(),
      child: Consumer<SettingsPageController>(
        builder: (context, SettingsPageController, child) {
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
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            // Optionally show a message or do nothing
                            debugPrint("Nothing to go back to.");
                          }
                        },
                        child: Image.asset('images/Back.png', height: 35),
                      ),

                      Gap(20, isHorizontal: true),
                      Text(
                        'Settings',
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
                      Gap(20),
                      SettingsOptions(
                        title: "Push Notifications",
                        subTitle: "Get notified of app alerts",
                        value: SettingsPageController.pushNotifications,
                        onChanged: (val) {
                          SettingsPageController.setPushNotifications(val);
                        },
                      ),
                      SettingsOptions(
                        title: "New course alerts",
                        subTitle: "Know when instructors upload",
                        value: SettingsPageController.newCourseAlert,
                        onChanged: (val) {
                          SettingsPageController.setNewCourseAlert(val);
                        },
                      ),
                      Gap(70),
                      SettingsOptions(
                        title: "Use WiFi ",
                        subTitle: "App will use wifi over data",
                        value: SettingsPageController.useWiFi,
                        onChanged: (val) {
                          SettingsPageController.setUseWiFi(val);
                        },
                      ),
                      SettingsOptions(
                        title: "Auto-download",
                        subTitle:
                            "Courses will automatically save to your device",
                        value: SettingsPageController.autoDownload,
                        onChanged: (val) {
                          SettingsPageController.setAutoDownload(val);
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
