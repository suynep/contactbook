import 'package:contact_book_v2/src/mock/mock.dart';
import 'package:contact_book_v2/src/model/contact.dart';
import 'package:contact_book_v2/src/screen/all_contacts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContactBookApp());
}

class ContactBookApp extends StatelessWidget {
  const ContactBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    var contacts = <Contact>[];
    return MaterialApp(
      home: AllContactsScreen(contacts: contacts),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        fontFamily: "Manrope",
      ),
    );
  }
}
