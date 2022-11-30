import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workshop6/add_note.dart';
import 'package:workshop6/search.dart';
import 'package:workshop6/view_note.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(
      FirebaseAuth.instance.currentUser?.uid).collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchNotes(),
                ),
              );
            },
            child: Text(
              'SearchNotes',
              style: TextStyle(color: Colors.white),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<QuerySnapshot>(
              future: ref.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No notes'));
                  }
                  return Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        Map data = snapshot.data!.docs[index].data() as Map;
                        return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (context) => ViewNote(
                                      data: data,
                                      ref: snapshot
                                          .data!.docs[index].reference)))
                                  .then((value) {
                                setState(() {});
                              });
                            },
                            child: Card(
                              child: Text(data?['title']),
                            ));
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ]),
    );
  }
}
