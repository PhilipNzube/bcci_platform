import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/notifications_page_controller.dart';
import 'package:bcci_platform/presentation/screens/notification_page/widgets/day_divider.dart';
import 'package:bcci_platform/presentation/screens/notification_page/widgets/filter_card.dart';
import 'package:bcci_platform/presentation/screens/notification_page/widgets/notification_card.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin, RouteAware {
  bool pushNotifications = false;
  bool newCourseAlert = false;
  bool useWiFi = true;
  bool autoDownload = false;
  final ValueNotifier<String?> _selectedFilter = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _selectedFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final NotificationPageController = Provider.of<NotificationPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => NotificationPageController(),
      child: Consumer<NotificationPageController>(
        builder: (context, NotificationPageController, child) {
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
                        'Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GolosText',
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NotificationPage(key: UniqueKey()),
                            ),
                          );
                        },
                        child: Image.asset('images/More.png', height: 25),
                      ),
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
                      Row(
                        children: [
                          FilterCard(
                            title: "All",
                            selectedFilter:
                                NotificationPageController.selectedFilter,
                          ),
                          Gap(10, isHorizontal: true),
                          FilterCard(
                            title: "Unread",
                            selectedFilter:
                                NotificationPageController.selectedFilter,
                          ),
                        ],
                      ),
                      Gap(10),
                      if (NotificationPageController.selectedFilter.value ==
                              "All" ||
                          NotificationPageController.selectedFilter.value ==
                              null) ...[
                        // if (NotificationPageController.selectedFilter.value ==
                        //     "Unread")
                        DayDivider(dayText: "Today"),
                        NotificationCard(
                          iconType: "Reminder",
                          name: "Prayer Request",
                          message:
                              "Sarah Williams requested prayer for healing",
                          timeStamp: "5 mins ago",
                        ),
                        NotificationCard(
                          iconType: "Reminder",
                          name: "Upcoming Event",
                          message: "Bible Study tonight at 7 PM",
                          timeStamp: "Today at 6:00pm",
                        ),
                        DayDivider(dayText: "Yesterday"),
                        NotificationCard(
                          iconType: "Goal",
                          name: "Goal Completed",
                          message: "You completed your daily goal!",
                          timeStamp: "Yesterday at 6:00pm",
                        ),
                        NotificationCard(
                          iconType: "Goal",
                          name: "Goal Completed",
                          message: "You completed your daily goal!",
                          timeStamp: "Yesterday at 6:00pm",
                        ),
                      ],
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
