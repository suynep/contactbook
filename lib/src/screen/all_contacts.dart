import 'package:contact_book_v2/src/model/contact.dart';
import 'package:contact_book_v2/src/screen/add_contact.dart';
import 'package:contact_book_v2/src/screen/contact_details.dart';
import 'package:contact_book_v2/src/widget/appbar.dart';
import 'package:flutter/material.dart';

class AllContactsScreen extends StatefulWidget {
  List<Contact> contacts;

  AllContactsScreen({super.key, required this.contacts});

  @override
  State<AllContactsScreen> createState() => _AllContactsScreenState();
}

class _AllContactsScreenState extends State<AllContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniversalAppBar(title: "Contactbook"),
      body: AllContactsListView(contacts: widget.contacts),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddContactCard(allContacts: widget.contacts),
              );
            },
          );
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}

class AllContactsListView extends StatefulWidget {
  List<Contact> contacts;

  AllContactsListView({super.key, required this.contacts});

  @override
  State<AllContactsListView> createState() => _AllContactsListViewState();
}

class _AllContactsListViewState extends State<AllContactsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: widget.contacts.isEmpty
          ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    "Press the ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryFixedDim,
                    ),
                  ),
                  Icon(
                    Icons.add_box,
                    color: Theme.of(context).colorScheme.secondaryFixedDim,
                  ),
                  Text(
                    " button to add a contact",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryFixedDim,
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              children: widget.contacts
                  .map(
                    (e) =>
                        ContactCard(contact: e, allContacts: widget.contacts),
                  )
                  .toList(),
            ),
    );
  }
}

class ContactCard extends StatefulWidget {
  Contact contact;
  List<Contact> allContacts;

  ContactCard({super.key, required this.contact, required this.allContacts});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          fontSize = 20;
        });
      },
      onExit: (event) {
        setState(() {
          fontSize = 16;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetailsScreen(
                contact: widget.contact,
                allContacts: widget.allContacts,
              ),
            ),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Icon(Icons.person),
                Text(
                  widget.contact.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
