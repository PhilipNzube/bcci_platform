import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/cluster_page_controller.dart';
import 'package:bcci_platform/presentation/screens/cluster_page/widgets/cluster_card.dart';
import 'package:bcci_platform/presentation/screens/cluster_page/widgets/summary_card.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class ClusterPage extends StatefulWidget {
  const ClusterPage({super.key});

  @override
  State<ClusterPage> createState() => _ClusterPageState();
}

class _ClusterPageState extends State<ClusterPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final ClusterPageController = Provider.of<ClusterPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => ClusterPageController(),
      child: Consumer<ClusterPageController>(
        builder: (context, ClusterPageController, child) {
          return SafeArea(
            child: Scaffold(
              body: RefreshIndicator(
                onRefresh: () => ClusterPageController.refreshClusters(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Cluster Management",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GolosText',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(4),
                        const Text(
                          "Manage your regional clusters and cell groups",
                          style: TextStyle(color: Colors.black),
                        ),
                        Gap(20),

                        // Summary Cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SummaryCard(number: "71", label: "Total Members"),
                            SummaryCard(number: "2", label: "Active Clusters"),
                            SummaryCard(number: "3", label: "Total Cells"),
                          ],
                        ),
                        Gap(20),

                        // Loader
                        if (ClusterPageController.isLoading)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        // Empty state
                        else if (ClusterPageController.clusterData.isEmpty)
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
                                    "It looks like you haven’t added any clusters yet.",
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
                            children: ClusterPageController.clusterData.map((
                              c,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ClusterCard(
                                  region: c['title'],
                                  district: c['cluster'],
                                  members:
                                      int.tryParse(
                                        c['stats'].firstWhere(
                                          (s) => s['label'] == 'Members',
                                        )['value'],
                                      ) ??
                                      0,
                                  activeCells:
                                      int.tryParse(
                                        c['stats'].firstWhere(
                                          (s) => s['label'] == 'Cells',
                                        )['value'],
                                      ) ??
                                      0,
                                  avgPerCell:
                                      ClusterPageController.calculateAvgPerCell(
                                        c,
                                      ),
                                ),
                              );
                            }).toList(),
                          ),

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
