import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/user_page_controller.dart';
import 'package:bcci_platform/presentation/screens/acheivement_page/acheivement_page.dart';
import 'package:bcci_platform/presentation/screens/edit_profile/edit_profile.dart';
import 'package:bcci_platform/presentation/screens/privacy_page/privacy_page.dart';
import 'package:bcci_platform/presentation/screens/profile_notification_page/profile_notification_page.dart';
import 'package:bcci_platform/presentation/screens/security_settings_page/security_settings_page.dart';
import 'package:bcci_platform/presentation/screens/spiritual_goals/spiritual_goals.dart';
import 'package:bcci_platform/presentation/screens/user_page/widgets/settings_item.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    //final UserPageController = Provider.of<UserPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => UserPageController(),
      child: Consumer<UserPageController>(
        builder: (context, UserPageController, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Top Header with Background Image and Stack ---
                    Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.55,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/Background.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Top icons
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Row(
                            children: [
                              Image.asset(
                                "images/Share.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              Gap(20, isHorizontal: true),
                              Image.asset(
                                "images/settings-2.png",
                                width: 30,
                                height: 30,
                                color: Colors.white,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),

                        // Profile info
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  'images/Pexels Photo by Pixabay.png',
                                ),
                              ),
                              Gap(10),
                              const Text(
                                "Philip Onwubalili",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(4),
                              const Text(
                                "philip@example.com",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              Gap(16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC7002B),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Level",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Gap(5, isHorizontal: true),
                                        const Text(
                                          "3",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(20, isHorizontal: true),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC7002B),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "1250",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Gap(5, isHorizontal: true),
                                        const Text(
                                          "Points",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Gap(16),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfile(key: UniqueKey()),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(36, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Edit Profile",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Gap(5, isHorizontal: true),
                                      Image.asset(
                                        "images/Edit_Profile.png",
                                        width: 30,
                                        height: 30,
                                        color: Colors.white,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // --- Body content (settings options) ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingsItem(
                            icon: "images/Spiritual_Goal_Settings.png",
                            title: "Spiritual Goals",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SpiritualGoals(key: UniqueKey()),
                                ),
                              );
                            },
                          ),
                          SettingsItem(
                            icon: "images/Notification_Settings.png",
                            title: "Notification",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileNotificationPage(key: UniqueKey()),
                                ),
                              );
                            },
                          ),
                          SettingsItem(
                            icon: "images/Privacy_Settings.png",
                            title: "Privacy & Visibility",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PrivacyPage(key: UniqueKey()),
                                ),
                              );
                            },
                          ),
                          SettingsItem(
                            icon: "images/Security_Settings.png",
                            title: "Security",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SecuritySettingsPage(key: UniqueKey()),
                                ),
                              );
                            },
                          ),
                          SettingsItem(
                            icon: "images/Acheivement_Settings.png",
                            title: "Achievement & Goals",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AcheivementPage(key: UniqueKey()),
                                ),
                              );
                            },
                          ),
                          SettingsItem(
                            icon: "images/Data_Management_Settings.png",
                            title: "Data Management",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
