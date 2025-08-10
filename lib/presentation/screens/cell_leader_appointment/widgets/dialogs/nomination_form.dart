import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_dropdown_field.dart';
import 'package:bcci_platform/core/widgets/custom_field.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_label.dart';
import 'package:bcci_platform/core/widgets/custom_text_area.dart';
import 'package:flutter/material.dart';

class NominationForm extends StatelessWidget {
  const NominationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Full Name and Email
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Full Name',
                    'Enter Candidate\'s name',
                  ),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildTextField('Email', 'candidate@email.com'),
                ),
              ],
            ),
            Gap(16),

            // Phone Number and Current Role
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Phone Number', '+234 1234 567 890'),
                ),
                Gap(16, isHorizontal: true),
                Expanded(
                  child: _buildDropdownField(
                    'Current Role',
                    'Select Current Role',
                    ['Leader', 'Assistant', 'Coordinator'],
                  ),
                ),
              ],
            ),
            Gap(16),

            // Cell/Location
            _buildTextField('Cell/Location', 'Current cell group or location'),
            Gap(16),

            // Years of Experience
            _buildDropdownField(
              'Years of Experience',
              'Select experience level',
              ['<1', '1-3', '4-6', '7+'],
            ),
            Gap(16),

            // Candidate Bio
            _buildTextArea(
              'Candidate Bio',
              'Describe the candidate’s background, strengths, and why they would be a good leader',
            ),
            Gap(16),

            // Key Skills & Gifts
            _buildTextField(
              'Key Skills & Gifts',
              'e.g. Leadership, Teaching, Pastoral',
            ),
            Gap(16),

            // References
            _buildTextArea(
              'References',
              'List 2–3 references who can speak to the candidate’s character and leadership potential',
            ),
            Gap(16),

            // Additional Comments
            _buildTextArea(
              'Additional Comments',
              'Any additional information or specific reasons for nomination.',
            ),
            Gap(24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Submit Nomination",
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
        CustomLabel(title: label, fontSize: 13),
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
