import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1/data/contact_operations.dart';
import 'package:task_1/models/contact.dart';

class EditContactPage extends StatefulWidget {
  Contact contact;

  EditContactPage({Key key, this.contact})
      : super(
          key: key,
        );

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  ContactOperations contactOperations = ContactOperations();

  var _nameController = TextEditingController();
  var _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.contact.name;
    _surnameController.text = widget.contact.surname;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit & View Contacts'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Surname'),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    child: Text(
                      'View',
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'First Name: ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                _nameController.text,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Second Name: ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                _surnameController.text,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          widget.contact.name = _nameController.text;
          widget.contact.surname = _surnameController.text;

          contactOperations.updateContact(widget.contact);
        },
      ),
    );
  }
}
