import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1/data/contact_operations.dart';
import 'package:task_1/presentation/widgets/contact_list.dart';
import 'package:task_1/presentation/widgets/horizontal_button_bar.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key})
      : super(
          key: key,
        );

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ContactOperations contactOperations = ContactOperations();
  bool _showBackToTopButton = false;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 3), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Task 2')),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HorizontalButtonBar(),
            FutureBuilder(
              future: contactOperations.getAllContacts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print('error');
                var data = snapshot.data;
                return snapshot.hasData
                    ? ContactsList(data)
                    : new Center(
                        child: Text('You have no contacts'),
                      );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward),
              foregroundColor: Colors.red,
            ),
    );
  }
}
