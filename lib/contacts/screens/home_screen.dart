import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../widgets/contact_card.dart';
import '../widgets/empty_contacts.dart';
import '../widgets/route_colors.dart';
import 'add_contact_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> _contacts = [];
  int _selectedIndex = 0;

  Future<void> _showAddContactSheet() async {
    final ContactModel? newContact = await showModalBottomSheet<ContactModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: RouteColors.darkBlue,
      barrierColor: Colors.black54,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddContactSheet(),
      ),
    );

    if (newContact != null && _contacts.length < 6) {
      setState(() {
        _contacts.add(newContact);
      });
    }
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _deleteLastContact() {
    if (_contacts.isEmpty) return;
    setState(() {
      _contacts.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: RouteColors.darkBlue,
        elevation: 0,
        title: Image.asset("assets/images/route_logo.png", width: 100),
        centerTitle: false,
        actions: [
          if (_contacts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Center(
                child: Text(
                  '${_contacts.length}/6',
                  style: const TextStyle(
                    color: RouteColors.gold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _selectedIndex == 0
          ? _buildContactsBody()
          : Center(
              child: Text(
                _selectedIndex == 1 ? 'Favorites' : 'Settings',
                style: const TextStyle(color: RouteColors.gold, fontSize: 22),
              ),
            ),
      floatingActionButton: _selectedIndex == 0
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_contacts.isNotEmpty)
                  FloatingActionButton(
                    heroTag: 'deleteLast',
                    onPressed: _deleteLastContact,
                    backgroundColor: RouteColors.red,
                    foregroundColor: RouteColors.white,
                    child: const Icon(Icons.delete),
                  ),
                if (_contacts.isNotEmpty) const SizedBox(height: 10),
                if (_contacts.length < 6)
                  FloatingActionButton(
                    heroTag: 'addContact',
                    onPressed: _showAddContactSheet,
                    backgroundColor: RouteColors.gold,
                    foregroundColor: RouteColors.darkBlue,
                    child: const Icon(Icons.add, size: 30),
                  ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF223044),
        selectedItemColor: RouteColors.gold,
        unselectedItemColor: RouteColors.hint,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildContactsBody() {
    if (_contacts.isEmpty) {
      return const EmptyContacts();
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
      itemCount: _contacts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        return ContactCard(
          contact: _contacts[index],
          onDelete: () => _deleteContact(index),
        );
      },
    );
  }
}
