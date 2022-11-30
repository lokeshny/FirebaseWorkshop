import 'package:flutter/material.dart';

import 'firbase_service.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  FirebaseService firebaseService = FirebaseService();

  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Add notes here'),
        leading: IconButton(onPressed: () {
          FirebaseService.addNote(title!, description!);
          Navigator.pop(context);



        }, icon: Icon(Icons.add)),

      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Title"
            ),
            onChanged: (value){
              title = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: "Descrpiton"
            ),
            onChanged: (value){
              description = value;
            },
          ),
        ],
      ),
    );
  }
}
