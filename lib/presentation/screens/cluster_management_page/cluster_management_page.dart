import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_tab_selector.dart';
import 'package:bcci_platform/presentation/controllers/cluster_management_page_controller.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/all_cell_card.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/cluster_form.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/cluster_overview_card.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/search_bar.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class ClusterManagementPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const ClusterManagementPage({super.key, required this.scaffoldKey});

  @override
  State<ClusterManagementPage> createState() => _ClusterManagementPageState();
}

class _ClusterManagementPageState extends State<ClusterManagementPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final ClusterManagementPageController = Provider.of<ClusterManagementPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => ClusterManagementPageController(),
      child: Consumer<ClusterManagementPageController>(
        builder: (context, ClusterManagementPageController, child) {
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
                          'Cluster Management',
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
                        "Oversee and manage all clusters and their cells",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(30),
                      CustomButton(
                        height: 50,
                        img: "images/Add2.png",
                        text: "New Cluster",
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
                              child: CreateClusterForm(),
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
                                  value: "18",
                                  label: "Total Clusters",
                                ),
                              ),
                              Gap(16, isHorizontal: true),
                              Expanded(
                                child: InfoCard(
                                  value: "256",
                                  label: "Total Members",
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
                                  value: "3",
                                  label: "Active Clusters",
                                ),
                              ),
                              Gap(16, isHorizontal: true),
                              Expanded(
                                child: InfoCard(
                                  value: "+23",
                                  label: "New This Quarter",
                                  useChangeColor: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Gap(5),
                      CustomTabSelector(
                        tabs: ["Clusters Overview", "All Cells"],
                        selectedIndex:
                            ClusterManagementPageController.selectedTabIndex,
                        onTabSelected: (index) {
                          ClusterManagementPageController.setSelectedTabIndex(
                            index,
                          );
                        },
                      ),

                      Gap(30),
                      if (ClusterManagementPageController.selectedTabIndex ==
                          0) ...[
                        SearchBarWidget(
                          hintText: "Search Candidates ",
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: const Icon(Icons.search),
                          onTap: () {},
                        ),
                        Gap(30),
                        ClusterOverviewCard(
                          title: 'North Region Cluster',
                          cluster: 'Northern District',
                          leader: 'Brother James Wilson',
                          stats: [
                            {'label': 'Members', 'value': '125'},
                            {'label': 'Cells', 'value': '8'},
                            {
                              'label': 'Health',
                              'value': '+15.2%',
                              'colorize': true,
                            },
                          ],
                          nextTime: '1/22/2025',
                          progressCurrent: 125,
                          progressTotal: 150,
                          tags: ['Growing'],
                        ),
                      ] else ...[
                        AllCellCard(
                          title: 'Victory Life Cell',
                          leader: 'Brother James Wilson',
                          stats: [
                            {'label': 'Members', 'value': '18/20'},
                            {'label': 'Attendance', 'value': '99%'},
                          ],
                          address: '123 Oak Street, Downtown',
                          time: 'Wednesday 7:00PM',
                          progressCurrent: 92,
                          progressTotal: 100,
                          tags: ['General', 'Multiplying'],
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
