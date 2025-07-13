import 'package:bcci_platform/presentation/screens/main_app/widgets/side_bar_item.dart';
import 'package:bcci_platform/presentation/screens/main_app/widgets/side_bar_section.dart';
import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  final void Function(String label)? onItemTap;

  const AppSidebar({super.key, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SideBarSection(
                      header: "ANALYTICS",
                      items: [
                        SideBarItem(
                          label: "Digital Transformation",
                          iconPath: 'images/Digital_Transformation.png',
                          onItemTap: onItemTap,
                        ),
                        SideBarItem(
                          label: "Analytics Dashboard",
                          iconPath: 'images/Analytics.png',
                          onItemTap: onItemTap,
                        ),
                      ],
                    ),
                    SideBarSection(
                      header: "TECHNOLOGY",
                      items: [
                        SideBarItem(
                          label: "CV Recognition",
                          iconPath: 'images/CV_Recognition.png',
                          onItemTap: onItemTap,
                        ),
                      ],
                    ),
                    SideBarSection(
                      header: "ENGAGEMENT",
                      items: [
                        SideBarItem(
                          label: "Gamification",
                          iconPath: 'images/Gamification.png',
                          onItemTap: onItemTap,
                        ),
                      ],
                    ),
                    SideBarSection(
                      header: "GROWTH",
                      items: [
                        SideBarItem(
                          label: "Discipleship Pathways",
                          iconPath: 'images/Daily_Reading.png',
                        ),
                        SideBarItem(
                          label: "Spiritual Goals",
                          iconPath: 'images/Spiritual_Goal.png',
                          onItemTap: onItemTap,
                        ),
                      ],
                    ),
                    SideBarSection(
                      header: "MANAGEMENT",
                      items: [
                        SideBarItem(
                          label: "Cell Leader Appointment",
                          iconPath: 'images/Cell_Leader_Appointment.png',
                          onItemTap: onItemTap,
                        ),
                        SideBarItem(
                          label: "Cluster Management",
                          iconPath: 'images/Fellowship.png',
                          onItemTap: onItemTap,
                        ),
                        SideBarItem(
                          label: "Cell Management",
                          iconPath: 'images/Fellowship.png',
                          onItemTap: onItemTap,
                        ),
                      ],
                    ),
                    SideBarSection(
                      header: "GROWTH",
                      items: [
                        SideBarItem(
                          label: "GPS Configuration",
                          iconPath: 'images/GPS.png',
                          onItemTap: onItemTap,
                        ),
                        SideBarItem(
                          label: "Settings",
                          iconPath: 'images/settings-2.png',
                          onItemTap: onItemTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Divider(),
            ListTile(
              leading: Image.asset('images/Help.png', width: 24),
              title: const Text("Help"),
              onTap: () => onItemTap?.call("Help"),
            ),
            ListTile(
              leading: Image.asset('images/Log-out.png', width: 24),
              title: const Text(
                "Logout Account",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () => onItemTap?.call("Logout Account"),
            ),
          ],
        ),
      ),
    );
  }
}
