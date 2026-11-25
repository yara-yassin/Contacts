import 'package:flutter/material.dart';
import 'package:project1/contacts/widgets/route_colors.dart';

class PreviewField extends StatelessWidget {
  const PreviewField({
    super.key,
    required this.value,
    required this.hint,
    required this.icon,
  });

  final String value;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF34445B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: RouteColors.gold, size: 16),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              value.isEmpty ? hint : value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: value.isEmpty ? RouteColors.hint : RouteColors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
