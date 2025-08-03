import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  final String initialCountryCode;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final bool filled;
  final EdgeInsetsGeometry padding;
  final BorderSide borderSide;

  const CustomPhoneField({
    super.key,
    required this.initialCountryCode,
    this.initialValue,
    this.onChanged,
    this.borderRadius = 15,
    this.filled = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IntlPhoneField(
        initialValue: initialValue,
        initialCountryCode: initialCountryCode,
        onChanged: (phone) => onChanged?.call(phone.completeNumber),
        decoration: InputDecoration(
          filled: filled,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: borderSide,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
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
