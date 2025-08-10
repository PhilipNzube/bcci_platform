import 'package:bcci_platform/presentation/controllers/cluster_management_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_dropdown_field.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_text_area.dart';

class CreateClusterForm extends StatelessWidget {
  final controller;
  final BuildContext dialogContext;
  const CreateClusterForm({
    super.key,
    this.controller,
    required this.dialogContext,
  });

  @override
  Widget build(BuildContext context) {
    //final controller = Provider.of<ClusterManagementPageController>(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Cluster Name',
                    'Enter Cluster Name',
                    controller.clusterNameController,
                  ),
                ),
                const Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField(
                    'Region',
                    'Select Region',
                    [
                      'Northern District',
                      'Eastern District',
                      'Western District',
                      'Southern District',
                      'Central District',
                    ],
                    controller.selectedRegion,
                    controller.setSelectedRegion,
                  ),
                ),
              ],
            ),
            const Gap(16),
            _buildTextField(
              'Cluster Leader',
              'Enter Cluster Leader ID',
              controller.clusterLeaderController,
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Membership Target',
                    'e.g. 100',
                    controller.membershipTargetController,
                  ),
                ),
                const Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildTextField(
                    'Cell Target',
                    'e.g. 8',
                    controller.cellTargetController,
                  ),
                ),
              ],
            ),
            const Gap(16),
            _buildTextArea(
              'Description',
              'Describe the cluster',
              controller.descriptionController,
            ),
            const Gap(24),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Create Cluster",
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    onPressed: () => controller.createCluster(dialogContext),
                  ),
                ),
                const Gap(16, isHorizontal: true),
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(
          title: label,
          fontSize: 13,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        CustomTextField(
          controller: controller,
          labelText: hint,
          fillColor: Colors.white,
          borderRadius: 8,
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    String hint,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(title: label, fontSize: 13),
        const Gap(6),
        CustomDropdownField(
          label: hint,
          items: items,
          borderRadius: 8,
          value: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildTextArea(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(title: label, fontSize: 13),
        const Gap(6),
        CustomTextArea(
          controller: controller,
          labelText: hint,
          borderRadius: 8,
        ),
      ],
    );
  }
}
