import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart' as database;
import 'package:flutter/material.dart';

class FetchCategory extends StatefulWidget {
  const FetchCategory({super.key});

  @override
  State<FetchCategory> createState() => _FetchCategoryState();
  Widget listItem({required Map data}) {
    return ListTile(
      title: Text(data['key']),
      subtitle: Text(data['value'].toString()),
    );
  }
}

class _FetchCategoryState extends State<FetchCategory> {
  database.Query dbRef = database.FirebaseDatabase.instance.ref().child('');

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: dbRef,
      itemBuilder: (BuildContext context, database.DataSnapshot snapshot,
          Animation<double> animation, int index) {
        Map data = snapshot.value as Map;
        data['key'] = snapshot.key;
        return Container();
      },
    );
  }
}
