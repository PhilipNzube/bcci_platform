import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/privacy_page_controller.dart';
import 'package:bcci_platform/presentation/screens/settings_page/widgets/settings_options.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final PrivacyPageController = Provider.of<PrivacyPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => PrivacyPageController(),
      child: Consumer<PrivacyPageController>(
        builder: (context, PrivacyPageController, child) {
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
                        'Privacy & Visibility',
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
                        "Manage your privacy and data sharing",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(20),
                      SettingsOptions(
                        title: "Profile Visible",
                        value: PrivacyPageController.profileVisible,
                        onChanged: (val) {
                          PrivacyPageController.setProfileVisible(val);
                        },
                      ),
                      SettingsOptions(
                        title: "Show Attendance",
                        value: PrivacyPageController.showAttendance,
                        onChanged: (val) {
                          PrivacyPageController.setShowAttendance(val);
                        },
                      ),
                      SettingsOptions(
                        title: "Share Progress",
                        value: PrivacyPageController.shareProgress,
                        onChanged: (val) {
                          PrivacyPageController.setShareProgress(val);
                        },
                      ),
                      SettingsOptions(
                        title: "Allow Messages",
                        value: PrivacyPageController.allowMessages,
                        onChanged: (val) {
                          PrivacyPageController.setAllowMessages(val);
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
