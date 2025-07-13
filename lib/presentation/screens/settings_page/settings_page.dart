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
  bool pushNotifications = false;
  bool newCourseAlert = false;
  bool useWiFi = true;
  bool autoDownload = false;

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
                        onTap: () => Navigator.pop(context),
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
                        value: pushNotifications,
                        onChanged: (val) {
                          setState(() {
                            pushNotifications = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "New course alerts",
                        subTitle: "Know when instructors upload",
                        value: newCourseAlert,
                        onChanged: (val) {
                          setState(() {
                            newCourseAlert = val;
                          });
                        },
                      ),
                      Gap(70),
                      SettingsOptions(
                        title: "Use WiFi ",
                        subTitle: "App will use wifi over data",
                        value: useWiFi,
                        onChanged: (val) {
                          setState(() {
                            useWiFi = val;
                          });
                        },
                      ),
                      SettingsOptions(
                        title: "Auto-download",
                        subTitle:
                            "Courses will automatically save to your device",
                        value: autoDownload,
                        onChanged: (val) {
                          setState(() {
                            autoDownload = val;
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
