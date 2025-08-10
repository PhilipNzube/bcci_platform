import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_tab_selector.dart';
import 'package:bcci_platform/presentation/controllers/cell_management_page_controller.dart';
import 'package:bcci_platform/presentation/screens/cell_management_page/widgets/dialogs/cell_form.dart';
import 'package:bcci_platform/presentation/screens/cell_management_page/widgets/cell_overview_card.dart';
import 'package:bcci_platform/presentation/screens/cell_management_page/widgets/info_card.dart';
import 'package:bcci_platform/presentation/screens/cell_management_page/widgets/search_bar.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class CellManagementPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CellManagementPage({super.key, required this.scaffoldKey});

  @override
  State<CellManagementPage> createState() => _CellManagementPageState();
}

class _CellManagementPageState extends State<CellManagementPage>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final CellManagementPageController = Provider.of<CellManagementPageController>(context);
    return ChangeNotifierProvider(
      create: (context) => CellManagementPageController(),
      child: Consumer<CellManagementPageController>(
        builder: (context, CellManagementPageController, child) {
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
                          'Cell Management',
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
                onRefresh: () => CellManagementPageController.refreshCells(),
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
                          "Manage individual cells, members, and activities",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Gap(30),
                        CustomButton(
                          height: 50,
                          img: "images/Add2.png",
                          text: "New Cell",
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
                                child: CreateCellForm(
                                  controller: CellManagementPageController,
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
                                    value: "4",
                                    label: "Total Cells",
                                  ),
                                ),
                                Gap(16, isHorizontal: true),
                                Expanded(
                                  child: InfoCard(
                                    value: "5",
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
                                    value: "83",
                                    label: "Avg. Members",
                                    isPercentage: true,
                                  ),
                                ),
                                Gap(16, isHorizontal: true),
                                Expanded(
                                  child: InfoCard(
                                    value: "+6",
                                    label: "This Month",
                                    useChangeColor: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Gap(5),
                        CustomTabSelector(
                          tabs: ["Cell Overview", "Members", "Analysis"],
                          selectedIndex:
                              CellManagementPageController.selectedTabIndex,
                          onTabSelected: (index) {
                            CellManagementPageController.setSelectedTabIndex(
                              index,
                            );
                          },
                        ),

                        Gap(30),
                        if (CellManagementPageController.selectedTabIndex ==
                            0) ...[
                          SearchBarWidget(
                            hintText: "Search Candidates ",
                            hintStyle: TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(Icons.search),
                            onTap: () {},
                          ),
                          Gap(30),
                          if (CellManagementPageController.isLoadingCells)
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          else if (CellManagementPageController
                              .cellData
                              .isEmpty)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.home_work_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "No cells found",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "It looks like you haven’t added any cells yet.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            Column(
                              children: CellManagementPageController.cellData.map((
                                cell,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: CellOverviewCard(
                                    title:
                                        'Cell ${cell['id']}', // temp until API gives names
                                    cluster: '—', // no cluster data yet
                                    leader: '—', // no leader data yet
                                    stats: [
                                      {'label': 'ID', 'value': cell['id']},
                                    ],
                                    address: '—',
                                    time: '—',
                                    progressCurrent: 0,
                                    progressTotal: 0,
                                    tags: [],
                                  ),
                                );
                              }).toList(),
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
            ),
          );
        },
      ),
    );
  }
}
