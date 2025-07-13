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
              body: SingleChildScrollView(
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
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(4),
                      const Text(
                        "Manage your regional clusters and cell groups",
                        style: TextStyle(color: Colors.black54),
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

                      // Cluster Cards
                      ClusterCard(
                        region: "North Region",
                        district: "Northern District",
                        members: 43,
                        activeCells: 2,
                        avgPerCell: 22,
                      ),
                      Gap(20),
                      ClusterCard(
                        region: "Central Region",
                        district: "Northern District",
                        members: 28,
                        activeCells: 1,
                        avgPerCell: 28,
                      ),
                      Gap(20),
                      ClusterCard(
                        region: "Central Region",
                        district: "Northern District",
                        members: 28,
                        activeCells: 1,
                        avgPerCell: 28,
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
