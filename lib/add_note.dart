import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add notes here'),

      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Titel"
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Descrpiton"
            ),
          ),
        ],
      ),
    );
  }
}
