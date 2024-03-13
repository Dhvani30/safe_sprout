// contacts_feature.dart

import 'package:flutter/material.dart';
import 'contact_manager.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsFeature extends StatefulWidget {
  @override
  _ContactsFeatureState createState() => _ContactsFeatureState();
}

class _ContactsFeatureState extends State<ContactsFeature> {
  ContactManager _contactManager = ContactManager();
  List<Contact> allContacts = [];
  List<Contact> selectedContacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    List<Contact> contacts = await _contactManager.loadContacts();
    setState(() {
      allContacts = contacts;
    });
  }

  void toggleContactSelection(Contact contact) {
    setState(() {
      if (selectedContacts.contains(contact)) {
        selectedContacts.remove(contact);
      } else {
        selectedContacts.add(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Close Friends'),
      ),
      body: Column(
        children: [
          // Selected Contacts Section
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected Contacts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // Display selected contacts here
                for (Contact contact in selectedContacts)
                  ListTile(
                    title: Text(contact.displayName ?? ''),
                    // Customize the ListTile based on your needs
                    // Add onTap to handle contact deselection
                    onTap: () => toggleContactSelection(contact),
                  ),
              ],
            ),
          ),
          Divider(), // Divider between sections
          // Other Contacts Section
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Other Contacts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // Display other contacts here
                for (Contact contact in allContacts)
                  ListTile(
                    title: Text(contact.displayName ?? ''),
                    // Customize the ListTile based on your needs
                    // Add onTap to handle contact selection
                    onTap: () => toggleContactSelection(contact),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
