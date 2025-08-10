import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_dropdown_field.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_text_area.dart';
import 'package:bcci_platform/presentation/controllers/cell_management_page_controller.dart';
import 'package:flutter/material.dart';

class CreateCellForm extends StatelessWidget {
  final CellManagementPageController controller;
  const CreateCellForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 650),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cell Name & Cell Type
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Cell Name',
                    'Enter Cell Name',
                    controller.cellNameController,
                  ),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField(
                    'Cell Type',
                    'Select Type',
                    ['General', 'Youth', 'Seniors', 'Couples', 'Children'],
                    controller.selectedCellType,
                    controller.setSelectedCellType,
                  ),
                ),
              ],
            ),
            Gap(16),

            // Cluster & Cell Leader
            Row(
              children: [
                Expanded(
                  child: _buildDropdownField(
                    'Cluster',
                    'Select Cluster',
                    controller.clusterOptions
                        .map((e) => e['name']!)
                        .toList(), // display only names
                    controller.selectedClusterName,
                    (value) {
                      final cluster = controller.clusterOptions.firstWhere(
                        (e) => e['name'] == value,
                      );
                      controller.setSelectedCluster(
                        cluster['id'],
                      ); // store the ObjectId in controller
                      controller.setSelectedClusterName(cluster['name']!);
                    },
                  ),
                ),

                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField(
                    'Cell Leader',
                    'Select Leader',
                    ['Leader A', 'Leader B'],
                    controller.cellLeader,
                    controller.setCellLeader,
                  ),
                ),
              ],
            ),
            Gap(16),

            // Meeting Location
            _buildTextField(
              'Meeting Location',
              'Enter full address',
              controller.meetingLocationController,
            ),
            Gap(16),

            // Meeting Time & Max Capacity
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Meeting Time',
                    'e.g. Wednesday',
                    controller.meetingTimeController,
                  ),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildTextField(
                    'Max Capacity',
                    'e.g. 20',
                    controller.maxCapacityController,
                  ),
                ),
              ],
            ),
            Gap(16),

            // Membership Target & Monthly Budget
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Membership Target',
                    'e.g. 100',
                    controller.membershipTargetController,
                  ),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildTextField(
                    'Monthly Budget',
                    'e.g. 8',
                    controller.monthlyBudgetController,
                  ),
                ),
              ],
            ),
            Gap(16),

            // Description
            _buildTextArea(
              'Description',
              'Describe the cell\'s focus and purpose',
              controller.descriptionController,
            ),
            Gap(24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Create Cell",
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    isLoading: controller.isLoading,
                    onPressed: () => controller.createCell(context),
                  ),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
        Gap(6),
        CustomTextField(
          controller: controller,
          hintText: hint,
          labelText: label,
          fillColor: Colors.white,
          borderRadius: 8,
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    String label2,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(title: label, fontSize: 13),
        Gap(6),
        CustomDropdownField(
          label: label2,
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
        Gap(6),
        CustomTextArea(
          controller: controller,
          labelText: hint,
          borderRadius: 8,
        ),
      ],
    );
  }
}
