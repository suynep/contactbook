import 'package:contact_book_v2/src/model/address.dart';
import 'package:contact_book_v2/src/model/contact.dart';
import 'package:contact_book_v2/src/model/email.dart';
import 'package:contact_book_v2/src/model/label.dart';
import 'package:contact_book_v2/src/model/phone.dart';
import 'package:contact_book_v2/src/screen/all_contacts.dart';
import 'package:contact_book_v2/src/screen/edit_contact.dart';
import 'package:contact_book_v2/src/widget/appbar.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatelessWidget {
  Contact contact;
  List<Contact> allContacts;

  ContactDetailsScreen({
    super.key,
    required this.contact,
    required this.allContacts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactDetailsCard(contact: contact, allContacts: allContacts),
      appBar: UniversalAppBar(title: "Contactbook"),
    );
  }
}

class ContactDetailsCard extends StatefulWidget {
  Contact contact;
  List<Contact> allContacts;

  ContactDetailsCard({
    super.key,
    required this.contact,
    required this.allContacts,
  });

  @override
  State<ContactDetailsCard> createState() => _ContactDetailsCardState();
}

class _ContactDetailsCardState extends State<ContactDetailsCard> {
  List<Widget> contactInfoColumn() {
    var widgets = <Widget>[];

    for (Email email in widget.contact.emails) {
      var rowWidget = SizedBox(
        width: 300,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [
            Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
            SizedBox(
              width: 200,
              child: Text(
                email.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              email.label == Label.home ? Icons.home : Icons.work,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      );

      widgets.add(rowWidget);
    }

    for (Phone phone in widget.contact.phones) {
      var rowWidget = SizedBox(
        width: 300,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.phone, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: 200, child: Text(phone.phone)),
            Icon(
              phone.label == Label.home ? Icons.home : Icons.work,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      );

      widgets.add(rowWidget);
    }

    for (Address address in widget.contact.addresses) {
      var rowWidget = SizedBox(
        width: 300,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.location_city_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 200, child: Text(address.address)),
            Icon(
              address.label == Label.home ? Icons.home : Icons.work,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      );

      widgets.add(rowWidget);
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage("assets/placeholder.jpg"),
              radius: 30,
            ),
            Text(
              widget.contact.name,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            ...contactInfoColumn(),

            ActionPanel(
              contact: widget.contact,
              allContacts: widget.allContacts,
            ),
          ],
        ),
      ),
    );
  }
}

class ActionPanel extends StatelessWidget {
  List<Contact> allContacts;
  Contact contact;

  ActionPanel({super.key, required this.allContacts, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,

        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            highlightColor: Theme.of(context).colorScheme.secondary,
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, size: 32),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContactScreen(
                    contact: contact,
                    allContacts: allContacts,
                  ),
                ),
              );
            },
            highlightColor: Theme.of(context).colorScheme.secondary,
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.edit, size: 32),
            ),
          ),
          InkWell(
            onTap: () {
              allContacts.removeWhere((e) => e.id == contact.id);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AllContactsScreen(contacts: allContacts),
                ),
              );

              var snackbar = SnackBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                content: Text("Deleted Successfully"),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            highlightColor: Theme.of(context).colorScheme.secondary,
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete, size: 32),
            ),
          ),
        ],
      ),
    );
  }
}
