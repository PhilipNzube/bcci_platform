import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_tab_selector.dart';
import 'package:bcci_platform/presentation/controllers/cell_leader_appointment_controller.dart';
import 'package:bcci_platform/presentation/screens/cell_leader_appointment/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/cell_leader_appointment/widgets/appointment_card.dart';
import 'package:bcci_platform/presentation/screens/cell_leader_appointment/widgets/dialogs/nomination_form.dart';
import 'package:bcci_platform/presentation/screens/cell_leader_appointment/widgets/search_bar.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class CellLeaderAppointment extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CellLeaderAppointment({super.key, required this.scaffoldKey});

  @override
  State<CellLeaderAppointment> createState() => _CellLeaderAppointmentState();
}

class _CellLeaderAppointmentState extends State<CellLeaderAppointment>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final CellLeaderAppointmentController = Provider.of<CellLeaderAppointmentController>(context);
    return ChangeNotifierProvider(
      create: (context) => CellLeaderAppointmentController(),
      child: Consumer<CellLeaderAppointmentController>(
        builder: (context, CellLeaderAppointmentController, child) {
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
                        onTap: () =>
                            widget.scaffoldKey.currentState?.openDrawer(),
                        child: Image.asset('images/Menu.png', height: 35),
                      ),

                      Gap(20, isHorizontal: true),
                      Expanded(
                        flex: 10,
                        child: Text(
                          'Cell Leader Appointment',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'GolosText',
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(4),
                      const Text(
                        "Manage nominations and appointments for cell leadership",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(30),
                      CustomButton(
                        height: 50,
                        img: "images/Add2.png",
                        text: "Nominate",
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.6),
                            builder: (_) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: NominationForm(),
                            ),
                          );
                        },
                      ),
                      Gap(30),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InfoCard(
                                  value: "12",
                                  label: "Pending Reviews",
                                ),
                              ),
                              Gap(16, isHorizontal: true),
                              Expanded(
                                child: InfoCard(
                                  value: "8",
                                  label: "Open Positions",
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InfoCard(
                                  value: "35",
                                  label: "Active Leaders",
                                ),
                              ),
                              Gap(16, isHorizontal: true),
                              Expanded(
                                child: InfoCard(
                                  value: "6",
                                  label: "This Month",
                                  isPercentage: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Gap(5),
                      // Tab Selector
                      CustomTabSelector(
                        tabs: ["Candidates", "Open Positions"],
                        selectedIndex:
                            CellLeaderAppointmentController.selectedTabIndex,
                        onTabSelected: (index) {
                          CellLeaderAppointmentController.setSelectedTabIndex(
                            index,
                          );
                        },
                      ),

                      Gap(30),
                      if (CellLeaderAppointmentController.selectedTabIndex ==
                          0) ...[
                        SearchBarWidget(
                          hintText: "Search Candidates ",
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: const Icon(Icons.search),
                          onTap: () {},
                        ),
                        Gap(30),
                        AppointmentCard(
                          fullName: 'Sarah Johnson',
                          role: 'Assistant Cell Leader',
                          group: 'Downtown Cell Group',
                          experience: '3 years experience',
                          nominatedDate: '1/15/2024',
                          tags: [
                            'Leadership',
                            'Teaching',
                            'Pastoral Care',
                            'Counseling',
                          ],
                          status: 'Pending',
                        ),
                      ] else ...[
                        SearchBarWidget(
                          hintText: "Search Open Positions ",
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: const Icon(Icons.search),
                          onTap: () {},
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
