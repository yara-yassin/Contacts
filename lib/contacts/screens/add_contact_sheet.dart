import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../models/contact_model.dart';
import '../widgets/contacts_field.dart';
import '../widgets/contact_preview.dart';
import '../widgets/route_colors.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _imagePath;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  void _updatePreview() {
    setState(() {});
  }

  void _saveContact() {
    if (!_formKey.currentState!.validate()) return;

    final contact = ContactModel(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      imagePath: _imagePath,
    );

    Navigator.pop(context, contact);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: RouteColors.hint,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Add New Contact',
                style: TextStyle(
                  color: RouteColors.gold,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  InkWell(
                    onTap: _pickImage,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 105,
                      height: 112,
                      decoration: BoxDecoration(
                        color: RouteColors.darkBlue,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: RouteColors.gold, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: _imagePath == null
                            ? Lottie.asset(
                                'assets/animations/image_picker.json',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 42,
                                    color: RouteColors.gold,
                                  );
                                },
                              )
                            : Image.file(File(_imagePath!), fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ContactPreview(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              ContactTextField(
                controller: _nameController,
                hint: 'Enter User Name',
                icon: Icons.person_outline,
                onChanged: (_) => _updatePreview(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the user name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              ContactTextField(
                controller: _emailController,
                hint: 'Enter User Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => _updatePreview(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the email';
                  }

                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value.trim())) {
                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              ContactTextField(
                controller: _phoneController,
                hint: 'Enter User Phone',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                onChanged: (_) => _updatePreview(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the phone number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _saveContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RouteColors.gold,
                    foregroundColor: RouteColors.darkBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Enter user',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
