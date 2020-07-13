import 'package:flutter/material.dart';
import 'package:hugsmobileapp/services/auth.dart';
import 'package:hugsmobileapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homeList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().user,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
            },
            )
          ],
        ),
        body: HomeList()
      ),
    );
  }
}
