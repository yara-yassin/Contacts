import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'route_colors.dart';
import 'route_logo.dart';

class EmptyContacts extends StatelessWidget {
  const EmptyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset("assets/images/route_logo.png"),
            // const SizedBox(height: 28),
            Lottie.asset(
              'assets/animations/empty_list.json',
              width: 190,
              height: 190,
              repeat: true,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.contact_page_outlined,
                  size: 145,
                  color: RouteColors.gold,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'There is No Contacts Added Here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: RouteColors.gold,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
