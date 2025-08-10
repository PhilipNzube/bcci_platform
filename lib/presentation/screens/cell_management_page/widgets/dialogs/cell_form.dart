import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_dropdown_field.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_text_area.dart';
import 'package:flutter/material.dart';

class CreateCellForm extends StatelessWidget {
  const CreateCellForm({super.key});

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
                  child: _buildTextField('Cell Name', 'Enter Cell Name'),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField('Cell Type', 'Select Type', [
                    'General',
                    'Youth',
                    'Seniors',
                    'Couples',
                    'Children',
                  ]),
                ),
              ],
            ),
            Gap(16),

            // Cluster & Cell Leader
            Row(
              children: [
                Expanded(
                  child: _buildDropdownField('Cluster', 'Select Cluster', [
                    'Cluster 1',
                    'Cluster 2',
                  ]),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField('Cell Leader', 'Select Leader', [
                    'Leader A',
                    'Leader B',
                  ]),
                ),
              ],
            ),
            Gap(16),

            // Meeting Location
            _buildTextField('Meeting Location', 'Enter full address'),
            Gap(16),

            // Meeting Time & Max Capacity
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Meeting Time', 'e.g. Wednesday'),
                ),
                Gap(16, isHorizontal: true),
                Expanded(child: _buildTextField('Max Capacity', 'e.g. 20')),
              ],
            ),
            Gap(16),

            // Membership Target & Monthly Budget
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Membership Target', 'e.g. 100'),
                ),
                Gap(16, isHorizontal: true),
                Expanded(child: _buildTextField('Monthly Budget', 'e.g. 8')),
              ],
            ),
            Gap(16),

            // Description
            _buildTextArea(
              'Description',
              'Describe the cell\'s focus and purpose',
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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

  Widget _buildTextField(String label, String hint) {
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
          hintText: hint,
          labelText: label,
          fillColor: Colors.white,
          borderRadius: 8,
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String label2, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(title: label, fontSize: 13),
        Gap(6),
        CustomDropdownField(
          label: label2,
          items: items,
          borderRadius: 8,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildTextArea(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(title: label, fontSize: 13),
        Gap(6),
        CustomTextArea(labelText: hint, borderRadius: 8),
      ],
    );
  }
}
