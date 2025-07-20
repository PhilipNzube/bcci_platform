import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/controllers/cv_recognition_system_controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:provider/provider.dart';

class CvRecognitionSystem extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CvRecognitionSystem({super.key, required this.scaffoldKey});

  @override
  State<CvRecognitionSystem> createState() => _CvRecognitionSystemState();
}

class _CvRecognitionSystemState extends State<CvRecognitionSystem>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    //final CvRecognitionSystemController = Provider.of<CvRecognitionSystemController>(context);
    return ChangeNotifierProvider(
      create: (context) => CvRecognitionSystemController(),
      child: Consumer<CvRecognitionSystemController>(
        builder: (context, CvRecognitionSystemController, child) {
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
                          'CV Recognition System',
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
                    children: [
                      Gap(4),
                      const Text(
                        "Upload and analyze CVs with AI-powered extractions",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Gap(30),
                      CustomBackground(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Upload CVs",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Gap(8),
                              const Text(
                                "Drag and drop CV files or click to browse.\nSupports PDF and DOC formats",
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 14,
                                ),
                              ),
                              const Gap(20),
                              if (CvRecognitionSystemController
                                  .selectedFiles
                                  .isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(20),

                                    const Text(
                                      "Selected Files",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const Gap(10),
                                    Row(
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            CvRecognitionSystemController.pickFiles(
                                              context,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.blue,
                                          ),
                                          label: const Text(
                                            "Add",
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {
                                            CvRecognitionSystemController.clearAllFiles();
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          ),
                                          label: const Text(
                                            "Clear",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: CvRecognitionSystemController
                                          .selectedFiles
                                          .length,
                                      separatorBuilder: (_, __) => const Gap(8),
                                      itemBuilder: (context, index) {
                                        final file =
                                            CvRecognitionSystemController
                                                .selectedFiles[index];
                                        final extension =
                                            file.extension?.toLowerCase() ?? '';
                                        IconData icon = Icons.insert_drive_file;
                                        if (extension == 'pdf')
                                          icon = Icons.picture_as_pdf;
                                        else if (extension == 'doc' ||
                                            extension == 'docx')
                                          icon = Icons.description;

                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF5F5F5),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                icon,
                                                size: 30,
                                                color: Colors.grey[800],
                                              ),
                                              const Gap(12, isHorizontal: true),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      file.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const Gap(4),
                                                    Text(
                                                      '${(file.size / (1024 * 1024)).toStringAsFixed(2)} MB',
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  CvRecognitionSystemController.removeFileAt(
                                                    index,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              else
                                GestureDetector(
                                  onTap: () async =>
                                      CvRecognitionSystemController.pickFiles(
                                        context,
                                      ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        style: BorderStyle
                                            .solid, // Use `dotted` if using a package
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "images/Data_Management_Settings.png",
                                            height: 40,
                                            width: 40,
                                            color: Color.fromARGB(103, 0, 0, 0),
                                          ),
                                          Gap(10),
                                          Text(
                                            "Drop CV files here or click to browse",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                103,
                                                0,
                                                0,
                                                0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Maximum files size: 10MB per file",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                103,
                                                0,
                                                0,
                                                0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
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
