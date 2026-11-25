import 'package:flutter/material.dart';

import 'route_colors.dart';

class ContactTextField extends StatelessWidget {
  const ContactTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.validator,
    this.keyboardType,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,

      style: const TextStyle(color: RouteColors.white, fontSize: 14),

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: RouteColors.hint, fontSize: 13),

        prefixIcon: Icon(icon, color: RouteColors.gold, size: 20),

        filled: true,
        fillColor: const Color(0xFF34445B),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RouteColors.hint, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RouteColors.gold, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RouteColors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RouteColors.red),
        ),
      ),
    );
  }
}
