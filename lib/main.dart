import 'package:flutter/material.dart';
import 'package:task_1/presentation/pages/add_category_page.dart';
import 'package:task_1/presentation/pages/add__contact_page.dart';
import 'package:task_1/presentation/pages/contacts_page.dart';
import 'package:task_1/presentation/pages/edit_contact_page.dart';
import 'package:task_1/presentation/pages/search_contacts.dart';
import 'package:task_1/presentation/pages/search_contacts_by_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'task_1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homePage': (context) => ContactsPage(),
        '/addContactPage': (context) => AddContactPage(),
        '/edit': (context) => EditContactPage(),
        '/searchPage': (context) => SearchPage(),
        '/addCategoryPage': (context) => AddCategoryPage(),
        '/searchContactsByCategory': (context) => SearchContactsByCategory()
      },
      home: ContactsPage(),
    );
  }
}
