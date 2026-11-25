import 'package:flutter/material.dart';
import 'package:project1/contacts/widgets/preview_field.dart';

import 'route_colors.dart';

class ContactPreview extends StatelessWidget {
  const ContactPreview({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  final String name;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreviewField(
          value: name,
          hint: 'User Name',
          icon: Icons.person_outline,
        ),

        const SizedBox(height: 8),

        PreviewField(
          value: email,
          hint: 'User Email',
          icon: Icons.email_outlined,
        ),

        const SizedBox(height: 8),

        PreviewField(
          value: phone,
          hint: 'User Phone',
          icon: Icons.phone_outlined,
        ),
      ],
    );
  }
}
