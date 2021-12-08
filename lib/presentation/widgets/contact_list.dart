import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1/data/contact_operations.dart';
import 'package:task_1/models/contact.dart';
import 'package:task_1/presentation/pages/edit_contact_page.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts;
  ContactOperations contactOperations = ContactOperations();

  ContactsList(List<Contact> this.contacts, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('${contacts[index].id}'),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  width: 40,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ' ${contacts[index].id} ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${contacts[index].name}  ${contacts[index].surname}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditContactPage(
                                            contact: contacts[index],
                                          )));
                            },
                            color: Colors.orange,
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            onDismissed: (direction) {
              contactOperations.deleteContact(contacts[index]);
            },
          );
        },
      ),
    );
  }
}
