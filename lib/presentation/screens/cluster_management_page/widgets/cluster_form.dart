import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_dropdown_field.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_text_area.dart';
import 'package:flutter/material.dart';

class CreateClusterForm extends StatelessWidget {
  const CreateClusterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 650),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Cluster Name', 'Enter Cluster Name'),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField('Region', 'Selection Region', [
                    'Northern District',
                    'Eastern District',
                    'Western District',
                    'Southern District'
                        'Central District',
                  ]),
                ),
              ],
            ),
            Gap(16),

            _buildTextField('Cluster Leader', 'Enter Cluster Leader Name'),
            Gap(16),

            // Meeting Time & Max Capacity
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Membership Target', 'e.g. 100'),
                ),
                Gap(16, isHorizontal: true),
                Expanded(child: _buildTextField('Cell Target', 'e.g. 8')),
              ],
            ),
            Gap(16),
            _buildTextArea(
              'Description',
              'Describe the cluster’s focus, location, and goals.',
            ),
            Gap(24),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Create Cluster",
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
          initialValue: hint,
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
