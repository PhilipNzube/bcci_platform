import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  final String initialCountryCode;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const CustomPhoneField({
    super.key,
    required this.initialCountryCode,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: IntlPhoneField(
        initialValue: initialValue,
        initialCountryCode: initialCountryCode,
        onChanged: (phone) => onChanged?.call(phone.completeNumber),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          counterText: '',
        ),
        style: const TextStyle(
          fontFamily: 'GolosText',
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
