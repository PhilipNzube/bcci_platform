import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/controllers/navigation_controller.dart';
import '../../presentation/controllers/notification_controller.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Provider.of<NavigationController>(context);
    final notificationController = Provider.of<NotificationController>(context);

    // Limit to 5 items (excluding AnalyticsDashboardPage)
    final int itemCount = 5;
    final List<BottomNavigationBarItem> items = [
      _buildNavItem(
        "images/Home-Active.png",
        "images/Home.png",
        "Home",
        notificationController.hasNotification(0),
        navController.selectedIndex == 0,
      ),
      _buildNavItem(
        "images/Cluster-Active.png",
        "images/Cluster.png",
        "Cluster",
        notificationController.hasNotification(1),
        navController.selectedIndex == 1,
      ),
      _buildNavItem(
        "images/Worship-Active.png",
        "images/Worship.png",
        "Worship",
        notificationController.hasNotification(2),
        navController.selectedIndex == 2,
      ),
      _buildNavItem(
        "images/Messages-Active.png",
        "images/Messages.png",
        "Messages",
        notificationController.hasNotification(3),
        navController.selectedIndex == 3,
      ),
      _buildNavItem(
        "images/User-Active.png",
        "images/User.png",
        "User",
        notificationController.hasNotification(4),
        navController.selectedIndex == 4,
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: items,
          currentIndex: navController.tempIndex >= 0
              ? navController.previousIndex < itemCount
                    ? navController.previousIndex
                    : 0
              : navController.selectedIndex < itemCount
              ? navController.selectedIndex
              : 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index < itemCount) {
              navController.changeTab(index);
            }
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String activeAssetPath,
    String inactiveAssetPath,
    String label,
    bool hasNotification,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            isSelected ? activeAssetPath : inactiveAssetPath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          if (hasNotification)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
