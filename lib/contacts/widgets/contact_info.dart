import 'package:flutter/material.dart';
import 'package:project1/contacts/widgets/route_colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 13,
          color: RouteColors.darkBlue,
        ),

        const SizedBox(width: 4),

        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: RouteColors.darkBlue,
              fontSize: 9,
            ),
          ),
        ),
      ],
    );
  }
}