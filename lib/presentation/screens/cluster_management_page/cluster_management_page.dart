import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_tab_selector.dart';
import 'package:bcci_platform/presentation/controllers/cluster_management_page_controller.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/all_cell_card.dart';
import 'package:bcci_platform/presentation/screens/cluster_management_page/widgets/dialogs/cluster_form.dart';
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
              body: RefreshIndicator(
                onRefresh: () =>
                    ClusterManagementPageController.refreshClusters(),
                child: SingleChildScrollView(
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
                              builder: (dialogContext) => Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CreateClusterForm(
                                  controller: ClusterManagementPageController,
                                  dialogContext: dialogContext,
                                ),
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
                          // Loader
                          if (ClusterManagementPageController.isLoading)
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          // Empty state
                          else if (ClusterManagementPageController
                              .clusterData
                              .isEmpty)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.groups_outlined,
                                      size: 60,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "No clusters found",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "It looks like you haven’t added any clusters yet.\nTap the + button to create one.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          // Cluster cards
                          else
                            Column(
                              children: ClusterManagementPageController
                                  .clusterData
                                  .map((c) {
                                    return Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        bottom: 16,
                                      ),
                                      child: ClusterOverviewCard(
                                        title: c['title'],
                                        cluster: c['cluster'],
                                        leader: c['leader'],
                                        stats: c['stats'],
                                        nextTime: c['nextTime'],
                                        progressCurrent: c['progressCurrent'],
                                        progressTotal: c['progressTotal'],
                                        tags: c['tags'],
                                      ),
                                    );
                                  })
                                  .toList(),
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
            ),
          );
        },
      ),
    );
  }
}
