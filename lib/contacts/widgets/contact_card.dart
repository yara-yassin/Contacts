import 'dart:io';

import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import 'contact_info.dart';
import 'route_colors.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact, required this.onDelete});

  final ContactModel contact;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: RouteColors.gold,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              child: contact.imagePath == null
                  ? Container(
                      color: RouteColors.lightBlue,
                      child: const Icon(
                        Icons.person,
                        size: 58,
                        color: RouteColors.darkBlue,
                      ),
                    )
                  : Image.file(
                      File(contact.imagePath!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: RouteColors.lightBlue,
                          child: const Icon(
                            Icons.person,
                            size: 58,
                            color: RouteColors.darkBlue,
                          ),
                        );
                      },
                    ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  contact.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: RouteColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 5),

                ContactInfo(icon: Icons.email, text: contact.email),

                const SizedBox(height: 3),

                ContactInfo(icon: Icons.phone, text: contact.phone),

                const SizedBox(height: 7),

                SizedBox(
                  height: 34,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 15),
                    label: const Text('Delete', style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RouteColors.red,
                      foregroundColor: RouteColors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
