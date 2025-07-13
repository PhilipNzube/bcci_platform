import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/worship_page_controller.dart';
import 'package:bcci_platform/presentation/screens/worship_page/widgets/audio_card.dart';
import 'package:bcci_platform/presentation/screens/worship_page/widgets/filter_chip.dart';
import 'package:flutter/material.dart' hide CarouselController, FilterChip;
import 'package:provider/provider.dart';

class WorshipPage extends StatefulWidget {
  const WorshipPage({super.key});

  @override
  State<WorshipPage> createState() => _WorshipPageState();
}

class _WorshipPageState extends State<WorshipPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final WorshipPageController = Provider.of<WorshipPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => WorshipPageController(),
      child: Consumer<WorshipPageController>(
        builder: (context, WorshipPageController, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Worship & Media",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'GolosText',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(4),
                      const Text(
                        "Listen to songs, sermons and join live worship",
                        style: TextStyle(color: Colors.black),
                      ),
                      Gap(20),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 3,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //live
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color:
                                          Colors.red, // or any color you want
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Gap(6, isHorizontal: true),
                                  const Text(
                                    "LIVE",
                                    style: TextStyle(color: Color(0xFFFF0000)),
                                  ),
                                ],
                              ),
                            ),
                            Gap(10),
                            //number of people watching
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "234",
                                    style: TextStyle(color: Color(0xFFFF0000)),
                                  ),
                                  Gap(6, isHorizontal: true),
                                  const Text(
                                    "watching",
                                    style: TextStyle(color: Color(0xFFFF0000)),
                                  ),
                                ],
                              ),
                            ),
                            Gap(10),
                            const Text(
                              "Sunday Morning Service",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'GolosText',
                                color: Colors.white,
                              ),
                            ),
                            Gap(10),
                            const Text(
                              "Started at 9:00 AM",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'GolosText',
                                color: Colors.white,
                              ),
                            ),
                            Gap(10),
                            SizedBox(
                              width: double.infinity,
                              height:
                                  (60 / MediaQuery.of(context).size.height) *
                                  MediaQuery.of(context).size.height,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                        (states) =>
                                            states.contains(WidgetState.pressed)
                                            ? Color(0xFFFF0000)
                                            : Colors.white,
                                      ),
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                        (states) =>
                                            states.contains(WidgetState.pressed)
                                            ? Colors.white
                                            : Color(0xFFFF0000),
                                      ),
                                  elevation: WidgetStateProperty.all<double>(
                                    4.0,
                                  ),
                                  shape:
                                      WidgetStateProperty.all<
                                        RoundedRectangleBorder
                                      >(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                ),
                                child: WorshipPageController.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "images/Live.png",
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.contain,
                                          ),
                                          Text(
                                            "Join Live",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'GolosText',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(30),
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          left: 1,
                          right: 1,
                          top: 2,
                          bottom: 2,
                        ),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FilterChip(title: "All", badgeText: "New"),
                            Gap(10, isHorizontal: true),
                            FilterChip(title: "Songs", badgeText: "New"),
                            Gap(10, isHorizontal: true),
                            FilterChip(title: "Sermons", badgeText: "New"),
                            Gap(10, isHorizontal: true),
                            FilterChip(title: "Prayers", badgeText: "New"),
                          ],
                        ),
                      ),
                      Gap(20),
                      AudioCard(
                        iconType: "Music",
                        title: "Amazing Grace",
                        teamTitle: "Worship Team",
                        duration: "4:00",
                      ),
                      AudioCard(
                        iconType: "Voice",
                        title: "Amazing Grace",
                        teamTitle: "Worship Team",
                        duration: "5:00",
                      ),
                      AudioCard(
                        iconType: "Reading",
                        title: "Amazing Grace",
                        teamTitle: "Worship Team",
                        duration: "6:00",
                      ),
                      AudioCard(
                        iconType: "Music",
                        title: "Amazing Grace",
                        teamTitle: "Worship Team",
                        duration: "8:00",
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
